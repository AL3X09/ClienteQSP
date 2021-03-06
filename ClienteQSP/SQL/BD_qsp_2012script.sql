/*    ==ScriptingParameters==

    SourceServerVersion : SQL Server 2016 (13.0.4001)
    SourceDatabaseEngineEdition : Microsoft SQL Server Enterprise Edition
    SourceDatabaseEngineType : SQL Server independiente

    TargetServerVersion : SQL Server 2012
    TargetDatabaseEngineEdition : Microsoft SQL Server Standard Edition
    TargetDatabaseEngineType : SQL Server independiente
*/
USE [master]
GO
/****** Object:  Database [BD_Quiensepega]    Script Date: 13/11/2017 12:30:15 p. m. ******/
CREATE DATABASE [BD_Quiensepega]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_Quiensepega', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BD_Quiensepega.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_Quiensepega_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BD_Quiensepega_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BD_Quiensepega] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_Quiensepega].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_Quiensepega] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_Quiensepega] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_Quiensepega] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_Quiensepega] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_Quiensepega] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET RECOVERY FULL 
GO
ALTER DATABASE [BD_Quiensepega] SET  MULTI_USER 
GO
ALTER DATABASE [BD_Quiensepega] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_Quiensepega] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_Quiensepega] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_Quiensepega] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_Quiensepega', N'ON'
GO
USE [BD_Quiensepega]
GO
/****** Object:  User [quiensepega]    Script Date: 13/11/2017 12:30:16 p. m. ******/
CREATE USER [quiensepega] FOR LOGIN [quiensepega] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [quiensepega]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 13/11/2017 12:30:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[NombreEstado] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensajes]    Script Date: 13/11/2017 12:30:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensajes](
	[Id_mensaje] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_mensaje] [int] NOT NULL,
	[Tipo_mensaje] [nvarchar](50) NOT NULL,
	[Cuerpo_mensaje] [varchar](max) NOT NULL,
	[FKEstadoMensaje] [int] NOT NULL,
 CONSTRAINT [PK_Mensajes] PRIMARY KEY CLUSTERED 
(
	[Id_mensaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 13/11/2017 12:30:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[IdPermiso] [int] IDENTITY(1,1) NOT NULL,
	[NombrePermiso] [nvarchar](50) NOT NULL,
	[FKEstadoPermiso] [int] NOT NULL,
 CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED 
(
	[IdPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 13/11/2017 12:30:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [nvarchar](50) NOT NULL,
	[FKEstadoRol] [int] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesHasPermisos]    Script Date: 13/11/2017 12:30:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesHasPermisos](
	[IdRolHasPermiso] [int] IDENTITY(1,1) NOT NULL,
	[FKRole] [int] NOT NULL,
	[FKPermiso] [int] NOT NULL,
 CONSTRAINT [PK_RolesHasPermisos] PRIMARY KEY CLUSTERED 
(
	[IdRolHasPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 13/11/2017 12:30:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[CorreoUsuario] [nvarchar](100) NOT NULL,
	[ContraseniaUsuario] [varbinary](max) NOT NULL,
	[NombresUsuario] [nvarchar](50) NOT NULL,
	[ApellidosUsuaio] [nvarchar](100) NULL,
	[TelefonoUsuario] [nvarchar](50) NULL,
	[ImagenUsuario] [nvarchar](100) NULL,
	[FKEstadoUsuario] [int] NOT NULL,
	[FKRolUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewMensajes]    Script Date: 13/11/2017 12:30:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewMensajes]
AS
SELECT        dbo.Mensajes.*
FROM            dbo.Mensajes
GO
SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([IdEstado], [NombreEstado]) VALUES (1, N'Activo')
INSERT [dbo].[Estados] ([IdEstado], [NombreEstado]) VALUES (2, N'Inactivo')
INSERT [dbo].[Estados] ([IdEstado], [NombreEstado]) VALUES (3, N'Eliminado')
SET IDENTITY_INSERT [dbo].[Estados] OFF
SET IDENTITY_INSERT [dbo].[Mensajes] ON 

INSERT [dbo].[Mensajes] ([Id_mensaje], [Codigo_mensaje], [Tipo_mensaje], [Cuerpo_mensaje], [FKEstadoMensaje]) VALUES (6, 1001, N'error', N'el usuario ya existe', 1)
INSERT [dbo].[Mensajes] ([Id_mensaje], [Codigo_mensaje], [Tipo_mensaje], [Cuerpo_mensaje], [FKEstadoMensaje]) VALUES (7, 1002, N'error', N'El correo ya se encuentra regstrado', 1)
INSERT [dbo].[Mensajes] ([Id_mensaje], [Codigo_mensaje], [Tipo_mensaje], [Cuerpo_mensaje], [FKEstadoMensaje]) VALUES (8, 200, N'success', N'Operacion realizada con exito', 1)
INSERT [dbo].[Mensajes] ([Id_mensaje], [Codigo_mensaje], [Tipo_mensaje], [Cuerpo_mensaje], [FKEstadoMensaje]) VALUES (9, 201, N'error', N'El usuario no existe', 1)
INSERT [dbo].[Mensajes] ([Id_mensaje], [Codigo_mensaje], [Tipo_mensaje], [Cuerpo_mensaje], [FKEstadoMensaje]) VALUES (10, 202, N'error', N'Clave errada', 1)
INSERT [dbo].[Mensajes] ([Id_mensaje], [Codigo_mensaje], [Tipo_mensaje], [Cuerpo_mensaje], [FKEstadoMensaje]) VALUES (11, 203, N'success', N'Autenticacion exitosa', 1)
SET IDENTITY_INSERT [dbo].[Mensajes] OFF
SET IDENTITY_INSERT [dbo].[Permisos] ON 

INSERT [dbo].[Permisos] ([IdPermiso], [NombrePermiso], [FKEstadoPermiso]) VALUES (1, N'ver', 1)
INSERT [dbo].[Permisos] ([IdPermiso], [NombrePermiso], [FKEstadoPermiso]) VALUES (2, N'crear', 1)
INSERT [dbo].[Permisos] ([IdPermiso], [NombrePermiso], [FKEstadoPermiso]) VALUES (3, N'editar', 1)
SET IDENTITY_INSERT [dbo].[Permisos] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([IdRol], [NombreRol], [FKEstadoRol]) VALUES (1, N'Administrador', 1)
INSERT [dbo].[Roles] ([IdRol], [NombreRol], [FKEstadoRol]) VALUES (2, N'Estudiante', 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IdUsuario], [CorreoUsuario], [ContraseniaUsuario], [NombresUsuario], [ApellidosUsuaio], [TelefonoUsuario], [ImagenUsuario], [FKEstadoUsuario], [FKRolUsuario]) VALUES (1, N'al@por.com', 0x01000000B973D652EE0D677435F65F7AA63216B865FEB7B78A96D17BC96B0114B8988F39316879DAE9F7CB59, N'nombres', N'apellidos', N'0000000', N'', 1, 2)
INSERT [dbo].[Usuarios] ([IdUsuario], [CorreoUsuario], [ContraseniaUsuario], [NombresUsuario], [ApellidosUsuaio], [TelefonoUsuario], [ImagenUsuario], [FKEstadoUsuario], [FKRolUsuario]) VALUES (10, N'al@port.com', 0x010000002FFFDD1073A93D212ED804079D0FC0C429A915F63BFB220591E88CADE2C0191C9DC4EE3F050DEB32, N'nooo', N'aadmkasknd', N'0000000', N'', 1, 2)
INSERT [dbo].[Usuarios] ([IdUsuario], [CorreoUsuario], [ContraseniaUsuario], [NombresUsuario], [ApellidosUsuaio], [TelefonoUsuario], [ImagenUsuario], [FKEstadoUsuario], [FKRolUsuario]) VALUES (11, N'alll@por.com', 0x01000000D56ED32622B4716790AE915B6EBF8DE560D7E2BEC088C2DE5B0FB0C0375275C807ED1E224C8FFB5B, N'nooo', N'aadmkasknd', NULL, N'/img/avatar.jpg', 1, 2)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
/****** Object:  Index [IX_FK_MensajesEstados]    Script Date: 13/11/2017 12:30:16 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_FK_MensajesEstados] ON [dbo].[Mensajes]
(
	[FKEstadoMensaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PermisosEstados]    Script Date: 13/11/2017 12:30:16 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_FK_PermisosEstados] ON [dbo].[Permisos]
(
	[FKEstadoPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RolesEstados]    Script Date: 13/11/2017 12:30:16 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_FK_RolesEstados] ON [dbo].[Roles]
(
	[FKEstadoRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RolesHasPermisosPermisos]    Script Date: 13/11/2017 12:30:16 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_FK_RolesHasPermisosPermisos] ON [dbo].[RolesHasPermisos]
(
	[FKPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RolesHasPermisosRoles]    Script Date: 13/11/2017 12:30:16 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_FK_RolesHasPermisosRoles] ON [dbo].[RolesHasPermisos]
(
	[FKRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UsuariosEstados]    Script Date: 13/11/2017 12:30:16 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_FK_UsuariosEstados] ON [dbo].[Usuarios]
(
	[FKEstadoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UsuariosRoles]    Script Date: 13/11/2017 12:30:16 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_FK_UsuariosRoles] ON [dbo].[Usuarios]
(
	[FKRolUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Mensajes]  WITH CHECK ADD  CONSTRAINT [FK_MensajesEstados] FOREIGN KEY([FKEstadoMensaje])
REFERENCES [dbo].[Estados] ([IdEstado])
GO
ALTER TABLE [dbo].[Mensajes] CHECK CONSTRAINT [FK_MensajesEstados]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_PermisosEstados] FOREIGN KEY([FKEstadoPermiso])
REFERENCES [dbo].[Estados] ([IdEstado])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_PermisosEstados]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_RolesEstados] FOREIGN KEY([FKEstadoRol])
REFERENCES [dbo].[Estados] ([IdEstado])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_RolesEstados]
GO
ALTER TABLE [dbo].[RolesHasPermisos]  WITH CHECK ADD  CONSTRAINT [FK_RolesHasPermisosPermisos] FOREIGN KEY([FKPermiso])
REFERENCES [dbo].[Permisos] ([IdPermiso])
GO
ALTER TABLE [dbo].[RolesHasPermisos] CHECK CONSTRAINT [FK_RolesHasPermisosPermisos]
GO
ALTER TABLE [dbo].[RolesHasPermisos]  WITH CHECK ADD  CONSTRAINT [FK_RolesHasPermisosRoles] FOREIGN KEY([FKRole])
REFERENCES [dbo].[Roles] ([IdRol])
GO
ALTER TABLE [dbo].[RolesHasPermisos] CHECK CONSTRAINT [FK_RolesHasPermisosRoles]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosEstados] FOREIGN KEY([FKEstadoUsuario])
REFERENCES [dbo].[Estados] ([IdEstado])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_UsuariosEstados]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosRoles] FOREIGN KEY([FKRolUsuario])
REFERENCES [dbo].[Roles] ([IdRol])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_UsuariosRoles]
GO
/****** Object:  StoredProcedure [dbo].[SP_Ingresar]    Script Date: 13/11/2017 12:30:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CIndy Rodr�guez
-- Create date: 2017-11-06
-- Description:	Valida Usuario
-- =============================================
CREATE PROCEDURE [dbo].[SP_Ingresar] 
	-- Add the parameters for the stored procedure here
	@email nvarchar(255) ,
	@contrasenia nvarchar(255) 	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	IF EXISTS(SELECT IdUsuario FROM Usuarios WHERE CorreoUsuario = @email)
		BEGIN
			IF EXISTS (SELECT IdUsuario FROM Usuarios WHERE CorreoUsuario = @email AND  DECRYPTBYPASSPHRASE('pass', ContraseniaUsuario) = @contrasenia)
				BEGIN		
					SELECT Codigo_mensaje as codigo,Tipo_mensaje as tipo,Cuerpo_mensaje as mensaje FROM Mensajes WHERE Codigo_mensaje=200
				END
			ELSE
				BEGIN
						SELECT Codigo_mensaje as codigo,Tipo_mensaje as tipo,Cuerpo_mensaje as mensaje FROM Mensajes WHERE Codigo_mensaje=202
				END			
		END
	ELSE		
		BEGIN
			SELECT Codigo_mensaje as codigo,Tipo_mensaje as tipo,Cuerpo_mensaje as mensaje FROM Mensajes WHERE Codigo_mensaje=201
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Registro]    Script Date: 13/11/2017 12:30:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Alex Cifuentes Sanchez>
-- Create date: <Create Date,,5-10-2017>
-- Description:	<Description,,SP registro de usuarios>
-- =============================================

CREATE PROCEDURE [dbo].[SP_Registro]
	@Correo nvarchar(255) NULL,
	@Contrasenia nvarchar(255) NULL,-- NOT NULL,
	@Nombres nvarchar(255) NULL,
	@Apellidos nvarchar(255) NULL,
	@Telefono nvarchar(255) NULL,
	@Imagen nvarchar(255)= "/img/avatar.jpg",
	@Estado int = 1,
	@Rol int = NULL
AS

BEGIN  

-- DECLARE @Mensaje char(30) = NULL
    
	IF EXISTS(SELECT IdUsuario FROM Usuarios WHERE CorreoUsuario = @Correo)
    	BEGIN
				SELECT Codigo_mensaje as codigo,Tipo_mensaje as tipo,Cuerpo_mensaje as mensaje FROM Mensajes WHERE Codigo_mensaje=1001
              --SET @Mensaje = 'Usuario ya existe.'
		END
    ELSE IF EXISTS(SELECT IdUsuario FROM Usuarios WHERE CorreoUsuario = @Correo)
       BEGIN
			 SELECT Codigo_mensaje as codigo,Tipo_mensaje as tipo,Cuerpo_mensaje as mensaje FROM Mensajes WHERE Codigo_mensaje=1002
              --SET @Mensaje = 'Email ya existe.'
       END
    ELSE
		BEGIN
			INSERT INTO Usuarios(
				CorreoUsuario,
				ContraseniaUsuario,
				NombresUsuario,
				ApellidosUsuaio,
				TelefonoUsuario,
				ImagenUsuario,
				FKEstadoUsuario,
				FKRolUsuario)
			VALUES(
				@Correo,
				ENCRYPTBYPASSPHRASE('pass',@Contrasenia),
				@Nombres,
				@Apellidos,	
				@Telefono,
				@Imagen,
				@Estado,
				@Rol		
			)

			   SELECT Codigo_mensaje as codigo,Tipo_mensaje as tipo,Cuerpo_mensaje as mensaje FROM Mensajes WHERE Codigo_mensaje=200
			 --SET @Mensaje = 'Se inserto exitosamente! Nro registro:' + (SELECT MAX(Id_usuario) FROM Usuarios) + '.'
			 --SCOPE_IDENTITY()
		END
		--SELECT @Mensaje
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Mensajes"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewMensajes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewMensajes'
GO
USE [master]
GO
ALTER DATABASE [BD_Quiensepega] SET  READ_WRITE 
GO
