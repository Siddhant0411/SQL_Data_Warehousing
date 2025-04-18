/*
========================================================================
Create Database and Schemas
========================================================================
Script Purpose:
This script creates a new database named 'DataWarehouse' after checking if it already exists. If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas within the database: 'bronze', 'silver', and 'gold'.
*/
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'data_warehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE data_warehouse;
END;

CREATE DATABASE data_warehouse;
GO

USE data_warehouse;
GO 

IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'bronze')
BEGIN
    EXEC('DROP SCHEMA bronze');
END
GO
CREATE SCHEMA bronze;
GO

IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'silver')
BEGIN
    EXEC('DROP SCHEMA silver');
END
GO
CREATE SCHEMA silver;
GO

IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'gold')
BEGIN
    EXEC('DROP SCHEMA gold');
END
GO
CREATE SCHEMA gold;
GO


