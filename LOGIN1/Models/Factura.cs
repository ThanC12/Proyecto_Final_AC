using LOGIN1.Models;

public class Factura
{
    public int Id { get; set; }
    public int UsuarioId { get; set; }
    public DateTime Fecha { get; set; }
    public decimal Total { get; set; }

    //  Relación con Usuario (necesaria para que funcione el .Usuario en la vista)
    public Usuario? Usuario { get; set; }

    // Relación con detalles
    public ICollection<DetalleFactura>? DetallesFactura { get; set; }
}
