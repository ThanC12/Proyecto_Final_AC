using LOGIN1.Data;
using LOGIN1.Models;
using LOGIN1.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

public class UsuarioController : Controller
{

    
        private readonly AppDbContext _context;

    public UsuarioController(AppDbContext context)
    {
        _context = context;
    }

    // ==========================
    // MOSTRAR PRODUCTOS (público)
    // ==========================
    public IActionResult Producto()
    {
        var productos = _context.Productos
            .Include(p => p.Categoria)
            .ToList();

        return View("Producto", productos); //  No requiere login
    }

    // ==========================
    // MOSTRAR PRODUCTOS POR CATEGORÍA
    // ==========================
    public IActionResult PorCategoria(int id)
    {
        var productos = _context.Productos
            .Include(p => p.Categoria)
            .Where(p => p.CategoriaId == id)
            .ToList();

        ViewBag.NombreCategoria = _context.Categorias.Find(id)?.Nombre;
        return View("Producto", productos); //  Usa la misma vista
    }

    // ==========================
    // INICIO (requiere login)
    // ==========================
    public IActionResult Inicio()
    {
        var usuarioId = HttpContext.Session.GetInt32("UsuarioId");
        if (usuarioId == null)
            return RedirectToAction("Login", "Acceso");

        var productos = _context.Productos.ToList();
        ViewData["Usuario"] = HttpContext.Session.GetString("Nombre");
        return View("Inicio", productos);
    }

    // ==========================
    // AGREGAR PRODUCTO AL CARRITO (requiere login)
    // ==========================
    [HttpPost]
    public IActionResult AgregarAlCarrito(int productoId)
    {
        var usuarioId = HttpContext.Session.GetInt32("UsuarioId");
        if (usuarioId == null)
            return RedirectToAction("Login", "Acceso");

        var existente = _context.Carritos
            .FirstOrDefault(c => c.UsuarioId == usuarioId && c.ProductoId == productoId);

        if (existente != null)
        {
            existente.Cantidad++;
        }
        else
        {
            _context.Carritos.Add(new Carrito
            {
                UsuarioId = usuarioId.Value,
                ProductoId = productoId,
                Cantidad = 1
            });
        }

        _context.SaveChanges();
        return RedirectToAction("Producto");
    }

    // ==========================
    // VER CARRITO (requiere login)
    // ==========================
    public IActionResult VerCarrito()
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

    // ==========================
    // ELIMINAR DEL CARRITO
    // ==========================
    [HttpPost]
    public IActionResult EliminarDelCarrito(int id)
    {
        var item = _context.Carritos.Find(id);
        if (item != null)
        {
            _context.Carritos.Remove(item);
            _context.SaveChanges();
        }

        return RedirectToAction("VerCarrito");
    }

     // ==========================
    // Productos por Categria
    // ==========================
    

    public IActionResult ProductosPorCategoria(string categoria)
    {
        var productos = _context.Productos
            .Include(p => p.Categoria)
            .Where(p => p.Categoria.Nombre == categoria)
            .ToList();

        ViewBag.Categoria = categoria;
        return View(productos); // envía la lista de productos a la vista
    }

    

    // ==========================
    // OPCIONAL: Insertar productos de prueba
    // ==========================
    public IActionResult InsertarProductos()
    {
        if (!_context.Productos.Any())
        {
            var lista = new List<Producto>
                {
                    new Producto { Nombre = "Pulpa de Fresa", Precio = 2.5m, ImagenUrl = "/infruit/pulpas/img1.png.png", CategoriaId = 1 },
                    new Producto { Nombre = "Jugo de Mango", Precio = 3.0m, ImagenUrl = "/infruit/jugos/img1.png.png", CategoriaId = 2 }
                };
            _context.Productos.AddRange(lista);
            _context.SaveChanges();
        }

        return RedirectToAction("Producto");
    }
}

