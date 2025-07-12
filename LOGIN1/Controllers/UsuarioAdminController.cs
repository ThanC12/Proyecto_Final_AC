using LOGIN1.Data;
using LOGIN1.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace LOGIN1.Controllers
{
    [Authorize(Roles = "Administrador")]
    public class UsuarioAdminController : Controller
    {
        private readonly AppDbContext _context;

        public UsuarioAdminController(AppDbContext context)
        {
            _context = context;
        }
        // GET: Crear usuario
        public IActionResult Create()
        {
            ViewBag.Roles = new SelectList(_context.Rol.ToList(), "Id", "Nombre");
            return View();
        }

        // POST: Crear usuario
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Usuario usuario)
        {
            if (ModelState.IsValid)
            {
                _context.Usuarios.Add(usuario);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }

            ViewBag.Roles = new SelectList(_context.Rol.ToList(), "Id", "Nombre", usuario.RolId);
            return View(usuario);
        }


        // GET: Listado de usuarios
        public IActionResult Index()
        {
            var usuarios = _context.Usuarios.Include(r => r.Rol).ToList();
            return View(usuarios);
        }

        // GET: Editar usuario
        public IActionResult Edit(int? id)
        {
            if (id == null)
                return NotFound();

            var usuario = _context.Usuarios.Find(id);
            if (usuario == null)
                return NotFound();

            return View(usuario);
        }

        // POST: Guardar edición
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, Usuario usuario)
        {
            if (id != usuario.IdUsuario)
                return NotFound();

            if (ModelState.IsValid)
            {
                _context.Update(usuario);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            return View(usuario);
        }

        // GET: Confirmar eliminación
        public IActionResult Delete(int? id)
        {
            if (id == null)
                return NotFound();

            var usuario = _context.Usuarios
                .Include(r => r.Rol)
                .FirstOrDefault(u => u.IdUsuario == id);

            if (usuario == null)
                return NotFound();

            return View(usuario);
        }

        // POST: Eliminar usuario
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int id)
        {
            var usuario = _context.Usuarios.Find(id);
            if (usuario != null)
            {
                _context.Usuarios.Remove(usuario);
                _context.SaveChanges();
            }
            return RedirectToAction(nameof(Index));
        }
    }
}