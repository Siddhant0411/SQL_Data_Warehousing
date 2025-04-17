/*
========================================================================
Create Database and Schemas
========================================================================
Script Purpose:
This script creates a new database named 'DataWarehouse' after checking if it already exists. If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas within the database: 'bronze', 'silver', and 'gold'.
*/
use master;
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'data_warehouse')
BEGIN
	DROP DATABASE data_warehouse;
END;

create database data_warehouse;
GO

create schema bronze;
go
create schema silver;
go
create schema gold;
go 
