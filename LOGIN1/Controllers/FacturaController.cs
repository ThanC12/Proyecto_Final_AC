using LOGIN1.Data;
using LOGIN1.Models;
using LOGIN1.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Rotativa.AspNetCore;

namespace LOGIN1.Controllers
{
    public class FacturaController : Controller
    {
        private readonly AppDbContext _context;

        public FacturaController(AppDbContext context)
        {
            _context = context;
        }

        // ✅ Mostrar resumen del carrito antes de comprar
        public IActionResult Confirmar()
        {
            var usuarioId = HttpContext.Session.GetInt32("UsuarioId");
            if (usuarioId == null)
                return RedirectToAction("Login", "Acceso");

            var carrito = _context.Carritos
                .Include(c => c.Producto)
                .Where(c => c.UsuarioId == usuarioId)
                .ToList();

            return View(carrito);
        }

        // ✅ Procesar compra y guardar factura + detalles
        [HttpPost]
        public IActionResult ProcesarPago(string tarjeta, string cvv)
        {
            var usuarioId = HttpContext.Session.GetInt32("UsuarioId");
            if (usuarioId == null)
                return RedirectToAction("Login", "Acceso");

            var carrito = _context.Carritos
                .Include(c => c.Producto)
                .Where(c => c.UsuarioId == usuarioId)
                .ToList();

            if (!carrito.Any())
                return RedirectToAction("Producto", "Usuario");

            // 💳 Crear factura principal
            var factura = new Factura
            {
                Fecha = DateTime.Now,
                UsuarioId = usuarioId.Value,
                Total = carrito.Sum(c => c.Cantidad * c.Producto.Precio)
            };

            _context.Facturas.Add(factura);
            _context.SaveChanges(); // Guardar para obtener factura.Id

            // 🧾 Detalles de factura
            var detalles = new List<DetalleFactura>();
            foreach (var item in carrito)
            {
                var detalle = new DetalleFactura
                {
                    FacturaId = factura.Id,
                    ProductoId = item.ProductoId,
                    Cantidad = item.Cantidad,
                    PrecioUnitario = item.Producto.Precio
                };
                _context.DetallesFactura.Add(detalle);
                detalles.Add(detalle);
            }

            // 🧹 Limpiar carrito del usuario
            _context.Carritos.RemoveRange(carrito);
            _context.SaveChanges();

            // ✅ Enviar factura + detalles a la vista de confirmación
            var vm = new FacturaDetalleVM
            {
                Factura = factura,
                Detalles = detalles
            };

            return View("Confirmacion", vm);
        }

        // ✅ Exportar la factura en PDF usando Rotativa y la misma ViewModel
        [HttpGet("Factura/ExportarPdf/{id}")]
        public IActionResult ExportarPdf(int id)
        {
            var factura = _context.Facturas
                .Include(f => f.Usuario)
                .Include(f => f.DetallesFactura)
                    .ThenInclude(d => d.Producto)
                .FirstOrDefault(f => f.Id == id);

            if (factura == null)
                return NotFound();

            var detalles = _context.DetallesFactura
                .Include(d => d.Producto)
                .Where(d => d.FacturaId == id)
                .ToList();

            var vm = new FacturaDetalleVM
            {
                Factura = factura,
                Detalles = detalles
            };

            return new Rotativa.AspNetCore.ViewAsPdf("FacturaPdf", vm);
        }

    }
}

