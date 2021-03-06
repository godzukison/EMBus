USE [EMBUS]
GO
/****** Object:  StoredProcedure [dbo].[agregarauxiliarSP1]    Script Date: 13/11/2017 19:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[agregarauxiliarSP1]
---se declaran los parametros que usaremos
@rut varchar(10), @id_tipo_usuario int, @id_oficina int, @primer_nombre varchar(50), @segundo_nombre varchar(50), @primer_apellido varchar(50), @segundo_apellido varchar(50), @telefono int, @estado bit
as
---se hace un insert a la tabla auxiliar y se envian los parametros
INSERT INTO AUXILIAR(RUT_AUX, ID_TIPO_USUARIO, ID_OFICINA, PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, TEL_AUX, ESTADO_AUX)
VALUES(@rut, @id_tipo_usuario, @id_oficina, @primer_nombre, @segundo_nombre, @primer_apellido, @segundo_apellido, @telefono, @estado)




GO
/****** Object:  StoredProcedure [dbo].[agregarbusSP1]    Script Date: 13/11/2017 19:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[agregarbusSP1]
---se declaran los parametros que usaremos
@patente varchar(6), @id_marca_bus int, @id_oficina int, @apodo varchar(20), @capacidad int, @estado bit
as
---se hace un insert a la tabla usuarios y se envian los parametros
INSERT INTO BUS(PATENTE, ID_MARCA_BUS, ID_OFICINA, APODO_BUS, CAPACIDAD_BUS, ESTADO_BUS)
VALUES(@patente, @id_marca_bus, @id_oficina, @apodo, @capacidad, @estado)





GO
/****** Object:  StoredProcedure [dbo].[agregarconductorSP1]    Script Date: 13/11/2017 19:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[agregarconductorSP1]
---se declaran los parametros que usaremos
@rut varchar(10), @id_oficina int, @id_tipo_usuario int, @primer_nombre varchar(50), @segundo_nombre varchar(50), @primer_apellido varchar(50), @segundo_apellido varchar(50), @telefono int, @estado bit
as
---se hace un insert a la tabla CONDUCTOR y se envian los parametros
INSERT INTO CONDUCTOR(RUT_CON, ID_OFICINA, ID_TIPO_USUARIO, PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, TEL_CON, ESTADO_CON)
VALUES(@rut, @id_oficina, @id_tipo_usuario, @primer_nombre, @segundo_nombre, @primer_apellido, @segundo_apellido, @telefono, @estado)



GO
/****** Object:  StoredProcedure [dbo].[loginusuarioSP1]    Script Date: 13/11/2017 19:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[loginusuarioSP1]
---se declaran los parametros que usaremos
@rut varchar(10),@clave varchar(50)
as
---se hace un insert a la tabla usuarios y se envian los parametros
SELECT * FROM USUARIO WHERE RUT_USUARIO=@rut AND CLAVE_USUARIO=@clave







GO
/****** Object:  StoredProcedure [dbo].[obteneridpornombreSP1]    Script Date: 13/11/2017 19:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
CREATE procedure [dbo].[obteneridpornombreSP1]
---se declaran los parametros que usaremos
@primer_nombre varchar(50), @primer_apellido varchar(50), @segundo_apellido varchar(50)
as
---se hace un insert a la tabla usuarios y se envian los parametros
SELECT ID_TIPO_USUARIO FROM USUARIO WHERE PRIMER_NOMBRE=@primer_nombre and PRIMER_APELLIDO=@primer_apellido and SEGUNDO_APELLIDO=@segundo_apellido
GO
/****** Object:  StoredProcedure [dbo].[obteneridtipousuariofinalSP1]    Script Date: 13/11/2017 19:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[obteneridtipousuariofinalSP1]
---se declaran los parametros que usaremos
@rut varchar(10), @clave varchar(50) 
as
---se hace un insert a la tabla usuarios y se envian los parametros
SELECT ID_TIPO_USUARIO FROM USUARIO WHERE RUT_USUARIO=@rut and CLAVE_USUARIO=@clave




GO
/****** Object:  StoredProcedure [dbo].[obtenerIdTipoUsuarioPorRol]    Script Date: 13/11/2017 19:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---se crea el procedimiento almacenado
create procedure [dbo].[obtenerIdTipoUsuarioPorRol]
---se declaran los parametros que usaremos
@rol varchar(50)
AS
---se hace un select a la tabla usuarios y se envian los parametros
SELECT id_tipo_usuario from TIPO_USUARIO where ROL_TIPO_USUARIO=@rol




GO
/****** Object:  StoredProcedure [dbo].[obtenernombreloginSP1]    Script Date: 13/11/2017 19:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[obtenernombreloginSP1]
---se declaran los parametros que usaremos
@rut varchar(10),@clave varchar(50)
as
---se hace un select a la tabla usuarios y se envian los parametros
SELECT PRIMER_NOMBRE, PRIMER_APELLIDO FROM USUARIO 
WHERE RUT_USUARIO=@rut AND CLAVE_USUARIO=@clave





GO
/****** Object:  StoredProcedure [dbo].[obtenerRolTipoUsuario]    Script Date: 13/11/2017 19:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[obtenerRolTipoUsuario]
---se declaran los parametros que usaremos
@rut varchar(10),@clave varchar(50)
as
---se hace un select a la tabla usuarios y se envian los parametros
select ROL_TIPO_USUARIO FROM TIPO_USUARIO INNER JOIN USUARIO ON
USUARIO.ID_TIPO_USUARIO = TIPO_USUARIO.ID_TIPO_USUARIO AND
RUT_USUARIO=@rut and CLAVE_USUARIO=@clave
GO
