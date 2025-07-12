using LOGIN1.Data;
using LOGIN1.Models;
using Microsoft.AspNetCore.Mvc;

public class CategoriaController : Controller
{
    private readonly AppDbContext _context;
    public CategoriaController(AppDbContext context)
    {
        _context = context;
    }

    public IActionResult Index()
    {
        var lista = _context.Categorias.ToList();
        return View(lista);
    }

    public IActionResult Create() => View();

    [HttpPost]
    public IActionResult Create(Categoria model)
    {
        if (ModelState.IsValid)
        {
            _context.Categorias.Add(model);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
        return View(model);
    }
    // GET: Categoria/Edit/5
    public IActionResult Edit(int id)
    {
        var categoria = _context.Categorias.Find(id);
        if (categoria == null)
            return NotFound();

        return View(categoria);
    }

    // POST: Categoria/Edit/5
    [HttpPost]
    [ValidateAntiForgeryToken]
    public IActionResult Edit(int id, Categoria model)
    {
        if (id != model.Id)
            return NotFound();

        if (ModelState.IsValid)
        {
            _context.Categorias.Update(model);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        return View(model);
    }
    // GET: Categoria/Delete/5
    public IActionResult Delete(int id)
    {
        var categoria = _context.Categorias.Find(id);
        if (categoria == null)
            return NotFound();

        return View(categoria);
    }

    // POST: Categoria/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public IActionResult DeleteConfirmed(int id)
    {
        var categoria = _context.Categorias.Find(id);
        if (categoria != null)
        {
            _context.Categorias.Remove(categoria);
            _context.SaveChanges();
        }

        return RedirectToAction("Index");
    }


}
