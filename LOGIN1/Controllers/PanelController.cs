using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

namespace LOGIN1.Controllers
{
    public class PanelController : Controller
    {
        [Authorize(Roles = "Administrador")]
        public IActionResult Admin()
        {
            // Muestra Views/Panel/Admin.cshtml correctamente
            return View("Panel");
        }
    }
}
