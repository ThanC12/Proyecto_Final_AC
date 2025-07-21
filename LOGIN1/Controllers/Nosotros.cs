//controlador para devolver la vista de nosotros
using Microsoft.AspNetCore.Mvc;
using LOGIN1.ViewModels;
namespace LOGIN1.Controllers
{
    public class NosotrosController : Controller
    {
        public IActionResult Nosotros()
        {
            return View();
        }
    }
}