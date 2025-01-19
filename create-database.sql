-- Crear la base de datos si no existe
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'MyDatabase')
BEGIN
    CREATE DATABASE MyDatabase;
END;
