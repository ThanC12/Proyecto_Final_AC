using System.ComponentModel.DataAnnotations;

namespace LOGIN1.Models
{
    public class Producto
    {
        public int Id { get; set; }

        [Required]
        public string Nombre { get; set; }

        [Required]
        [Range(0.01, 9999.99)]
        public decimal Precio { get; set; }

        public string? ImagenUrl { get; set; }

        [Required]
        public int Stock { get; set; }// <- Nuevo Campo


        [Required]
        public int CategoriaId { get; set; }

        // Relación (opcional si tienes una tabla de Categorías)
        public Categoria? Categoria { get; set; }
    }
}
