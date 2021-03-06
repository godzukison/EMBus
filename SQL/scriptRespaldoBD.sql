--Variables
DECLARE @Base_Datos VARCHAR(50)  -- Nombre de la Base de Datos  
DECLARE @Ruta_Archivos VARCHAR(256) -- Ruta para los archivos 
DECLARE @Nombre_A VARCHAR(256) -- Nombre del Backup  (1era Parte)
DECLARE @Nombre_B VARCHAR(20) --  Nombre del Backup (2da Parte)
 
SET @Base_Datos='dbo.EMBUS'

-- 1-Ubicación de los backups
SET @Ruta_Archivos = 'C:\Temp\'  
 
-- Nombre del Archivo (2da Parte) _YYYYMMDD
SELECT @Nombre_B = (SELECT '_'+CONVERT(VARCHAR(20),GETDATE(),112) +'.BAK') 
 
DECLARE Cursor_Backup CURSOR READ_ONLY FOR  
SELECT name 
FROM master.dbo.sysdatabases 
WHERE name NOT IN ('master','model','msdb','tempdb')  -- exclude these databases
 
OPEN Cursor_Backup   
FETCH NEXT FROM Cursor_Backup INTO @Base_Datos   
 
WHILE @@FETCH_STATUS = 0   
BEGIN   
   SET @Nombre_A = @Ruta_Archivos + @Base_Datos +  @Nombre_B   
   BACKUP DATABASE @Base_Datos TO DISK = @Nombre_A  
 
   FETCH NEXT FROM Cursor_Backup INTO @Base_Datos   
END   
 
 
CLOSE Cursor_Backup   
DEALLOCATE Cursor_Backup

