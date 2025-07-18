USE [LOGIN1DB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 13/07/2025 12:03:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carritos]    Script Date: 13/07/2025 12:03:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carritos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[ProductoId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Carritos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 13/07/2025 12:03:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesFactura]    Script Date: 13/07/2025 12:03:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesFactura](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FacturaId] [int] NOT NULL,
	[ProductoId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_DetallesFactura] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 13/07/2025 12:03:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 13/07/2025 12:03:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[ImagenUrl] [nvarchar](max) NULL,
	[CategoriaId] [int] NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 13/07/2025 12:03:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 13/07/2025 12:03:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [nvarchar](50) NOT NULL,
	[Correo] [nvarchar](50) NOT NULL,
	[Clave] [nvarchar](50) NOT NULL,
	[RolId] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250521232512_Inicial', N'9.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250603141158_CrearTablaRoles', N'9.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250604010009_SincronizarModelo', N'9.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250604014446_CrearTablaProductosYCarrito', N'9.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250610082938_CrearTablaProductos', N'9.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250610145706_CrearTablaCategorias', N'9.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250613005759_AgregarStockAProducto', N'9.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250614211837_CrearFacturacion', N'9.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250614212448_CrearTablaFactura', N'9.0.5')
GO
SET IDENTITY_INSERT [dbo].[Carritos] ON 

INSERT [dbo].[Carritos] ([Id], [UsuarioId], [ProductoId], [Cantidad]) VALUES (3, 3, 1, 2)
INSERT [dbo].[Carritos] ([Id], [UsuarioId], [ProductoId], [Cantidad]) VALUES (34, 6, 1, 3)
INSERT [dbo].[Carritos] ([Id], [UsuarioId], [ProductoId], [Cantidad]) VALUES (35, 6, 4, 1)
SET IDENTITY_INSERT [dbo].[Carritos] OFF
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (1, N'Pulpas')
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (2, N'Jugos')
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (3, N'Mermelada')
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (4, N'frutas')
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (6, N'Aji')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[DetallesFactura] ON 

INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (1, 1, 1, 2, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (2, 2, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (3, 3, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (4, 4, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (5, 5, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (6, 6, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (7, 7, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (8, 8, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (9, 9, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (10, 10, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (11, 11, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (12, 12, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (13, 13, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (14, 14, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (15, 15, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (16, 16, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (17, 17, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (18, 18, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (19, 19, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (20, 19, 4, 1, CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (21, 19, 6, 1, CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (22, 19, 7, 1, CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (23, 19, 5, 1, CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (24, 20, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (25, 20, 4, 1, CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (26, 20, 6, 1, CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[DetallesFactura] ([Id], [FacturaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (27, 21, 1, 1, CAST(200.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[DetallesFactura] OFF
GO
SET IDENTITY_INSERT [dbo].[Facturas] ON 

INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (1, 5, CAST(N'2025-06-14T17:02:15.3264024' AS DateTime2), CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (2, 5, CAST(N'2025-06-14T17:03:19.9544566' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (3, 5, CAST(N'2025-06-14T17:28:32.5786649' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (4, 5, CAST(N'2025-06-14T17:37:10.0182711' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (5, 5, CAST(N'2025-06-14T17:49:49.3421025' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (6, 5, CAST(N'2025-06-14T17:53:10.2185050' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (7, 5, CAST(N'2025-06-14T17:55:38.0406678' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (8, 5, CAST(N'2025-06-14T17:57:42.4100417' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (9, 5, CAST(N'2025-06-14T17:58:43.2467354' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (10, 5, CAST(N'2025-06-14T18:05:32.4009059' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (11, 5, CAST(N'2025-06-14T18:10:32.2304777' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (12, 5, CAST(N'2025-06-14T18:12:02.0935846' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (13, 5, CAST(N'2025-06-14T19:30:24.2843191' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (14, 5, CAST(N'2025-06-14T20:11:30.4572956' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (15, 5, CAST(N'2025-06-15T10:04:30.1564118' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (16, 5, CAST(N'2025-06-15T10:27:02.2317029' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (17, 5, CAST(N'2025-06-15T10:39:08.1592339' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (18, 5, CAST(N'2025-06-15T20:23:44.7679083' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (19, 5, CAST(N'2025-06-16T20:25:43.3766050' AS DateTime2), CAST(210.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (20, 6, CAST(N'2025-06-17T18:54:56.5291897' AS DateTime2), CAST(205.00 AS Decimal(18, 2)))
INSERT [dbo].[Facturas] ([Id], [UsuarioId], [Fecha], [Total]) VALUES (21, 6, CAST(N'2025-07-11T20:18:07.4014907' AS DateTime2), CAST(200.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Facturas] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (1, N'Pulpa de Frutilla', CAST(200.00 AS Decimal(18, 2)), N'/infruit/pulpas/img1.png.png', 1, 0)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (3, N'Pulpa 1', CAST(2.50 AS Decimal(18, 2)), N'/infruit/pulpas/img.png.png', 1, 10)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (4, N'Pulpa 2', CAST(2.50 AS Decimal(18, 2)), N'/infruit/pulpas/img1.png.png', 1, 10)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (5, N'Pulpa 3', CAST(2.50 AS Decimal(18, 2)), N'/infruit/pulpas/img10.png.png', 1, 10)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (6, N'Pulpa 4', CAST(2.50 AS Decimal(18, 2)), N'/infruit/pulpas/img11.png.png', 1, 10)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (7, N'Pulpa 5', CAST(2.50 AS Decimal(18, 2)), N'/infruit/pulpas/img12.png.png', 1, 10)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (8, N'Pulpa 6', CAST(2.50 AS Decimal(18, 2)), N'/infruit/pulpas/img2.png.png', 1, 10)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (9, N'Pulpa 7', CAST(2.50 AS Decimal(18, 2)), N'/infruit/pulpas/img3.png.png', 1, 10)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (10, N'Pulpa 8', CAST(2.50 AS Decimal(18, 2)), N'/infruit/pulpas/img4.png.png', 1, 10)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (11, N'Pulpa 9', CAST(2.50 AS Decimal(18, 2)), N'/infruit/pulpas/img5.png.png', 1, 10)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (12, N'Pulpa 10', CAST(2.50 AS Decimal(18, 2)), N'/infruit/pulpas/img6.png.png', 1, 10)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (13, N'Jugo de fruta', CAST(1.80 AS Decimal(18, 2)), N'/infruit/jugos/img.png.png', 2, 15)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (14, N'Mermelada 1', CAST(3.00 AS Decimal(18, 2)), N'/infruit/mermelada/img.png.png', 3, 12)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (15, N'Mermelada 2', CAST(3.00 AS Decimal(18, 2)), N'/infruit/mermelada/img1.png.png', 3, 12)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (16, N'Mermelada 3', CAST(3.00 AS Decimal(18, 2)), N'/infruit/mermelada/img2.png.png', 3, 12)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (17, N'Mermelada 4', CAST(3.00 AS Decimal(18, 2)), N'/infruit/mermelada/img3.png.png', 3, 12)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (18, N'Mermelada 5', CAST(3.00 AS Decimal(18, 2)), N'/infruit/mermelada/img4.png.png', 3, 12)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (19, N'Mermelada 6', CAST(3.00 AS Decimal(18, 2)), N'/infruit/mermelada/img5.png.png', 3, 12)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (20, N'Mermelada 7', CAST(3.00 AS Decimal(18, 2)), N'/infruit/mermelada/img6.png.png', 3, 12)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (21, N'Mermelada 8', CAST(3.00 AS Decimal(18, 2)), N'/infruit/mermelada/img7.png.png', 3, 12)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (22, N'Mermelada 9', CAST(3.00 AS Decimal(18, 2)), N'/infruit/mermelada/img8.png.png', 3, 12)
INSERT [dbo].[Productos] ([Id], [Nombre], [Precio], [ImagenUrl], [CategoriaId], [Stock]) VALUES (23, N'Ají tradicional', CAST(1.50 AS Decimal(18, 2)), N'/infruit/aji/img.png.png', 4, 20)
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([Id], [Nombre]) VALUES (1, N'Administrador')
INSERT [dbo].[Rol] ([Id], [Nombre]) VALUES (2, N'Cliente')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [NombreCompleto], [Correo], [Clave], [RolId]) VALUES (3, N'Admin', N'admin@infruit.com', N'1234', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreCompleto], [Correo], [Clave], [RolId]) VALUES (4, N'jonathan1', N'jonathan1@hotmail.com', N'1234', 2)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreCompleto], [Correo], [Clave], [RolId]) VALUES (5, N'Jonathan Bravo', N'jona@hotmail.com', N'1234', 2)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreCompleto], [Correo], [Clave], [RolId]) VALUES (6, N'JONATHAN CORDERO', N'CORDERO@hotmail.com', N'1234', 2)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Productos] ADD  DEFAULT ((0)) FOR [CategoriaId]
GO
ALTER TABLE [dbo].[Productos] ADD  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [RolId]
GO
ALTER TABLE [dbo].[Carritos]  WITH CHECK ADD  CONSTRAINT [FK_Carritos_Productos_ProductoId] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Productos] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carritos] CHECK CONSTRAINT [FK_Carritos_Productos_ProductoId]
GO
ALTER TABLE [dbo].[DetallesFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetallesFactura_Facturas_FacturaId] FOREIGN KEY([FacturaId])
REFERENCES [dbo].[Facturas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetallesFactura] CHECK CONSTRAINT [FK_DetallesFactura_Facturas_FacturaId]
GO
ALTER TABLE [dbo].[DetallesFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetallesFactura_Productos_ProductoId] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Productos] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetallesFactura] CHECK CONSTRAINT [FK_DetallesFactura_Productos_ProductoId]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Usuario_UsuarioId] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([IdUsuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_Usuario_UsuarioId]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias_CategoriaId] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categorias] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias_CategoriaId]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol_RolId] FOREIGN KEY([RolId])
REFERENCES [dbo].[Rol] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol_RolId]
GO
