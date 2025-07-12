using System.ComponentModel.DataAnnotations;

namespace LOGIN1.ViewModels
{
    public class LoginVM
    {
        [Required, EmailAddress]
        public string Correo { get; set; }

        [Required]
        public string Clave { get; set; }
    }
}
