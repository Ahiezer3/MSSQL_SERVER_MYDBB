USE [MyDBB]
GO
/****** Object:  Table [dbo].[Emisor]    Script Date: 16/01/2022 09:10:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emisor](
	[Id_Emisor] [int] IDENTITY(1,1) NOT NULL,
	[RFC_Emisor] [varchar](20) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Id_Usuario] [int] NOT NULL,
 CONSTRAINT [PK_Id_Emisor] PRIMARY KEY CLUSTERED 
(
	[Id_Emisor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ids_Consecutivos]    Script Date: 16/01/2022 09:10:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ids_Consecutivos](
	[Llave] [varchar](20) NOT NULL,
	[Id_Consecutivo] [int] NOT NULL,
	[Tabla] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ids_Consecutivos] PRIMARY KEY CLUSTERED 
(
	[Llave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operacion]    Script Date: 16/01/2022 09:10:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operacion](
	[Id_Operacion] [int] NOT NULL,
	[Fecha] [smalldatetime] NULL,
	[Subtotal] [money] NULL,
	[Descuento] [money] NULL,
	[Impuestos] [money] NULL,
	[Total] [money] NULL,
	[Id_Sucursal] [int] NULL,
	[Id_Tipo_Operacion] [int] NULL,
	[Id_Emisor] [int] NULL,
 CONSTRAINT [PK_Id_Operacion] PRIMARY KEY CLUSTERED 
(
	[Id_Operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partida]    Script Date: 16/01/2022 09:10:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partida](
	[Id_Partida] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [float] NULL,
	[Importe] [money] NULL,
	[Id_Operacion] [int] NOT NULL,
	[Id_Producto] [int] NOT NULL,
 CONSTRAINT [PK_Id_Partida] PRIMARY KEY CLUSTERED 
(
	[Id_Partida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 16/01/2022 09:10:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Precio_Unitario] [money] NULL,
	[Porcentaje_IEPS] [float] NULL,
	[Porcentaje_IVA] [float] NULL,
	[Porcentaje_Descuento] [float] NULL,
 CONSTRAINT [PK_Id_Producto] PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 16/01/2022 09:10:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[Id_Sucursal] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Id_Emisor] [int] NOT NULL,
 CONSTRAINT [PK_Id_Sucursal] PRIMARY KEY CLUSTERED 
(
	[Id_Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Operacion]    Script Date: 16/01/2022 09:10:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Operacion](
	[Id_Tipo_Operacion] [int] NOT NULL,
	[Tipo_Operacion] [varchar](8) NOT NULL,
 CONSTRAINT [PK_Tipo_Operacion] PRIMARY KEY CLUSTERED 
(
	[Id_Tipo_Operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 16/01/2022 09:10:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido_Paterno] [varchar](50) NOT NULL,
	[Apellido_Materno] [varchar](50) NOT NULL,
	[Usuario] [varchar](20) NOT NULL,
	[Contraseña] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Id_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vt_1_Obtener_Operaciones_Usuario1_Anual]    Script Date: 16/01/2022 09:10:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vt_1_Obtener_Operaciones_Usuario1_Anual]
AS

SELECT
	Usuario.Id_Usuario                    
	,Usuario.Nombre                      AS Nombre_Usuario
	,Usuario.Apellido_Paterno            AS Apellido_Paterno_Usuario
	,Usuario.Apellido_Materno            AS Apellido_Materno_Usuario
	,Emisor.Id_Emisor
	,Emisor.RFC_Emisor
	,Emisor.Nombre                       AS Nombre_Emisor
	,Sucursal.Id_Sucursal
	,Sucursal.Nombre                     AS Nombre_Sucursal
	,Operacion.Id_Operacion
	,CASE WHEN Operacion.Id_Tipo_Operacion = 1 THEN 'SUCURSAL' ELSE 'PÁGINA WEB' END AS Tipo_Operacion
	,Operacion.Fecha                    AS Fecha_Operacion
	,Operacion.Subtotal                 AS Subtotal_Operacion
	,Operacion.Descuento                AS Descuento_Operacion
	,Operacion.Impuestos                AS Impuestos_Operacion
	,Operacion.Total                    AS Total_Operacion
FROM dbo.Usuario AS Usuario INNER JOIN
dbo.Emisor AS Emisor ON Emisor.Id_Usuario = Usuario.Id_Usuario INNER JOIN
dbo.Sucursal AS Sucursal ON Sucursal.Id_Emisor = Emisor.Id_Emisor INNER JOIN
dbo.Operacion AS Operacion ON Operacion.Id_Sucursal = Sucursal.Id_Sucursal
WHERE Usuario.Id_Usuario = 1 AND
Sucursal.Id_Sucursal = 1 AND
DATEPART(YY,Operacion.Fecha) = DATEPART(YY,GETDATE()) 
GO
/****** Object:  View [dbo].[vt_2_Obtener_Top3_Productos_Vendidos_Operaciones_Usuario1_Anual]    Script Date: 16/01/2022 09:10:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vt_2_Obtener_Top3_Productos_Vendidos_Operaciones_Usuario1_Anual]
AS

WITH Agrupacion(Cantidad, Importe, Producto)
AS(
	SELECT TOP 3
		 SUM(Partida.Cantidad)     AS Producto
		,SUM(Partida.Importe)      AS Importe
		,MAX(Producto.Descripcion) AS Producto
	FROM dbo.Usuario AS Usuario INNER JOIN
    dbo.Emisor AS Emisor ON Emisor.Id_Usuario = Usuario.Id_Usuario INNER JOIN
	dbo.Sucursal AS Sucursal ON Sucursal.Id_Emisor = Emisor.Id_Emisor INNER JOIN
	dbo.Operacion AS Operacion ON Operacion.Id_Sucursal = Sucursal.Id_Sucursal INNER JOIN
	dbo.Partida AS Partida ON Partida.Id_Operacion = Operacion.Id_Operacion INNER JOIN
	dbo.Producto AS Producto ON Producto.Id_Producto = Partida.Id_Producto
	WHERE Usuario.Id_Usuario = 1 AND
	Sucursal.Id_Sucursal = 1 AND
	DATEPART(YY,Operacion.Fecha) = DATEPART(YY,GETDATE()) 
	GROUP BY Partida.Id_Producto
)


	SELECT TOP 100 PERCENT
		 Cantidad
		,Importe
		,Producto
	FROM Agrupacion
	ORDER BY Cantidad DESC, Importe DESC
GO
/****** Object:  View [dbo].[vt_3_Obtener_Productos_Vendidos_Emisor1]    Script Date: 16/01/2022 09:10:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vt_3_Obtener_Productos_Vendidos_Emisor1]
AS


	SELECT 
	     Partida.Id_Producto
		,SUM(Partida.Cantidad)      AS Cantidad
		,SUM(Partida.Importe)       AS Importe
		,CASE WHEN Operacion.Id_Tipo_Operacion = 1 THEN 'SUCURSAL' ELSE 'PÁGINA WEB' END  AS Sucursal
		,ISNULL(Sucursal.Nombre,'PÁGINA WEB')                                             AS Nombre_Sucursal
	FROM 
	dbo.Operacion AS Operacion INNER JOIN
	dbo.Partida AS Partida ON Partida.Id_Operacion = Operacion.Id_Operacion INNER JOIN
	dbo.Producto AS Producto ON Producto.Id_Producto = Partida.Id_Producto 
	OUTER APPLY(
		SELECT
			Nombre
		FROM dbo.Sucursal
		WHERE Operacion.Id_Sucursal = Id_Sucursal
	) AS Sucursal
	WHERE Operacion.Id_Emisor = 1 
	GROUP BY Partida.Id_Producto, Operacion.Id_Tipo_Operacion, Sucursal.Nombre

GO
SET IDENTITY_INSERT [dbo].[Emisor] ON 

INSERT [dbo].[Emisor] ([Id_Emisor], [RFC_Emisor], [Nombre], [Id_Usuario]) VALUES (1, N'TYXX010101000', N'Emisor 3', 1)
INSERT [dbo].[Emisor] ([Id_Emisor], [RFC_Emisor], [Nombre], [Id_Usuario]) VALUES (2, N'XAXX010101000', N'Emisor 1', 2)
INSERT [dbo].[Emisor] ([Id_Emisor], [RFC_Emisor], [Nombre], [Id_Usuario]) VALUES (3, N'XEXX010101000', N'Emisor 2', 2)
INSERT [dbo].[Emisor] ([Id_Emisor], [RFC_Emisor], [Nombre], [Id_Usuario]) VALUES (4, N'XGIX010101000', N'Emisor 5', 3)
INSERT [dbo].[Emisor] ([Id_Emisor], [RFC_Emisor], [Nombre], [Id_Usuario]) VALUES (5, N'BAXX010101000', N'Emisor 5', 1)
INSERT [dbo].[Emisor] ([Id_Emisor], [RFC_Emisor], [Nombre], [Id_Usuario]) VALUES (6, N'ERTY010101000,', N'Emisor 6', 5)
SET IDENTITY_INSERT [dbo].[Emisor] OFF
INSERT [dbo].[Ids_Consecutivos] ([Llave], [Id_Consecutivo], [Tabla]) VALUES (N'OP', 180, N'Operaciones')
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (1, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 123.9000, 2.5000, 5.6880, 127.0880, 9, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (2, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 250.0000, 25.0000, 56.8800, 281.8800, 10, 1, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (3, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 197.8000, 0.0000, 0.0000, 197.8000, 1, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (4, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 157.6000, 14.7650, 36.1087, 178.9437, 2, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (5, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 557.0000, 27.9600, 83.7375, 612.7775, 9, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (6, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 1560.7000, 27.5000, 62.5680, 1595.7680, 7, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (7, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 442.2000, 44.2200, 100.6093, 498.5893, 1, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (8, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 1172.6000, 18.3600, 41.7727, 1196.0127, 8, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (9, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 591.7000, 54.1950, 135.8812, 673.3862, 7, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (10, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 198.9000, 10.0000, 22.7520, 211.6520, 13, 1, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (11, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 816.2000, 2.5000, 5.6880, 819.3880, 7, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (12, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 424.0000, 32.4500, 98.9838, 490.5338, 10, 1, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (13, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 504.9000, 50.4900, 114.8749, 569.2849, 1, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (14, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 218.9000, 10.9450, 52.5711, 260.5261, 9, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (15, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 386.2000, 32.6500, 89.3774, 442.9274, 7, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (16, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 596.7000, 59.6700, 135.7612, 672.7912, 13, 1, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (17, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 1052.4000, 45.9000, 104.4317, 1110.9317, 13, 1, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (18, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 452.4000, 21.4800, 58.9327, 489.8527, 7, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (19, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 375.4000, 37.5400, 85.4110, 423.2710, 5, 1, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (20, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 575.4000, 57.5400, 130.9150, 648.7750, 10, 1, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (21, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 629.5000, 62.9500, 143.2238, 709.7738, 4, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (22, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 890.1000, 0.0000, 0.0000, 890.1000, 2, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (23, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 283.6000, 28.3600, 64.5247, 319.7647, 1, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (24, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 713.1000, 71.3100, 162.2445, 804.0345, 8, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (25, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 1212.8000, 81.7200, 185.9293, 1317.0093, 8, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (26, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 259.2000, 17.9600, 60.9855, 302.2255, 9, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (27, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 990.2000, 9.9500, 47.7918, 1028.0418, 1, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (28, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 99.5000, 4.9750, 23.8959, 118.4209, 13, 1, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (29, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 791.2000, 0.0000, 0.0000, 791.2000, 13, 1, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (30, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 861.7000, 36.7200, 83.5453, 908.5253, 10, 1, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (31, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 833.2000, 21.9900, 55.0624, 866.2724, 13, 1, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (32, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 274.0000, 17.4500, 64.8558, 321.4058, 10, 1, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (33, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 1583.0000, 4.9750, 23.8959, 1601.9209, 7, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (34, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 308.6000, 30.8600, 70.2127, 347.9527, 6, 1, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (35, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 512.1000, 24.4650, 73.2703, 560.9053, 5, 1, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (36, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 932.2000, 34.8150, 101.8494, 999.2344, 4, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (37, CAST(N'2022-01-16T20:45:00' AS SmallDateTime), 59.7000, 2.9850, 14.3376, 71.0526, 13, 1, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (38, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 688.5000, 68.8500, 156.6475, 776.2975, 8, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (39, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 791.2000, 0.0000, 0.0000, 791.2000, 10, 1, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (40, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1305.0000, 90.9400, 206.9067, 1420.9667, 4, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (41, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 421.3000, 42.1300, 95.8541, 475.0241, 9, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (42, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 139.8000, 11.9900, 32.3104, 160.1204, 4, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (43, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 819.8000, 67.0550, 190.2940, 943.0390, 7, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (44, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 844.1000, 29.9250, 105.8158, 919.9908, 13, 1, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (45, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 567.2000, 56.7200, 129.0493, 639.5293, 4, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (46, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 475.2000, 3.9800, 19.1167, 490.3367, 6, 1, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (47, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 434.6000, 35.5000, 100.8925, 499.9925, 6, 1, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (48, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 995.8000, 16.4800, 47.5567, 1026.8767, 9, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (49, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 416.3000, 27.7000, 98.2381, 486.8381, 4, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (50, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 75.0000, 7.5000, 17.0640, 84.5640, 6, 1, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (51, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 573.9000, 42.4650, 134.3468, 665.7818, 5, 1, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (52, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 199.0000, 9.9500, 47.7919, 236.8419, 4, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (53, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1218.5000, 22.9500, 52.2158, 1247.7658, 10, 1, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (54, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1190.1000, 59.6700, 135.7612, 1266.1912, 10, 1, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (55, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 119.4000, 5.9700, 28.6751, 142.1051, 13, 1, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (56, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 871.4000, 8.9550, 43.0127, 905.4577, 3, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (57, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 98.9000, 0.0000, 0.0000, 98.9000, 2, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (58, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 571.7000, 27.5000, 62.5680, 606.7680, 6, 1, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (59, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 588.8000, 46.9400, 136.9823, 678.8423, 8, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (60, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 99.5000, 4.9750, 23.8959, 118.4209, 4, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (61, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 534.1000, 40.4750, 124.7884, 618.4134, 2, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (62, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 534.0000, 53.4000, 121.4957, 602.0957, 8, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (63, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 593.4000, 0.0000, 0.0000, 593.4000, 13, 1, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (64, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 622.3000, 54.2700, 143.5980, 711.6280, 10, 1, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (65, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 200.0000, 20.0000, 45.5040, 225.5040, 10, 1, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (66, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 2512.9000, 6.9650, 33.4543, 2539.3893, 4, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (67, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 199.0000, 9.9500, 47.7919, 236.8419, 8, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (68, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1271.4000, 48.9550, 134.0207, 1356.4657, 9, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (69, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 105.6000, 7.5750, 24.7808, 122.8058, 2, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (70, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1119.6000, 22.9500, 52.2158, 1148.8658, 8, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (71, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1009.5000, 5.9700, 28.6752, 1032.2052, 2, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (72, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 867.3000, 17.5000, 39.8160, 889.6160, 6, 1, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (73, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 259.2000, 17.9600, 60.9855, 302.2255, 3, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (74, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 716.9000, 32.1300, 73.1022, 757.8722, 6, 1, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (75, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1204.3000, 41.3100, 93.9885, 1256.9785, 3, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (76, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1119.6000, 22.9500, 52.2158, 1148.8658, 8, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (77, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 593.4000, 0.0000, 0.0000, 593.4000, 13, 1, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (78, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 430.1000, 26.0950, 102.1325, 506.1375, 9, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (79, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1600.5000, 46.2850, 117.8844, 1672.0994, 9, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (80, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1080.8000, 9.1800, 20.8863, 1092.5063, 6, 1, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (81, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 579.8000, 23.3350, 65.6686, 622.1336, 3, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (82, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1140.1000, 25.0000, 56.8800, 1171.9800, 13, 1, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (83, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 500.0000, 50.0000, 113.7600, 563.7600, 10, 1, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (84, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 2119.0000, 73.4400, 167.0907, 2212.6507, 6, 1, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (85, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 519.4000, 45.9700, 119.6831, 593.1131, 8, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (86, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1267.7000, 87.2100, 198.4202, 1378.9102, 3, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (87, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 45.9000, 4.5900, 10.4432, 51.7532, 8, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (88, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 119.4000, 5.9700, 28.6751, 142.1051, 4, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (89, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 464.3000, 39.4650, 107.3983, 532.2333, 6, 1, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (90, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 314.3000, 24.4650, 73.2703, 363.1053, 8, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (91, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 453.1000, 26.4050, 107.8685, 534.5635, 3, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (92, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 137.7000, 13.7700, 31.3295, 155.2595, 13, 1, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (93, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 657.1000, 50.7850, 153.2765, 759.5915, 7, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (94, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 788.3000, 61.9150, 183.6302, 910.0152, 8, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (95, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 734.4000, 73.4400, 167.0907, 828.0507, 2, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (96, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 965.1000, 7.5000, 17.0640, 974.6640, 9, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (97, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1185.4000, 28.5350, 67.4382, 1224.3032, 8, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (98, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1231.9000, 34.1800, 77.7663, 1275.4863, 6, 1, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (99, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 59.7000, 2.9850, 14.3376, 71.0526, 7, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (100, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 634.0000, 63.4000, 144.2477, 714.8477, 2, 1, 1)
GO
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (101, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 75.0000, 7.5000, 17.0640, 84.5640, NULL, 2, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (102, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 835.3000, 49.8800, 123.5484, 908.9684, NULL, 2, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (103, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 470.6000, 7.5000, 17.0640, 480.1640, NULL, 2, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (104, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 495.9000, 31.6800, 117.3548, 581.5748, NULL, 2, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (105, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 304.6000, 26.4800, 70.3088, 348.4288, NULL, 2, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (106, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 604.9000, 60.4900, 137.6268, 682.0368, NULL, 2, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (107, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 634.4000, 33.7700, 76.8335, 677.4635, NULL, 2, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (108, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 513.1000, 51.3100, 116.7405, 578.5305, NULL, 2, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (109, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1151.9000, 50.8750, 128.3276, 1229.3526, NULL, 2, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (110, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 394.8000, 33.5100, 91.3341, 452.6241, NULL, 2, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (111, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 203.5000, 19.3550, 46.5519, 230.6969, NULL, 2, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (112, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 775.8000, 68.6250, 178.7739, 885.9489, NULL, 2, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (113, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 544.5000, 5.0000, 11.3760, 550.8760, NULL, 2, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (114, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 300.0000, 30.0000, 68.2560, 338.2560, NULL, 2, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (115, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 638.9000, 21.3450, 56.1103, 673.6653, NULL, 2, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (116, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 169.4000, 10.9700, 40.0511, 198.4811, NULL, 2, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (117, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1036.7000, 54.2200, 123.3613, 1105.8413, NULL, 2, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (118, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1062.1000, 18.1350, 63.8990, 1107.8640, NULL, 2, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (119, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 890.1000, 0.0000, 0.0000, 890.1000, NULL, 2, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (120, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 310.7000, 20.1250, 73.4574, 364.0324, NULL, 2, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (121, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 341.8000, 34.1800, 77.7663, 385.3863, NULL, 2, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (122, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 75.0000, 7.5000, 17.0640, 84.5640, NULL, 2, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (123, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 769.0000, 22.4750, 63.7119, 810.2369, NULL, 2, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (124, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 2179.1000, 59.6700, 135.7612, 2255.1912, NULL, 2, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (125, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1066.6000, 27.5400, 62.6590, 1101.7190, NULL, 2, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (126, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 780.3000, 78.0300, 177.5338, 879.8038, NULL, 2, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (127, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 546.3000, 45.6750, 126.5580, 627.1830, NULL, 2, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (128, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 139.3000, 6.9650, 33.4543, 165.7893, NULL, 2, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (129, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 819.5000, 32.5000, 73.9440, 860.9440, NULL, 2, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (130, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 197.8000, 0.0000, 0.0000, 197.8000, NULL, 2, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (131, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1066.6000, 27.5400, 62.6590, 1101.7190, NULL, 2, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (132, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 472.4000, 44.2550, 108.2351, 536.3801, NULL, 2, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (133, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 367.2000, 36.7200, 83.5453, 414.0253, NULL, 2, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (134, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 389.3000, 31.9650, 90.3343, 447.6693, NULL, 2, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (135, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 428.3000, 11.1700, 30.4447, 447.5747, NULL, 2, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (136, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 934.4000, 93.4400, 212.5947, 1053.5547, NULL, 2, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (137, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 558.1000, 50.8350, 128.2366, 635.5016, NULL, 2, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (138, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 534.3000, 1.9900, 9.5584, 541.8684, NULL, 2, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (139, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 19.9000, 0.9950, 4.7792, 23.6842, NULL, 2, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (140, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 479.6000, 43.9800, 110.1247, 545.7447, NULL, 2, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (141, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 175.0000, 17.5000, 39.8160, 197.3160, NULL, 2, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (142, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 608.6000, 60.8600, 138.4687, 686.2087, NULL, 2, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (143, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 861.5000, 75.2050, 198.7753, 985.0703, NULL, 2, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (144, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 645.8000, 50.6500, 150.4538, 745.6038, NULL, 2, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (145, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 321.3000, 32.1300, 73.1022, 362.2722, NULL, 2, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (146, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1812.1000, 44.6800, 121.7788, 1889.1988, NULL, 2, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (147, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 596.7000, 59.6700, 135.7612, 672.7912, NULL, 2, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (148, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 985.2000, 39.1800, 89.1423, 1035.1623, NULL, 2, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (149, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1107.0000, 34.5050, 96.1133, 1168.6083, NULL, 2, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (150, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 571.7000, 27.5000, 62.5680, 606.7680, NULL, 2, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (151, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1437.4000, 33.8950, 104.7869, 1508.2919, 1, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (152, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 538.6000, 49.8800, 123.5484, 612.2684, 5, 1, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (153, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 616.6000, 60.6650, 140.5404, 696.4754, 10, 1, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (154, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 211.2000, 15.1500, 49.5614, 245.6114, 3, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (155, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 119.4000, 5.9700, 28.6751, 142.1051, 9, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (156, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 120.9000, 12.0900, 27.5072, 136.3172, 1, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (157, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 478.0000, 28.9550, 88.5167, 537.5617, 2, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (158, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 773.1000, 13.9300, 66.9086, 826.0786, 6, 1, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (159, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1014.0000, 2.5000, 5.6880, 1017.1880, 1, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (160, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 378.1000, 18.9050, 90.8045, 449.9995, 3, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (161, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 784.1000, 9.1800, 20.8863, 795.8063, 4, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (162, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1020.7000, 22.9500, 52.2158, 1049.9658, 10, 1, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (163, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1405.1000, 5.9700, 28.6751, 1427.8051, 2, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (164, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 139.3000, 6.9650, 33.4543, 165.7893, 6, 1, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (165, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 792.3000, 10.0000, 22.7520, 805.0520, 9, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (166, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 174.5000, 12.4750, 40.9599, 202.9849, 4, 1, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (167, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 424.0000, 23.4950, 101.2477, 501.7527, 2, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (168, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 1186.8000, 0.0000, 0.0000, 1186.8000, 9, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (169, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 719.5000, 22.5000, 51.1920, 748.1920, 7, 1, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (170, CAST(N'2022-01-16T20:46:00' AS SmallDateTime), 361.1000, 34.1200, 82.6606, 409.6406, 1, 1, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (171, CAST(N'2022-01-16T20:49:00' AS SmallDateTime), 1000.6000, 60.4400, 162.6667, 1102.8267, NULL, 2, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (172, CAST(N'2022-01-16T20:49:00' AS SmallDateTime), 150.0000, 15.0000, 34.1280, 169.1280, NULL, 2, 3)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (173, CAST(N'2022-01-16T20:49:00' AS SmallDateTime), 197.8000, 0.0000, 0.0000, 197.8000, NULL, 2, 5)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (174, CAST(N'2022-01-16T20:49:00' AS SmallDateTime), 816.2000, 2.5000, 5.6880, 819.3880, NULL, 2, 6)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (175, CAST(N'2022-01-16T20:49:00' AS SmallDateTime), 413.1000, 41.3100, 93.9885, 465.7785, NULL, 2, 1)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (176, CAST(N'2022-01-16T20:49:00' AS SmallDateTime), 1066.6000, 27.5400, 62.6590, 1101.7190, NULL, 2, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (177, CAST(N'2022-01-16T20:49:00' AS SmallDateTime), 638.1000, 63.8100, 145.1805, 719.4705, NULL, 2, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (178, CAST(N'2022-01-16T20:49:00' AS SmallDateTime), 732.1000, 1.9900, 9.5584, 739.6684, NULL, 2, 4)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (179, CAST(N'2022-01-16T20:49:00' AS SmallDateTime), 752.6000, 7.9600, 38.2335, 782.8735, NULL, 2, 2)
INSERT [dbo].[Operacion] ([Id_Operacion], [Fecha], [Subtotal], [Descuento], [Impuestos], [Total], [Id_Sucursal], [Id_Tipo_Operacion], [Id_Emisor]) VALUES (180, CAST(N'2022-01-16T20:49:00' AS SmallDateTime), 1070.7000, 27.9500, 63.5918, 1106.3418, NULL, 2, 4)
SET IDENTITY_INSERT [dbo].[Partida] ON 

INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (1, 1, 98.9000, 1, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (2, 1, 28.1880, 1, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (3, 2, 56.3760, 2, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (4, 2, 56.3760, 2, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (5, 6, 169.1280, 2, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (6, 2, 197.8000, 3, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (7, 3, 155.2595, 4, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (8, 1, 23.6842, 4, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (9, 2, 197.8000, 5, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (10, 8, 225.5040, 5, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (11, 8, 189.4735, 5, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (12, 9, 890.1000, 6, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (13, 4, 395.6000, 6, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (14, 1, 28.1880, 6, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (15, 10, 281.8800, 6, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (16, 8, 414.0253, 7, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (17, 3, 84.5640, 7, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (18, 10, 989.0000, 8, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (19, 4, 207.0127, 8, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (20, 5, 118.4209, 9, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (21, 8, 414.0253, 9, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (22, 5, 140.9400, 9, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (23, 1, 98.9000, 10, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (24, 4, 112.7520, 10, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (25, 8, 791.2000, 11, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (26, 1, 28.1880, 11, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (27, 10, 236.8418, 12, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (28, 9, 253.6920, 12, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (29, 7, 362.2722, 13, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (30, 4, 207.0127, 13, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (31, 3, 71.0526, 14, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (32, 8, 189.4735, 14, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (33, 2, 103.5063, 15, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (34, 6, 142.1051, 15, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (35, 7, 197.3160, 15, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (36, 7, 362.2722, 16, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (37, 6, 310.5190, 16, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (38, 6, 593.4000, 17, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (39, 10, 517.5317, 17, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (40, 2, 197.8000, 18, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (41, 4, 94.7367, 18, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (42, 7, 197.3160, 18, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (43, 6, 310.5190, 19, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (44, 4, 112.7520, 19, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (45, 8, 225.5040, 20, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (46, 6, 310.5190, 20, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (47, 4, 112.7520, 20, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (48, 8, 225.5040, 21, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (49, 5, 258.7658, 21, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (50, 8, 225.5040, 21, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (51, 6, 593.4000, 22, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (52, 3, 296.7000, 22, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (53, 1, 51.7532, 23, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (54, 3, 155.2595, 23, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (55, 4, 112.7520, 23, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (56, 5, 258.7658, 24, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (57, 4, 207.0127, 24, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (58, 5, 140.9400, 24, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (59, 7, 197.3160, 24, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (60, 10, 281.8800, 25, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (61, 8, 414.0253, 25, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (62, 8, 225.5040, 25, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (63, 4, 395.6000, 25, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (64, 4, 112.7520, 26, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (65, 8, 189.4735, 26, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (66, 6, 142.1051, 27, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (67, 8, 791.2000, 27, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (68, 4, 94.7367, 27, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (69, 5, 118.4209, 28, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (70, 8, 791.2000, 29, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (71, 8, 414.0253, 30, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (72, 5, 494.5000, 30, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (73, 2, 47.3684, 31, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (74, 8, 225.5040, 31, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (75, 6, 593.4000, 31, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (76, 3, 84.5640, 32, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (77, 10, 236.8418, 32, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (78, 5, 118.4209, 33, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (79, 9, 890.1000, 33, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (80, 6, 593.4000, 33, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (81, 4, 207.0127, 34, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (82, 5, 140.9400, 34, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (83, 7, 165.7893, 35, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (84, 7, 197.3160, 35, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (85, 2, 197.8000, 35, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (86, 4, 207.0127, 36, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (87, 5, 494.5000, 36, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (88, 9, 213.1577, 36, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (89, 3, 84.5640, 36, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (90, 3, 71.0526, 37, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (91, 10, 517.5317, 38, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (92, 5, 258.7658, 38, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (93, 8, 791.2000, 39, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (94, 7, 197.3160, 40, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (95, 9, 465.7785, 40, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (96, 4, 395.6000, 40, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (97, 7, 362.2722, 40, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (98, 5, 258.7658, 41, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (99, 4, 112.7520, 41, 1)
GO
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (100, 2, 103.5063, 41, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (101, 2, 47.3684, 42, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (102, 4, 112.7520, 42, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (103, 9, 213.1577, 43, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (104, 7, 362.2722, 43, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (105, 6, 142.1051, 43, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (106, 8, 225.5040, 43, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (107, 6, 142.1051, 44, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (108, 9, 213.1577, 44, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (109, 6, 169.1280, 44, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (110, 4, 395.6000, 44, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (111, 8, 225.5040, 45, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (112, 8, 414.0253, 45, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (113, 4, 94.7367, 46, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (114, 4, 395.6000, 46, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (115, 8, 189.4735, 47, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (116, 6, 310.5190, 47, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (117, 4, 94.7367, 48, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (118, 5, 140.9400, 48, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (119, 8, 791.2000, 48, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (120, 5, 118.4209, 49, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (121, 3, 155.2595, 49, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (122, 9, 213.1577, 49, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (123, 3, 84.5640, 50, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (124, 7, 165.7893, 51, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (125, 8, 189.4735, 51, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (126, 6, 310.5190, 51, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (127, 1, 23.6842, 52, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (128, 7, 165.7893, 52, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (129, 2, 47.3684, 52, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (130, 10, 989.0000, 53, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (131, 3, 155.2595, 53, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (132, 2, 103.5063, 53, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (133, 7, 362.2722, 54, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (134, 4, 207.0127, 54, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (135, 6, 593.4000, 54, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (136, 2, 103.5063, 54, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (137, 6, 142.1051, 55, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (138, 9, 213.1577, 56, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (139, 7, 692.3000, 56, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (140, 1, 98.9000, 57, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (141, 8, 225.5040, 58, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (142, 3, 84.5640, 58, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (143, 3, 296.7000, 58, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (144, 3, 71.0526, 59, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (145, 7, 197.3160, 59, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (146, 7, 197.3160, 59, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (147, 9, 213.1577, 59, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (148, 5, 118.4209, 60, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (149, 6, 142.1051, 61, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (150, 6, 310.5190, 61, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (151, 7, 165.7893, 61, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (152, 3, 84.5640, 62, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (153, 1, 51.7532, 62, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (154, 9, 465.7785, 62, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (155, 6, 593.4000, 63, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (156, 9, 465.7785, 64, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (157, 3, 71.0526, 64, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (158, 2, 56.3760, 64, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (159, 5, 118.4209, 64, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (160, 8, 225.5040, 65, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (161, 7, 165.7893, 66, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (162, 10, 989.0000, 66, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (163, 9, 890.1000, 66, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (164, 5, 494.5000, 66, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (165, 3, 71.0526, 67, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (166, 7, 165.7893, 67, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (167, 7, 197.3160, 68, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (168, 7, 692.3000, 68, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (169, 9, 213.1577, 68, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (170, 9, 253.6920, 68, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (171, 1, 51.7532, 69, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (172, 3, 71.0526, 69, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (173, 5, 258.7658, 70, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (174, 3, 296.7000, 70, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (175, 6, 593.4000, 70, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (176, 9, 890.1000, 71, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (177, 3, 71.0526, 71, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (178, 3, 71.0526, 71, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (179, 7, 692.3000, 72, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (180, 7, 197.3160, 72, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (181, 4, 112.7520, 73, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (182, 8, 189.4735, 73, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (183, 4, 207.0127, 74, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (184, 4, 395.6000, 74, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (185, 3, 155.2595, 74, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (186, 9, 465.7785, 75, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (187, 8, 791.2000, 75, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (188, 5, 258.7658, 76, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (189, 9, 890.1000, 76, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (190, 6, 593.4000, 77, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (191, 9, 213.1577, 78, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (192, 1, 23.6842, 78, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (193, 7, 165.7893, 78, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (194, 2, 103.5063, 78, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (195, 9, 465.7785, 79, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (196, 5, 494.5000, 79, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (197, 6, 593.4000, 79, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (198, 5, 118.4209, 79, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (199, 2, 103.5063, 80, 3)
GO
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (200, 9, 890.1000, 80, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (201, 1, 98.9000, 80, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (202, 5, 118.4209, 81, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (203, 4, 207.0127, 81, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (204, 3, 296.7000, 81, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (205, 9, 890.1000, 82, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (206, 9, 253.6920, 82, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (207, 1, 28.1880, 82, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (208, 10, 281.8800, 83, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (209, 10, 281.8800, 83, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (210, 9, 890.1000, 84, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (211, 5, 494.5000, 84, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (212, 7, 362.2722, 84, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (213, 9, 465.7785, 84, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (214, 8, 225.5040, 85, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (215, 6, 142.1051, 85, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (216, 8, 225.5040, 85, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (217, 9, 465.7785, 86, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (218, 4, 395.6000, 86, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (219, 10, 517.5317, 86, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (220, 1, 51.7532, 87, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (221, 4, 94.7367, 88, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (222, 2, 47.3684, 88, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (223, 4, 112.7520, 89, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (224, 6, 142.1051, 89, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (225, 1, 23.6842, 89, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (226, 9, 253.6920, 89, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (227, 7, 165.7893, 90, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (228, 5, 140.9400, 90, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (229, 2, 56.3760, 90, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (230, 10, 236.8418, 91, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (231, 3, 84.5640, 91, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (232, 9, 213.1577, 91, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (233, 3, 155.2595, 92, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (234, 8, 189.4735, 93, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (235, 7, 165.7893, 93, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (236, 7, 197.3160, 93, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (237, 4, 207.0127, 93, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (238, 9, 213.1577, 94, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (239, 8, 189.4735, 94, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (240, 10, 281.8800, 94, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (241, 8, 225.5040, 94, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (242, 7, 362.2722, 95, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (243, 9, 465.7785, 95, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (244, 3, 84.5640, 96, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (245, 4, 395.6000, 96, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (246, 5, 494.5000, 96, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (247, 1, 23.6842, 97, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (248, 2, 103.5063, 97, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (249, 9, 890.1000, 97, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (250, 4, 207.0127, 97, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (251, 9, 890.1000, 98, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (252, 2, 103.5063, 98, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (253, 10, 281.8800, 98, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (254, 1, 23.6842, 99, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (255, 2, 47.3684, 99, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (256, 7, 197.3160, 100, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (257, 10, 517.5317, 100, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (258, 3, 84.5640, 101, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (259, 9, 465.7785, 102, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (260, 1, 51.7532, 102, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (261, 4, 94.7367, 102, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (262, 3, 296.7000, 102, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (263, 4, 395.6000, 103, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (264, 3, 84.5640, 103, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (265, 4, 94.7367, 104, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (266, 8, 189.4735, 104, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (267, 3, 155.2595, 104, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (268, 6, 142.1051, 104, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (269, 2, 47.3684, 105, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (270, 4, 112.7520, 105, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (271, 2, 47.3684, 105, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (272, 5, 140.9400, 105, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (273, 4, 112.7520, 106, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (274, 3, 155.2595, 106, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (275, 3, 155.2595, 106, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (276, 5, 258.7658, 106, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (277, 8, 225.5040, 107, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (278, 3, 155.2595, 107, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (279, 3, 296.7000, 107, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (280, 4, 112.7520, 108, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (281, 5, 258.7658, 108, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (282, 4, 207.0127, 108, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (283, 10, 517.5317, 109, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (284, 5, 118.4209, 109, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (285, 6, 593.4000, 109, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (286, 6, 310.5190, 110, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (287, 6, 142.1051, 110, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (288, 4, 207.0127, 111, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (289, 1, 23.6842, 111, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (290, 6, 142.1051, 112, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (291, 3, 71.0526, 112, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (292, 7, 362.2722, 112, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (293, 6, 310.5190, 112, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (294, 2, 56.3760, 113, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (295, 5, 494.5000, 113, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (296, 3, 84.5640, 114, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (297, 9, 253.6920, 114, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (298, 3, 71.0526, 115, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (299, 4, 395.6000, 115, 4)
GO
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (300, 4, 207.0127, 115, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (301, 6, 142.1051, 116, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (302, 2, 56.3760, 116, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (303, 2, 103.5063, 117, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (304, 5, 494.5000, 117, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (305, 6, 310.5190, 117, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (306, 7, 197.3160, 117, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (307, 9, 213.1577, 118, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (308, 8, 791.2000, 118, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (309, 2, 103.5063, 118, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (310, 9, 890.1000, 119, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (311, 9, 213.1577, 120, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (312, 2, 47.3684, 120, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (313, 2, 103.5063, 120, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (314, 2, 56.3760, 121, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (315, 2, 103.5063, 121, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (316, 8, 225.5040, 121, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (317, 3, 84.5640, 122, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (318, 5, 494.5000, 123, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (319, 5, 118.4209, 123, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (320, 7, 197.3160, 123, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (321, 7, 362.2722, 124, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (322, 8, 791.2000, 124, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (323, 8, 791.2000, 124, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (324, 6, 310.5190, 124, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (325, 8, 791.2000, 125, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (326, 6, 310.5190, 125, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (327, 6, 310.5190, 126, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (328, 5, 258.7658, 126, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (329, 6, 310.5190, 126, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (330, 8, 414.0253, 127, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (331, 9, 213.1577, 127, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (332, 7, 165.7893, 128, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (333, 8, 225.5040, 129, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (334, 5, 140.9400, 129, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (335, 5, 494.5000, 129, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (336, 2, 197.8000, 130, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (337, 8, 791.2000, 131, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (338, 6, 310.5190, 131, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (339, 6, 169.1280, 132, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (340, 3, 71.0526, 132, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (341, 3, 155.2595, 132, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (342, 5, 140.9400, 132, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (343, 8, 414.0253, 133, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (344, 7, 165.7893, 134, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (345, 10, 281.8800, 134, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (346, 2, 103.5063, 135, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (347, 2, 47.3684, 135, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (348, 3, 296.7000, 135, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (349, 9, 465.7785, 136, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (350, 7, 362.2722, 136, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (351, 8, 225.5040, 136, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (352, 5, 118.4209, 137, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (353, 4, 207.0127, 137, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (354, 2, 56.3760, 137, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (355, 9, 253.6920, 137, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (356, 2, 47.3684, 138, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (357, 5, 494.5000, 138, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (358, 1, 23.6842, 139, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (359, 6, 169.1280, 140, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (360, 10, 281.8800, 140, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (361, 4, 94.7367, 140, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (362, 2, 56.3760, 141, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (363, 2, 56.3760, 141, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (364, 3, 84.5640, 141, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (365, 10, 281.8800, 142, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (366, 7, 197.3160, 142, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (367, 4, 207.0127, 142, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (368, 5, 118.4209, 143, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (369, 6, 142.1051, 143, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (370, 6, 310.5190, 143, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (371, 8, 414.0253, 143, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (372, 10, 236.8418, 144, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (373, 8, 414.0253, 144, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (374, 4, 94.7367, 144, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (375, 7, 362.2722, 145, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (376, 8, 189.4735, 146, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (377, 8, 414.0253, 146, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (378, 9, 890.1000, 146, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (379, 4, 395.6000, 146, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (380, 3, 155.2595, 147, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (381, 10, 517.5317, 147, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (382, 5, 140.9400, 148, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (383, 6, 593.4000, 148, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (384, 2, 103.5063, 148, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (385, 7, 197.3160, 148, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (386, 6, 310.5190, 149, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (387, 7, 165.7893, 149, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (388, 7, 692.3000, 149, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (389, 3, 296.7000, 150, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (390, 7, 197.3160, 150, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (391, 4, 112.7520, 150, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (392, 5, 258.7658, 151, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (393, 10, 989.0000, 151, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (394, 8, 189.4735, 151, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (395, 3, 71.0526, 151, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (396, 4, 207.0127, 152, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (397, 4, 94.7367, 152, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (398, 6, 310.5190, 152, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (399, 9, 465.7785, 153, 3)
GO
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (400, 4, 207.0127, 153, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (401, 1, 23.6842, 153, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (402, 6, 142.1051, 154, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (403, 2, 103.5063, 154, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (404, 6, 142.1051, 155, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (405, 1, 51.7532, 156, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (406, 3, 84.5640, 156, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (407, 6, 169.1280, 157, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (408, 2, 56.3760, 157, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (409, 1, 98.9000, 157, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (410, 9, 213.1577, 157, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (411, 5, 494.5000, 158, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (412, 9, 213.1577, 158, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (413, 5, 118.4209, 158, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (414, 1, 28.1880, 159, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (415, 10, 989.0000, 159, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (416, 10, 236.8418, 160, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (417, 9, 213.1577, 160, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (418, 2, 103.5063, 161, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (419, 7, 692.3000, 161, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (420, 5, 258.7658, 162, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (421, 8, 791.2000, 162, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (422, 8, 791.2000, 163, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (423, 6, 142.1051, 163, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (424, 5, 494.5000, 163, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (425, 4, 94.7367, 164, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (426, 3, 71.0526, 164, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (427, 4, 112.7520, 165, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (428, 7, 692.3000, 165, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (429, 3, 84.5640, 166, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (430, 5, 118.4209, 166, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (431, 1, 51.7532, 167, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (432, 10, 236.8418, 167, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (433, 9, 213.1577, 167, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (434, 7, 692.3000, 168, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (435, 5, 494.5000, 168, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (436, 9, 253.6920, 169, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (437, 5, 494.5000, 169, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (438, 7, 362.2722, 170, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (439, 2, 47.3684, 170, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (440, 3, 296.7000, 171, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (441, 10, 236.8418, 171, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (442, 10, 517.5317, 171, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (443, 1, 51.7532, 171, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (444, 6, 169.1280, 172, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (445, 2, 197.8000, 173, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (446, 8, 791.2000, 174, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (447, 1, 28.1880, 174, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (448, 9, 465.7785, 175, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (449, 8, 791.2000, 176, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (450, 6, 310.5190, 176, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (451, 5, 140.9400, 177, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (452, 9, 465.7785, 177, 3)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (453, 4, 112.7520, 177, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (454, 2, 47.3684, 178, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (455, 7, 692.3000, 178, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (456, 6, 593.4000, 179, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (457, 8, 189.4735, 179, 2)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (458, 2, 56.3760, 180, 1)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (459, 8, 791.2000, 180, 4)
INSERT [dbo].[Partida] ([Id_Partida], [Cantidad], [Importe], [Id_Operacion], [Id_Producto]) VALUES (460, 5, 258.7658, 180, 3)
SET IDENTITY_INSERT [dbo].[Partida] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([Id_Producto], [Descripcion], [Precio_Unitario], [Porcentaje_IEPS], [Porcentaje_IVA], [Porcentaje_Descuento]) VALUES (1, N'PRODUCTO A', 25.0000, 8, 16, 10)
INSERT [dbo].[Producto] ([Id_Producto], [Descripcion], [Precio_Unitario], [Porcentaje_IEPS], [Porcentaje_IVA], [Porcentaje_Descuento]) VALUES (2, N'PRODUCTO B', 19.9000, 8, 16, 5)
INSERT [dbo].[Producto] ([Id_Producto], [Descripcion], [Precio_Unitario], [Porcentaje_IEPS], [Porcentaje_IVA], [Porcentaje_Descuento]) VALUES (3, N'PRODUCTO C', 45.9000, 8, 16, 10)
INSERT [dbo].[Producto] ([Id_Producto], [Descripcion], [Precio_Unitario], [Porcentaje_IEPS], [Porcentaje_IVA], [Porcentaje_Descuento]) VALUES (4, N'PRODUCTODC', 98.9000, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[Sucursal] ON 

INSERT [dbo].[Sucursal] ([Id_Sucursal], [Nombre], [Id_Emisor]) VALUES (1, N'Sucursal 1', 1)
INSERT [dbo].[Sucursal] ([Id_Sucursal], [Nombre], [Id_Emisor]) VALUES (2, N'Sucursal 2', 1)
INSERT [dbo].[Sucursal] ([Id_Sucursal], [Nombre], [Id_Emisor]) VALUES (3, N'Sucursal 3', 2)
INSERT [dbo].[Sucursal] ([Id_Sucursal], [Nombre], [Id_Emisor]) VALUES (4, N'Sucursal 4', 2)
INSERT [dbo].[Sucursal] ([Id_Sucursal], [Nombre], [Id_Emisor]) VALUES (5, N'Sucursal 5', 3)
INSERT [dbo].[Sucursal] ([Id_Sucursal], [Nombre], [Id_Emisor]) VALUES (6, N'Sucursal 6', 3)
INSERT [dbo].[Sucursal] ([Id_Sucursal], [Nombre], [Id_Emisor]) VALUES (7, N'Sucursal 7', 4)
INSERT [dbo].[Sucursal] ([Id_Sucursal], [Nombre], [Id_Emisor]) VALUES (8, N'Sucursal 8', 4)
INSERT [dbo].[Sucursal] ([Id_Sucursal], [Nombre], [Id_Emisor]) VALUES (9, N'Sucursal 9', 1)
INSERT [dbo].[Sucursal] ([Id_Sucursal], [Nombre], [Id_Emisor]) VALUES (10, N'Sucursal 10', 5)
INSERT [dbo].[Sucursal] ([Id_Sucursal], [Nombre], [Id_Emisor]) VALUES (13, N'Sucursal 11', 6)
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
INSERT [dbo].[Tipo_Operacion] ([Id_Tipo_Operacion], [Tipo_Operacion]) VALUES (1, N'SUCURSAL')
INSERT [dbo].[Tipo_Operacion] ([Id_Tipo_Operacion], [Tipo_Operacion]) VALUES (2, N'WEB')
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id_Usuario], [Nombre], [Apellido_Paterno], [Apellido_Materno], [Usuario], [Contraseña]) VALUES (1, N'Usuario Prueba', N'Prueba', N'Prueba', N'Usuario 1', N'UPS1')
INSERT [dbo].[Usuario] ([Id_Usuario], [Nombre], [Apellido_Paterno], [Apellido_Materno], [Usuario], [Contraseña]) VALUES (2, N'Abidan Ahiezer', N'Carranza', N'Talavera', N'abih45', N'cta34')
INSERT [dbo].[Usuario] ([Id_Usuario], [Nombre], [Apellido_Paterno], [Apellido_Materno], [Usuario], [Contraseña]) VALUES (3, N'Ruben', N'Salazar', N'Gutierrez', N'GtRS12', N'#456RT')
INSERT [dbo].[Usuario] ([Id_Usuario], [Nombre], [Apellido_Paterno], [Apellido_Materno], [Usuario], [Contraseña]) VALUES (4, N'Maria', N'Reyes', N'Dias', N'Mar_ZD', N'78qw_')
INSERT [dbo].[Usuario] ([Id_Usuario], [Nombre], [Apellido_Paterno], [Apellido_Materno], [Usuario], [Contraseña]) VALUES (5, N'José', N'Marin', N'Hernandez', N'HerJS', N'INT123')
INSERT [dbo].[Usuario] ([Id_Usuario], [Nombre], [Apellido_Paterno], [Apellido_Materno], [Usuario], [Contraseña]) VALUES (6, N'Rosa', N'Talavera', N'Dias', N'arevalt', N'sawea')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Emisor]  WITH CHECK ADD  CONSTRAINT [FK_Emisor_Id_Usuario] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuario] ([Id_Usuario])
GO
ALTER TABLE [dbo].[Emisor] CHECK CONSTRAINT [FK_Emisor_Id_Usuario]
GO
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD  CONSTRAINT [FK_Operacion_Id_Emisor] FOREIGN KEY([Id_Emisor])
REFERENCES [dbo].[Emisor] ([Id_Emisor])
GO
ALTER TABLE [dbo].[Operacion] CHECK CONSTRAINT [FK_Operacion_Id_Emisor]
GO
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD  CONSTRAINT [FK_Operacion_Id_Sucursal] FOREIGN KEY([Id_Sucursal])
REFERENCES [dbo].[Sucursal] ([Id_Sucursal])
GO
ALTER TABLE [dbo].[Operacion] CHECK CONSTRAINT [FK_Operacion_Id_Sucursal]
GO
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD  CONSTRAINT [FK_Operacion_Id_Tipo_Operacion] FOREIGN KEY([Id_Tipo_Operacion])
REFERENCES [dbo].[Tipo_Operacion] ([Id_Tipo_Operacion])
GO
ALTER TABLE [dbo].[Operacion] CHECK CONSTRAINT [FK_Operacion_Id_Tipo_Operacion]
GO
ALTER TABLE [dbo].[Partida]  WITH CHECK ADD  CONSTRAINT [FK_Partida_Id_Operacion] FOREIGN KEY([Id_Operacion])
REFERENCES [dbo].[Operacion] ([Id_Operacion])
GO
ALTER TABLE [dbo].[Partida] CHECK CONSTRAINT [FK_Partida_Id_Operacion]
GO
ALTER TABLE [dbo].[Partida]  WITH CHECK ADD  CONSTRAINT [FK_Partida_Id_Producto] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Producto] ([Id_Producto])
GO
ALTER TABLE [dbo].[Partida] CHECK CONSTRAINT [FK_Partida_Id_Producto]
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_Sucursal_Id_Emisor] FOREIGN KEY([Id_Emisor])
REFERENCES [dbo].[Emisor] ([Id_Emisor])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [FK_Sucursal_Id_Emisor]
GO
/****** Object:  StoredProcedure [dbo].[Generar_Operaciones]    Script Date: 16/01/2022 09:10:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Generar_Operaciones]
(
	@Id_Tipo_Operacion INT 
)
AS
BEGIN
    /*EL SIGUIENTE PROCEDIMIENTO ALMACENADO GENERA DE FORMA ALEATORIA UNA OPERACION
	CON USUARIO, EMISOR, SUCURSAL (SEGÚN EL CASO), GENERANDO PARTIDAS CALCULANDO LOS TOTALES
	DE ACUERDO A LOS DATOS DE CADA PRODUCTO
	RECIBE COMO PARAMETRO: Id_Tipo_Operacion:
    1 PARA SUCURSAL 
	2 PARA PAGINA WEB
	*/
	
	BEGIN TRANSACTION;

	BEGIN TRY
		

		DECLARE @Id_Operacion INT
		,@Id_Sucursal INT
		,@Id_Emisor INT
		,@Id_Usuario INT
		,@Total_Sucursales INT
		,@Total_Productos INT
		,@Total_Productos_Generar INT
		,@Contador_Productos_Generar INT = 1
		,@Subtotal_Operacion MONEY = 0
		,@Descuento_Operacion MONEY = 0
		,@Importe_Operacion MONEY = 0
		,@Impuestos_Operacion MONEY = 0
	

	    ----OBTNER ID CONSECUTIVO PARA LA OPERACION ACTUAL
		UPDATE dbo.Ids_Consecutivos
		SET @Id_Operacion = Id_Consecutivo = ISNULL(Id_Consecutivo,0) + 1
		WHERE Llave = 'OP'

		SELECT @Total_Productos = COUNT(1) FROM dbo.Producto
		----GENERAR CANTIDAD ALEATORIA DE PRODUCTOS A INSERTAR EN LA OPERACION
		SELECT @Total_Productos_Generar = ROUND(((@Total_Productos - 1) * RAND() + 1), 0)

		----OPERACION DESDE SUCURSAL
		IF @Id_Tipo_Operacion = 1
		BEGIN
		
			SELECT TOP 1 
				 @Id_Sucursal = Id_Sucursal
				,@Id_Emisor =  Id_Emisor  
			FROM dbo.Sucursal ORDER BY NEWID()

			SELECT @Id_Usuario = Id_Usuario FROM dbo.Emisor WHERE Id_Emisor = @Id_Emisor
		END

		----OPERACION DESDE WEB
		IF @Id_Tipo_Operacion = 2
		BEGIN
			SELECT TOP 1
			 @Id_Emisor =  Id_Emisor
			,@Id_Usuario = Id_Usuario 
			FROM dbo.Emisor ORDER BY NEWID()
		
		END

		----NO SE ENCUENTRA EL TIPO DE OPERACION
		IF @Id_Tipo_Operacion NOT IN(1,2)
		BEGIN
			RAISERROR (
				   N'EL tipo de operación no se identificó.', 
				   10, 
				   1  
			);
			RETURN;
		END

		---- INSERTAR OPERACION
		INSERT INTO [dbo].[Operacion]
           ([Id_Operacion]
           ,[Fecha]
           ,[Subtotal]
           ,[Descuento]
           ,[Impuestos]
           ,[Total]
           ,[Id_Sucursal]
           ,[Id_Tipo_Operacion]
		   ,[Id_Emisor])
     VALUES
           (@Id_Operacion
           ,GETDATE()
           ,0
           ,0
           ,0
           ,0
           ,@Id_Sucursal
           ,@Id_Tipo_Operacion
		   ,@Id_Emisor
		   )
	    ---- GENERAR PRODUCTOS ALEATOREAMENTE PARA INSERTAR EN LAS PARTIDAS
		WHILE @Contador_Productos_Generar <= @Total_Productos_Generar
		BEGIN

			DECLARE 
			       @Id_Producto INT
				  ,@Descripcion  VARCHAR(50)
				  ,@Precio_Unitario MONEY = 0
				  ,@Porcentaje_IEPS FLOAT = 0
				  ,@Porcentaje_IVA FLOAT = 0
				  ,@Porcentaje_Descuento FLOAT = 0
				  ,@Catidad FLOAT = 0
				  ,@Subtotal MONEY = 0
				  ,@Descuento MONEY = 0
				  ,@Importe MONEY = 0
				  ,@Impuestos MONEY = 0
				  ,@Total_IVA MONEY = 0
				  ,@Total_IEPS MONEY = 0
				

			SELECT TOP 1
			       @Id_Producto = Id_Producto
				  ,@Descripcion = Descripcion
				  ,@Precio_Unitario = ISNULL(Precio_Unitario,0)
				  ,@Porcentaje_IEPS = ISNULL(Porcentaje_IEPS,0)
				  ,@Porcentaje_IVA = ISNULL(Porcentaje_IVA,0)
				  ,@Porcentaje_Descuento = ISNULL(Porcentaje_Descuento,0)
				  ,@Catidad = ROUND(((10 - 1) * RAND() + 1), 0)
			FROM dbo.Producto
			ORDER BY NEWID()

			---- CALCULO DE TOTALES DE LA PARTIDA
			SET @Subtotal = @Catidad * @Precio_Unitario --100
			SET @Importe = @Subtotal --100
			SET @Descuento = (@Importe * (@Porcentaje_Descuento/100))--10
			SET @Importe = @Importe - @Descuento --90
			SET @Total_IEPS = (@Importe * (@Porcentaje_IEPS/100)) --IEPS 7.2
			SET @Importe = @Importe + @Total_IEPS --97.2
			SET @Total_IVA = (@Importe * (@Porcentaje_IVA/100)) --IVA 15.552
			SET @Importe = @Importe + @Total_IVA
			SET @Impuestos = @Total_IEPS + @Total_IVA
			
			----CALCULO DE TOTALES DE LA OPERACION
			SELECT @Subtotal_Operacion = @Subtotal_Operacion + @Subtotal
			,@Descuento_Operacion = @Descuento_Operacion + @Descuento
			,@Importe_Operacion = @Importe_Operacion + @Importe
			,@Impuestos_Operacion = @Impuestos_Operacion + @Impuestos
	
	        ----INSERTAR PARTIDA
			INSERT INTO [dbo].[Partida]
			   ([Cantidad]
			   ,[Importe]
			   ,[Id_Operacion]
			   ,[Id_Producto])
			 VALUES
				(@Catidad
				,@Importe
				,@Id_Operacion
				,@Id_Producto)

			SET @Contador_Productos_Generar = @Contador_Productos_Generar + 1 
		END
		
		---- ACTUALIZAR OPERACION
		UPDATE[dbo].[Operacion]
		SET 
		 [Subtotal] = @Subtotal_Operacion
		,[Descuento] = @Descuento_Operacion
		,[Impuestos] = @Impuestos_Operacion
		,[Total] = @Importe_Operacion
		WHERE [Id_Operacion] = @Id_Operacion
	
		----MOSTRAR RESUMEN
		SELECT @Id_Usuario AS Usuario
		,@Id_Emisor    AS Id_Emisor
		,@Id_Sucursal   AS Id_Sucursal
		,@Id_Operacion  AS Id_Operacion
		,CASE WHEN @Id_Tipo_Operacion = 1 THEN 'SUCURSAL' ELSE 'PAGINA WEB' END AS Tipo_Operacion
		,@Total_Productos_Generar AS Productos_Generados

		----FINALIZAR TRANSACCION
		IF @@TRANCOUNT > 0
		BEGIN
			COMMIT TRANSACTION;
		END

	END TRY
	BEGIN CATCH
	    ----DESHACER TRANSACCION
		DECLARE @Error  VARCHAR(MAX) = ERROR_MESSAGE()
		RAISERROR (
				   @Error, 
				   10, 
				   1  
		); 
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION;
		END
	END CATCH


END


/*


	EXEC dbo.Generar_Operaciones 2

*/
GO
/****** Object:  StoredProcedure [dbo].[Insertar_Emisor]    Script Date: 16/01/2022 09:10:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Insertar_Emisor]
(
	  @RFC_Emisor VARCHAR(20)
	 ,@Nombre VARCHAR(50)
     ,@Id_Usuario INT
)
AS
BEGIN
/*
	EL SIGUIENTE PROCEDIMIENTO ALMACENADO PERMITE INSERTAR LOS EMISORES, RECIBIENDO COMO PARÁMETROS:
	RFC_EMISOR (CLAVE PRIMARIA)
	NOMBRE
	ID USUARIO (RELACION COMOLLAVE FORÁNEA CON LA LLAVE PRIMARIA DE LA TABLA: USUARIO)

*/

	BEGIN TRY

	    SELECT  @Nombre = RTRIM(LTRIM(ISNULL(@Nombre,'')))
		,@RFC_Emisor = RTRIM(LTRIM(ISNULL(@RFC_Emisor,'')))
	    ,@Id_Usuario = RTRIM(LTRIM(ISNULL(@Id_Usuario,'')))
			   

		IF @Nombre = '' OR @RFC_Emisor = '' OR @Id_Usuario = ''
		BEGIN
			RAISERROR (
					   N'Deben llenarse todos los campos.', 
					   10, 
					   1  
			);

			RETURN
		END

		----VALIDA NO EXISTA EL RFC EMISOR EN LA TABLA EMISOR
		IF EXISTS(SELECT RFC_Emisor FROM dbo.Emisor WHERE RTRIM(LTRIM(RFC_Emisor)) = @RFC_Emisor)
		BEGIN
			RAISERROR (
					   N'El Emisor con este RFC ya existe.', 
					   10, 
					   1  
			);
		END
	----INSERTA EN LA TABLA EMISOR
	INSERT INTO [dbo].[Emisor]
           ([Nombre]
           ,[RFC_Emisor]
		   ,[Id_Usuario])
     VALUES
           (@Nombre
           ,@RFC_Emisor
		   ,@Id_Usuario
     )

		PRINT CONCAT('El Emisor con RFC: "',@RFC_Emisor,'" fue registrado con éxito.')
	END TRY

	BEGIN CATCH

		DECLARE @Error  VARCHAR(MAX) = ERROR_MESSAGE()
		RAISERROR (
				   @Error, 
				   10, 
				   1  
		);  
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[Insertar_Productos]    Script Date: 16/01/2022 09:10:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Insertar_Productos]
(
	   @Descripcion  VARCHAR(50)
	  ,@Precio_Unitario MONEY
	  ,@Porcentaje_IEPS FLOAT
	  ,@Porcentaje_IVA FLOAT
	  ,@Porcentaje_Descuento FLOAT
)
AS
BEGIN
/*
EL SIGUIENTE PROCEDIMIENTO ALMACENADO INSERTA LOS PRODUCTOS EN LA TABLA PRODUCTO CON LOS PARAMETROS:
DESCRIPCION
PRECIO UNITARIO
PORCENTAJE IEPS
PORCENTAJE IVA
PORCENTAJE DESCUENTO
*/
	BEGIN TRY

	    SELECT  @Descripcion = RTRIM(LTRIM(ISNULL(@Descripcion,'')))
	
			   

		IF @Descripcion = '' OR @Precio_Unitario IS NULL OR @Porcentaje_IEPS IS NULL OR @Porcentaje_IVA IS NULL OR @Porcentaje_Descuento IS NULL
		BEGIN
			RAISERROR (
					   N'Deben llenarse todos los campos.', 
					   10, 
					   1  
			);

			RETURN
		END


	

	INSERT INTO [dbo].[Producto]
           ([Descripcion]
           ,[Precio_Unitario]
           ,[Porcentaje_IEPS]
           ,[Porcentaje_IVA]
           ,[Porcentaje_Descuento])
     VALUES
           (@Descripcion
           ,@Precio_Unitario
           ,@Porcentaje_IEPS
           ,@Porcentaje_IVA
           ,@Porcentaje_Descuento)

		PRINT CONCAT('El Producto: "',@Descripcion,'" fue registrado con éxito.')
	END TRY

	BEGIN CATCH

		DECLARE @Error  VARCHAR(MAX) = ERROR_MESSAGE()
		RAISERROR (
				   @Error, 
				   10, 
				   1  
		);  
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[Insertar_Sucursal]    Script Date: 16/01/2022 09:10:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Insertar_Sucursal]
(
	 
	 @Nombre VARCHAR(50)
    ,@Id_Emisor INT
)
AS
BEGIN
/*
EL SIGUIENTE PROCEDIMIENTO ALMACENADO INSERTA LAS SUCURSALES EN LA TABLA SUCURSALES, CON LOS SUGIENTES PARAMETROS:
NOMBRE
ID EMISOR(RELACION DE LLAVE FORANEA, CON LA LLAVE PRIMARIA ID EMISOR DE LA TABLA EMISOR)

*/
	BEGIN TRY

	    SELECT  @Nombre = RTRIM(LTRIM(ISNULL(@Nombre,'')))
		,@Id_Emisor = RTRIM(LTRIM(ISNULL(@Id_Emisor,'')))
	
			   

		IF @Nombre = '' OR @Id_Emisor = '' 
		BEGIN
			RAISERROR (
					   N'Deben llenarse todos los campos.', 
					   10, 
					   1  
			);

			RETURN
		END


	INSERT INTO [dbo].[Sucursal]
           ([Nombre]
           ,[Id_Emisor])
     VALUES
           (@Nombre
           ,@Id_Emisor
     )

		PRINT CONCAT('La Sucursal: "',@Nombre,'" fue registrada con éxito.')
	END TRY

	BEGIN CATCH

		DECLARE @Error  VARCHAR(MAX) = ERROR_MESSAGE()
		RAISERROR (
				   @Error, 
				   10, 
				   1  
		);  
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[Insertar_Usuario]    Script Date: 16/01/2022 09:10:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Insertar_Usuario]
(
	 @Nombre VARCHAR(50)
    ,@Apellido_Paterno VARCHAR(50)
    ,@Apellido_Materno VARCHAR(50)
    ,@Usuario VARCHAR(20)
    ,@Contraseña VARCHAR(16)
)
AS
BEGIN
/*

EL SIGUIENTE PROCEDIMIENTO ALMACENADO INSERTA LOS USUARIOS EN LA TABLA USUARIO CON LOS SIGUIENTES PARAMETROS:
NOMBRE
APELLIDO PATERNO
APELLIDO MATERNO
USUARIO (LLAVE PRIMARIA)
CONTRASEÑA
*/
	BEGIN TRY

	    SELECT @Nombre = RTRIM(LTRIM(ISNULL(@Nombre,'')))
			   ,@Apellido_Paterno = RTRIM(LTRIM(ISNULL(@Apellido_Paterno,'')))
			   ,@Apellido_Materno = RTRIM(LTRIM(ISNULL(@Apellido_Materno,'')))
			   ,@Usuario = RTRIM(LTRIM(ISNULL(@Usuario,'')))
			   ,@Contraseña = RTRIM(LTRIM(ISNULL(@Contraseña,'')))

		IF @Nombre = '' OR @Apellido_Paterno = '' OR @Apellido_Materno = '' OR @Usuario = '' OR @Contraseña = ''
		BEGIN
			RAISERROR (
					   N'Deben llenarse todos los campos.', 
					   10, 
					   1  
			);

			RETURN
		END
		---- VERIFICAR NO EXISTA EL USUARIO EN LA TABLA USUARIO
		/*IF EXISTS(SELECT Usuario FROM dbo.Usuario WHERE RTRIM(TRIM(usuario)) = @Usuario)
		BEGIN
			RAISERROR (
					   N'El Usuario ya existe.', 
					   10, 
					   1  
			);
			RETURN
		END*/

		INSERT INTO [dbo].[Usuario]
			   ([Nombre]
			   ,[Apellido_Paterno]
			   ,[Apellido_Materno]
			   ,[Usuario]
			   ,[Contraseña])
		 VALUES
			   (@Nombre
			   ,@Apellido_Paterno
			   ,@Apellido_Materno
			   ,@Usuario
			   ,@Contraseña)

		PRINT CONCAT('Usuario: "',@Usuario,'" registrado con éxito.')
	END TRY

	BEGIN CATCH

		DECLARE @Error  VARCHAR(MAX) = ERROR_MESSAGE()
		RAISERROR (
				   @Error, 
				   10, 
				   1  
		);  
	END CATCH

END
GO
