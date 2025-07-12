using LOGIN1.Data;
using LOGIN1.Models;
using LOGIN1.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Http;

// ✅ Para autenticación basada en cookies y claims
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using System.Security.Claims;

namespace LOGIN1.Controllers
{
    public class AccesoController : Controller
    {
        private readonly AppDbContext _context;

        public AccesoController(AppDbContext context)
        {
            _context = context;
        }

        // GET: Login
        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        // POST: Login
        [HttpPost]
        public async Task<IActionResult> Login(LoginVM model)
        {
            if (!ModelState.IsValid)
            {
                ViewData["Mensaje"] = "Datos inválidos. Verifica los campos.";
                return View(model);
            }

            //  Buscar usuario por correo y clave
            var usuario = _context.Usuarios
                .FirstOrDefault(u => u.Correo == model.Correo && u.Clave == model.Clave);

            if (usuario != null)
            {
                // ✅ Guardar datos básicos en sesión
                HttpContext.Session.SetString("Nombre", usuario.NombreCompleto);
                HttpContext.Session.SetInt32("UsuarioId", usuario.IdUsuario);
                HttpContext.Session.SetInt32("RolId", usuario.RolId);

                // ✅ Crear claims para autenticación basada en roles
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, usuario.NombreCompleto),
                    new Claim(ClaimTypes.Role, usuario.RolId == 1 ? "Administrador" : "Cliente")
                };

                var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                var principal = new ClaimsPrincipal(identity);

                //  Firmar sesión con cookies
                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal);

                //  Redirigir a URL previa si el sistema te envió aquí (ej. por falta de acceso)
                var returnUrl = Request.Query["ReturnUrl"].ToString();
                if (!string.IsNullOrEmpty(returnUrl))
                {
                    return Redirect(returnUrl);
                }

                //  Redirigir según el rol
                if (usuario.RolId == 1) // Admin
                    return RedirectToAction("Panel", "Admin");
                else
                    return RedirectToAction("Inicio", "Usuario");
            }

            ViewData["Mensaje"] = "Credenciales incorrectas.";
            return View(model);
        }

        // GET: Registrarse
        [HttpGet]
        public IActionResult Registrarse()
        {
            var vm = new UsuarioVM
            {
                Roles = new List<SelectListItem>() // Se deja vacío si el rol se asigna automáticamente
            };

            return View(vm);
        }

        // POST: Registrarse
        [HttpPost]
        public async Task<IActionResult> Registrarse(UsuarioVM modelo)
        {
            if (!ModelState.IsValid)
            {
                ViewData["Mensaje"] = "Por favor completa todos los campos requeridos.";
                return View(modelo);
            }

            if (modelo.Clave != modelo.ConfirmarClave)
            {
                ViewData["Mensaje"] = "Las contraseñas no coinciden.";
                return View(modelo);
            }

            // ✅ Crear nuevo usuario con RolId = 2 (Cliente)
            var nuevoUsuario = new Usuario
            {
                NombreCompleto = modelo.NombreCompleto,
                Correo = modelo.Correo,
                Clave = modelo.Clave,
                RolId = 2
            };

            await _context.Usuarios.AddAsync(nuevoUsuario);
            await _context.SaveChangesAsync();

            // ✅ Redirige si se guardó correctamente
            if (nuevoUsuario.IdUsuario != 0)
                return RedirectToAction("Login");

            ViewData["Mensaje"] = "Error al registrar el usuario.";
            return View(modelo);
        }

        // ✅ Cierre de sesión
        public async Task<IActionResult> Logout()
        {
            // Cerrar sesión de autenticación y limpiar la sesión de variables
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            HttpContext.Session.Clear();
            return RedirectToAction("Login");
        }

        // ✅ Vista para cuando un usuario intenta acceder sin autorización
        [HttpGet]
        public IActionResult Denegado()
        {
            return View();
        }
    }
}