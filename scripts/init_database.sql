/*
  Purpose: Creates a database 'DataWarehouse' after checking if it exists, if it exists already then drops 
           the database and creates a new one. Also creates schemas: bronze, silver and gold.
  Warning: It drops the already existing database.Thus use carefully since data can be lost.
*/



USE master;
GO

-- Drop and recreate the "DataWarehouse" Database
  IF EXISTS (SELECT 1 FROM sys.databases WHERE name = "DataWarehouse")
  BEGIN
      ALTER DATABASE DataWarehouse  SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
      DROP DATABASE DataWarehouse;
  END;
  GO
    
-- create database 'DataWarehouse'  
CREATE DATABASE DataWarehouse;
GO

--Use the created database
USE DataWarehouse;
GO

--Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
