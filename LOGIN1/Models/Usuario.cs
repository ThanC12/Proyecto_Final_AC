using System.ComponentModel.DataAnnotations.Schema;

namespace LOGIN1.Models
{
    public class Usuario
    {
        public int IdUsuario { get; set; }
        public string NombreCompleto { get; set; }
        public string Correo { get; set; }
        public string Clave { get; set; }

        // Clave foránea
        public int RolId { get; set; }

        // Propiedad de navegación
        [ForeignKey("RolId")]
        public Rol Rol { get; set; }
    }
}
