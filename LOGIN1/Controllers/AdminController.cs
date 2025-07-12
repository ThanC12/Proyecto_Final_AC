using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

[Authorize(Roles = "Administrador")]
public class AdminController : Controller
{
    public IActionResult Panel()
    {
        return View();
    }
}
