using LOGIN1.Models;

namespace LOGIN1.ViewModels
{
    public class FacturaDetalleVM
    {
        public Factura Factura { get; set; }
        public List<DetalleFactura> Detalles { get; set; }
    }
}
