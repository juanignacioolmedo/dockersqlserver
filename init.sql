-- Crear el usuario de inicio de sesión (si no existe)
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'custom_user')
BEGIN
    CREATE LOGIN custom_user WITH PASSWORD = 'custom_password';
END;

-- Crear usuario de base de datos (si no existe)
USE master;
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'custom_user')
BEGIN
    CREATE USER custom_user FOR LOGIN custom_user;
    ALTER ROLE db_datareader ADD MEMBER custom_user;
    ALTER ROLE db_datawriter ADD MEMBER custom_user;
END;

-- Crear la base de datos (si no existe)
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'MyDatabase')
BEGIN
    CREATE DATABASE MyDatabase;
END;

USE MyDatabase;
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'custom_user')
BEGIN
    CREATE USER custom_user FOR LOGIN custom_user;
END;
