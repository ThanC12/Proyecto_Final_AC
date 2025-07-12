// Ruta: Models/Rol.cs
namespace LOGIN1.Models
{
    public class Rol
    {
        public int Id { get; set; }
        public string Nombre { get; set; }

        public List<Usuario> Usuarios { get; set; }
    }
}
