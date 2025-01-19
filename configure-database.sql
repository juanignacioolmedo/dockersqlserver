-- Crear el inicio de sesión (si no existe)
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'custom_user')
BEGIN
    CREATE LOGIN custom_user WITH PASSWORD = 'P@ssw0rd123';  -- Cumple con las políticas

END;

-- Usar la base de datos
USE MyDatabase;

-- Crear el usuario en la base de datos (si no existe)
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'custom_user')
BEGIN
    CREATE USER custom_user FOR LOGIN custom_user;
    ALTER ROLE db_datareader ADD MEMBER custom_user;
    ALTER ROLE db_datawriter ADD MEMBER custom_user;
END;
