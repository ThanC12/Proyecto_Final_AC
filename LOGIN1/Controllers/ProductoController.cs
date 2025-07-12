using LOGIN1.Data;
using LOGIN1.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

namespace LOGIN1.Controllers
{
    [Authorize(Roles = "Administrador")]
    public class ProductoController : Controller
    {
        private readonly AppDbContext _context;

        public ProductoController(AppDbContext context)
        {
            _context = context;
        }

        // ========================
        // LISTADO DE PRODUCTOS (solo admin)
        // ========================
        public async Task<IActionResult> Index()
        {
            var productos = await _context.Productos.Include(p => p.Categoria).ToListAsync();
            return View(productos);
        }

        // ========================
        // FORMULARIO PARA CREAR PRODUCTO
        // ========================
        public IActionResult Create()
        {
            ViewBag.Categorias = _context.Categorias.ToList();
            return View();
        }

        // ========================
        // GUARDAR NUEVO PRODUCTO CON IMAGEN
        // ========================
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Producto producto, IFormFile Imagen)
        {
            if (ModelState.IsValid)
            {
                if (Imagen != null && Imagen.Length > 0)
                {
                    string rutaCarpeta = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/infruit");
                    string nombreArchivo = Guid.NewGuid().ToString() + Path.GetExtension(Imagen.FileName);
                    string rutaArchivo = Path.Combine(rutaCarpeta, nombreArchivo);

                    using (var stream = new FileStream(rutaArchivo, FileMode.Create))
                    {
                        await Imagen.CopyToAsync(stream);
                    }

                    producto.ImagenUrl = "/infruit/" + nombreArchivo;
                }

                _context.Add(producto);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            ViewBag.Categorias = _context.Categorias.ToList();
            return View(producto);
        }

        // ========================
        // FORMULARIO PARA EDITAR PRODUCTO
        // ========================
        public async Task<IActionResult> Editar(int? id)
        {
            if (id == null)
                return NotFound();

            var producto = await _context.Productos.FindAsync(id);
            if (producto == null)
                return NotFound();

            ViewBag.Categorias = _context.Categorias.ToList();
            return View(producto);
        }

        // ========================
        // GUARDAR CAMBIOS DE EDICIÓN (CON CAMBIO DE IMAGEN OPCIONAL)
        // ========================
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Editar(int id, Producto producto, IFormFile Imagen)
        {
            if (id != producto.Id)
                return NotFound();

            if (ModelState.IsValid)
            {
                try
                {
                    if (Imagen != null && Imagen.Length > 0)
                    {
                        string rutaCarpeta = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/infruit");
                        string nombreArchivo = Guid.NewGuid().ToString() + Path.GetExtension(Imagen.FileName);
                        string rutaArchivo = Path.Combine(rutaCarpeta, nombreArchivo);

                        using (var stream = new FileStream(rutaArchivo, FileMode.Create))
                        {
                            await Imagen.CopyToAsync(stream);
                        }

                        producto.ImagenUrl = "/infruit/" + nombreArchivo;
                    }

                    _context.Update(producto);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!_context.Productos.Any(e => e.Id == producto.Id))
                        return NotFound();
                    else
                        throw;
                }
                return RedirectToAction(nameof(Index));
            }

            ViewBag.Categorias = _context.Categorias.ToList();
            return View(producto);
        }

        // ========================
        // MOSTRAR CONFIRMACIÓN PARA ELIMINAR
        // ========================
        public async Task<IActionResult> Eliminar(int? id)
        {
            if (id == null)
                return NotFound();

            var producto = await _context.Productos
                .Include(p => p.Categoria)
                .FirstOrDefaultAsync(m => m.Id == id);

            if (producto == null)
                return NotFound();

            return View(producto);
        }

        // ========================
        // ELIMINAR DEFINITIVAMENTE EL PRODUCTO
        // ========================
        [HttpPost, ActionName("Eliminar")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var producto = await _context.Productos.FindAsync(id);
            if (producto != null)
            {
                _context.Productos.Remove(producto);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }
    }
}
