using Microsoft.AspNetCore.Mvc.Rendering;
using System.ComponentModel.DataAnnotations;

namespace LOGIN1.ViewModels
{
    public class UsuarioVM
    {
        [Required]
        public string NombreCompleto { get; set; } = string.Empty;

        [Required]
        [EmailAddress]
        public string Correo { get; set; } = string.Empty;

        [Required]
        public string Clave { get; set; } = string.Empty;

        [Required]
        [Compare("Clave", ErrorMessage = "Las contraseñas no coinciden")]
        public string ConfirmarClave { get; set; } = string.Empty;

        [Required(ErrorMessage = "Seleccione un rol")]
        public int RolId { get; set; }

        public List<SelectListItem> Roles { get; set; } = new();
    }
}
