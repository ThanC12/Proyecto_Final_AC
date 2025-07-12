using Microsoft.EntityFrameworkCore;
using LOGIN1.Models;

namespace LOGIN1.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<Usuario> Usuarios { get; set; }

        public DbSet<Rol> Rol { get; set; }
        public DbSet<Producto> Productos { get; set; }
        public DbSet<Carrito> Carritos { get; set; }
        public DbSet<Categoria> Categorias { get; set; }
        public DbSet<Factura> Facturas { get; set; }
        public DbSet<DetalleFactura> DetallesFactura { get; set; }



        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Usuario>(tb =>
            {
                tb.HasKey(col => col.IdUsuario);

                tb.Property(col => col.IdUsuario)
                  .ValueGeneratedOnAdd(); // UseIdentityColumn es opcional

                tb.Property(col => col.NombreCompleto)
                  .HasMaxLength(50);

                tb.Property(col => col.Correo)
                  .HasMaxLength(50);

                tb.Property(col => col.Clave)
                  .HasMaxLength(50);
            });

            // Este paso es opcional si el nombre de la tabla ya es "Usuario"
            modelBuilder.Entity<Usuario>().ToTable("Usuario");
        }
    }
}
