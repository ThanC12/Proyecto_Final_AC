﻿using System.ComponentModel.DataAnnotations;

namespace LOGIN1.Models
{
    public class Categoria
    {
        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }

        // Relación con productos (opcional)
        public ICollection<Producto>? Productos { get; set; }
    }
}
