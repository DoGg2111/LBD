USE [Farmacia]
GO
ALTER TABLE [dbo].[ticket] DROP CONSTRAINT [venta]
GO
ALTER TABLE [dbo].[ticket] DROP CONSTRAINT [ticket_medicamento]
GO
ALTER TABLE [dbo].[ticket] DROP CONSTRAINT [ticket_caja]
GO
ALTER TABLE [dbo].[Inventario_act] DROP CONSTRAINT [inventario_medicamento]
GO
ALTER TABLE [dbo].[Caja] DROP CONSTRAINT [empl_caja]
GO
ALTER TABLE [dbo].[Caja] DROP CONSTRAINT [caja_sucursal]
GO
ALTER TABLE [dbo].[ticket] DROP CONSTRAINT [Fech_Default]
GO
ALTER TABLE [dbo].[Inventario_act] DROP CONSTRAINT [reporte]
GO
/****** Object:  Index [INDX_Total_Venta]    Script Date: 10/31/2019 10:49:09 AM ******/
DROP INDEX [INDX_Total_Venta] ON [dbo].[ticket]
GO
/****** Object:  Index [INDX_Puestos]    Script Date: 10/31/2019 10:49:09 AM ******/
DROP INDEX [INDX_Puestos] ON [dbo].[puesto]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 10/31/2019 10:49:09 AM ******/
DROP TABLE [dbo].[ticket]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 10/31/2019 10:49:09 AM ******/
DROP TABLE [dbo].[Sucursal]
GO
/****** Object:  Table [dbo].[puesto]    Script Date: 10/31/2019 10:49:09 AM ******/
DROP TABLE [dbo].[puesto]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 10/31/2019 10:49:09 AM ******/
DROP TABLE [dbo].[Proveedores]
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 10/31/2019 10:49:09 AM ******/
DROP TABLE [dbo].[Medicamentos]
GO
/****** Object:  Table [dbo].[Inventario_act]    Script Date: 10/31/2019 10:49:09 AM ******/
DROP TABLE [dbo].[Inventario_act]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 10/31/2019 10:49:09 AM ******/
DROP TABLE [dbo].[empleados]
GO
/****** Object:  Table [dbo].[Caja]    Script Date: 10/31/2019 10:49:09 AM ******/
DROP TABLE [dbo].[Caja]
GO
USE [master]
GO
/****** Object:  Database [Farmacia]    Script Date: 10/31/2019 10:49:09 AM ******/
DROP DATABASE [Farmacia]
GO
/****** Object:  Database [Farmacia]    Script Date: 10/31/2019 10:49:09 AM ******/
CREATE DATABASE [Farmacia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Farmacia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Farmacia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Farmacia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Farmacia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Farmacia] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Farmacia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Farmacia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Farmacia] SET ARITHABORT OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Farmacia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Farmacia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Farmacia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Farmacia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Farmacia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Farmacia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Farmacia] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Farmacia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Farmacia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Farmacia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Farmacia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Farmacia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Farmacia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Farmacia] SET RECOVERY FULL 
GO
ALTER DATABASE [Farmacia] SET  MULTI_USER 
GO
ALTER DATABASE [Farmacia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Farmacia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Farmacia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Farmacia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Farmacia] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Farmacia', N'ON'
GO
ALTER DATABASE [Farmacia] SET QUERY_STORE = OFF
GO
USE [Farmacia]
GO
/****** Object:  Table [dbo].[Caja]    Script Date: 10/31/2019 10:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Caja](
	[caja_id] [int] NOT NULL,
	[sucursal_id] [int] NOT NULL,
	[empleado_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[caja_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Suc_Unic] UNIQUE NONCLUSTERED 
(
	[sucursal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 10/31/2019 10:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[empleados_id] [int] NOT NULL,
	[Nombre_emp] [varchar](50) NOT NULL,
	[Ap_pat_emp] [varchar](50) NOT NULL,
	[Ap_mat_emp] [varchar](50) NULL,
	[Fecha_nac_emp] [date] NOT NULL,
	[Nombre_completo_emp]  AS (((([Nombre_emp]+' ')+[Ap_pat_emp])+' ')+[Ap_mat_emp]),
	[Domicilio_emp] [varchar](150) NOT NULL,
	[Telefono_emp] [int] NOT NULL,
	[Correo_emp] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[empleados_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario_act]    Script Date: 10/31/2019 10:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario_act](
	[inventatio_act_id] [int] NOT NULL,
	[Medicamento_id] [int] NOT NULL,
	[Tipo_admn_id] [int] NOT NULL,
	[fecha_reporte] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[inventatio_act_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Medic_unic] UNIQUE NONCLUSTERED 
(
	[Medicamento_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 10/31/2019 10:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamentos](
	[medicamento_id] [int] NOT NULL,
	[Nombre_med] [varchar](60) NOT NULL,
	[Marca_med] [varchar](60) NOT NULL,
	[Nombre_y_Marca_med]  AS (([Nombre_med]+' de la marca: ')+[Marca_med]),
	[Cantidad_med] [varchar](30) NOT NULL,
	[Precio_venta_med] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[medicamento_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 10/31/2019 10:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[id_proveedor] [int] NULL,
	[nombre_prov] [varchar](50) NULL,
	[telefono_prov] [varchar](10) NULL,
	[correo_prov] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[puesto]    Script Date: 10/31/2019 10:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[puesto](
	[puesto_id] [int] NOT NULL,
	[Nombre_puesto] [varchar](50) NOT NULL,
	[Sueldo_pue] [int] NOT NULL,
	[turno_pue] [varchar](40) NOT NULL,
	[antiguedad_pue] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[puesto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 10/31/2019 10:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[sucursal_id] [int] NOT NULL,
	[Nombre_suc] [varchar](80) NOT NULL,
	[Direccion_suc] [varchar](120) NOT NULL,
	[Telefono_suc] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sucursal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 10/31/2019 10:49:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[ticket_id] [int] NOT NULL,
	[caja_id] [int] NOT NULL,
	[fecha_venta] [date] NOT NULL,
	[Medicamento_id] [int] NOT NULL,
	[precio_unitario] [int] NOT NULL,
	[Cantidad_med] [int] NOT NULL,
	[Total]  AS ([precio_unitario]*[Cantidad_med]),
PRIMARY KEY CLUSTERED 
(
	[ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Puestos]    Script Date: 10/31/2019 10:49:09 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Puestos] ON [dbo].[puesto]
(
	[Nombre_puesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [INDX_Total_Venta]    Script Date: 10/31/2019 10:49:09 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Total_Venta] ON [dbo].[ticket]
(
	[Total] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inventario_act] ADD  CONSTRAINT [reporte]  DEFAULT (getdate()) FOR [fecha_reporte]
GO
ALTER TABLE [dbo].[ticket] ADD  CONSTRAINT [Fech_Default]  DEFAULT (getdate()) FOR [fecha_venta]
GO
ALTER TABLE [dbo].[Caja]  WITH CHECK ADD  CONSTRAINT [caja_sucursal] FOREIGN KEY([sucursal_id])
REFERENCES [dbo].[Sucursal] ([sucursal_id])
GO
ALTER TABLE [dbo].[Caja] CHECK CONSTRAINT [caja_sucursal]
GO
ALTER TABLE [dbo].[Caja]  WITH CHECK ADD  CONSTRAINT [empl_caja] FOREIGN KEY([empleado_id])
REFERENCES [dbo].[empleados] ([empleados_id])
GO
ALTER TABLE [dbo].[Caja] CHECK CONSTRAINT [empl_caja]
GO
ALTER TABLE [dbo].[Inventario_act]  WITH CHECK ADD  CONSTRAINT [inventario_medicamento] FOREIGN KEY([Medicamento_id])
REFERENCES [dbo].[Medicamentos] ([medicamento_id])
GO
ALTER TABLE [dbo].[Inventario_act] CHECK CONSTRAINT [inventario_medicamento]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [ticket_caja] FOREIGN KEY([caja_id])
REFERENCES [dbo].[Caja] ([caja_id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [ticket_caja]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [ticket_medicamento] FOREIGN KEY([Medicamento_id])
REFERENCES [dbo].[Medicamentos] ([medicamento_id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [ticket_medicamento]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [venta] CHECK  (([Cantidad_med]>=(0)))
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [venta]
GO
USE [master]
GO
ALTER DATABASE [Farmacia] SET  READ_WRITE 
GO
