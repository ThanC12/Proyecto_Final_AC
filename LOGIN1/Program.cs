using LOGIN1.Data;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using Rotativa.AspNetCore;

var builder = WebApplication.CreateBuilder(args);

// 1. Servicios MVC + Sesión
builder.Services.AddControllersWithViews();
builder.Services.AddSession(); // Habilitar sesión para carrito, login, etc.

// 2. EF Core con SQL Server
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// 3. Autenticación con cookies
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.LoginPath = "/Acceso/Login";           // Redirige al login si no autenticado
        options.AccessDeniedPath = "/Acceso/Denegado"; // Vista de acceso denegado
    });

var app = builder.Build();

// 4. Manejo de errores para producción
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}

app.UseStaticFiles();       // Archivos CSS, JS, imágenes
app.UseRouting();           // Sistema de enrutamiento
app.UseSession();           // Activar sesión
app.UseAuthentication();    // Activar autenticación
app.UseAuthorization();     // Activar autorización

// 5. Rotativa (PDF) debe ir antes de app.Run()
app.UseRotativa(); // ✅ ¡ESTA LÍNEA DEBE IR AQUÍ!

// 6. Ruta por defecto
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

// 7. Ejecutar la app
app.Run();
