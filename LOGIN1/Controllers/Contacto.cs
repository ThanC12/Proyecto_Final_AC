//controlador para devolver la vista de nosotros
using Microsoft.AspNetCore.Mvc;
using LOGIN1.ViewModels;
namespace LOGIN1.Controllers
{
    public class ContactoController : Controller
    {
        public IActionResult Contacto()
        {
            return View();
        }
    }
}