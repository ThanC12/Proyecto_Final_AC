using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LOGIN1.Models
{
    public class Carrito
    {
        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage = "El ID del usuario es obligatorio.")]
        public int UsuarioId { get; set; }

        [Required(ErrorMessage = "El ID del producto es obligatorio.")]
        public int ProductoId { get; set; }

        [Required(ErrorMessage = "Debe especificar una cantidad.")]
        [Range(1, 100, ErrorMessage = "La cantidad debe estar entre 1 y 100.")]
        public int Cantidad { get; set; }

        [ForeignKey("ProductoId")]
        public virtual Producto Producto { get; set; } // Para EF Core (navegación)
    }
}
