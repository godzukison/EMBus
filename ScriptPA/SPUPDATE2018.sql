USE [EMBUS]
GO
/****** Object:  StoredProcedure [dbo].[agregararqueo]    Script Date: 05/01/2018 13:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[agregararqueo]
---se declaran los parametros que usaremos
@id_gasto int, @id_boleto int, @rut_auxiliar varchar(10), @patente varchar(6), @rut_conductor varchar(10), @serie_inicio int, @serie_fin int, @boletos_cortados int, @fecha datetime, @sin_boletos int, @total_ingresos int, @total_gastos int, @total_final int, @bono_conductor int, @bono_auxiliar int, @turno int
as
---se hace un insert a la tabla usuarios y se envian los parametros
INSERT INTO ARQUEO (ID_GASTO, ID_BOLETO, RUT_AUX, PATENTE, RUT_CON, SERIE_INICIO_BOL, SERIE_FIN_BOL, BOLETOS_CORTADOS, FECHA_ARQUEO, SIN_BOLETOS, TOTAL_INGRESOS, TOTAL_GASTOS, TOTAL_FINAL, BONO_COND, BONO_AUX, TURNO)
VALUES(@id_gasto, @id_boleto, @rut_auxiliar, @patente, @rut_conductor, @serie_inicio, @serie_fin, @boletos_cortados, @fecha, @sin_boletos, @total_ingresos, @total_gastos, @total_final, @bono_conductor, @bono_auxiliar, @turno)

GO
/****** Object:  StoredProcedure [dbo].[agregarauxiliarSP1]    Script Date: 05/01/2018 13:59:43 ******/
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
/****** Object:  StoredProcedure [dbo].[agregarbusSP1]    Script Date: 05/01/2018 13:59:43 ******/
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
/****** Object:  StoredProcedure [dbo].[agregarconductorSP1]    Script Date: 05/01/2018 13:59:43 ******/
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
/****** Object:  StoredProcedure [dbo].[loginusuarioSP1]    Script Date: 05/01/2018 13:59:43 ******/
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
/****** Object:  StoredProcedure [dbo].[obtenerBoletoPorId]    Script Date: 05/01/2018 13:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
CREATE procedure [dbo].[obtenerBoletoPorId]
---se declaran los parametros que usaremos
@id int
as
---se hace un insert a la tabla usuarios y se envian los parametros
SELECT * FROM BOLETO WHERE ID_BOLETO=@id

GO
/****** Object:  StoredProcedure [dbo].[obteneridpornombreSP1]    Script Date: 05/01/2018 13:59:43 ******/
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
/****** Object:  StoredProcedure [dbo].[obteneridtipousuariofinalSP1]    Script Date: 05/01/2018 13:59:43 ******/
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
/****** Object:  StoredProcedure [dbo].[obtenerIdTipoUsuarioPorRol]    Script Date: 05/01/2018 13:59:43 ******/
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
/****** Object:  StoredProcedure [dbo].[obtenernombreloginSP1]    Script Date: 05/01/2018 13:59:43 ******/
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
/****** Object:  StoredProcedure [dbo].[obtenerPatenteBus]    Script Date: 05/01/2018 13:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---se crea el procedimiento almacenado
create procedure [dbo].[obtenerPatenteBus]
---se declaran los parametros que usaremos
@patente varchar(6)
as
---se hace un select a la tabla usuarios y se envian los parametros
SELECT * FROM BUS WHERE PATENTE=@patente
GO
/****** Object:  StoredProcedure [dbo].[obtenerRolTipoUsuario]    Script Date: 05/01/2018 13:59:43 ******/
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
/****** Object:  StoredProcedure [dbo].[obtenerRutAuxiliar]    Script Date: 05/01/2018 13:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---se crea el procedimiento almacenado
create procedure [dbo].[obtenerRutAuxiliar]
---se declaran los parametros que usaremos
@rut varchar(10)
as
---se hace un select a la tabla usuarios y se envian los parametros
SELECT * FROM AUXILIAR WHERE RUT_AUX=@rut
GO
/****** Object:  StoredProcedure [dbo].[obtenerRutConductor]    Script Date: 05/01/2018 13:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---se crea el procedimiento almacenado
create procedure [dbo].[obtenerRutConductor]
---se declaran los parametros que usaremos
@rut varchar(10)
as
---se hace un select a la tabla usuarios y se envian los parametros
SELECT * FROM CONDUCTOR WHERE RUT_CON=@rut
GO
