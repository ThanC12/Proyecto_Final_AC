﻿namespace LOGIN1.Models
{
    public class DetalleFactura
    {
        public int Id { get; set; }

        public int FacturaId { get; set; }
        public Factura Factura { get; set; }

        public int ProductoId { get; set; }
        public Producto Producto { get; set; }

        public int Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }
    }
}
