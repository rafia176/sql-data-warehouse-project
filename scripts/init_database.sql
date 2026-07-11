/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

USE master;

--Checking Whether the Database Exists
--Drop And Recreate the 'Datawarehouse ' database

IF Exists (Select 1 from sys.databases where name = 'DataWarehouse')
Begin
	Alter Database DataWarehouse Set Single_user with Rollback Immediate;
	Drop  database DataWarehouse;
End;
GO

--Create DatabaseWarehouse

Create Database DataWarehouse;

USE DataWarehouse;
GO
Create Schema Bronze;
GO
Create Schema Silver;
GO
Create Schema Gold;
GO
