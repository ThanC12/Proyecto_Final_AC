// Ubicación: Data/ApplicationDbContext.cs
using Microsoft.EntityFrameworkCore;
using LOGIN1.Models;

namespace LOGIN1.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Producto> Productos { get; set; }
        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Categoria> Categorias { get; set; }

        public DbSet<Rol> Roles { get; set; }
        // Agrega más DbSet según sea necesario
    }
}
