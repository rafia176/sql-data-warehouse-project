--Load data from csv files
/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

Create or Alter Procedure bronze.load_bronze AS
Begin
Declare @start_time Datetime, @end_time Datetime
Begin Try
Print '=================================='
Print 'Loading the Bronze layer'
Print '=================================='
Print '=================================='
Print 'Loading CRM Tables'
Print '=================================='

Set @start_time = Getdate()
Print '>> Truncating the table: bronze.crm_cust_info'
Truncate Table bronze.crm_cust_info;
Print '>> Inserting the data into: bronze.crm_cust_info '
Bulk Insert bronze.crm_cust_info
From 'C:\Users\rafia\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
With (
	FirstRow = 2,
	Fieldterminator = ',',
	Tablock
);
Set @end_time = Getdate();
Print 'Load Duration:' + Cast(Getdiff(second, @start_time, @end_time) As Nvarchar) + 'second';
Print '----------------------------------------------';

Set @start_time = getdate() 
Print '>> Truncating the table: Bronze.crm_prd_info'
Truncate Table Bronze.crm_prd_info;
Print '>> Inserting the data into: Bronze.crm_prd_info '
Bulk Insert Bronze.crm_prd_info
From 'C:\Users\rafia\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
With (
	FirstRow = 2,
	Fieldterminator = ',',
	Tablock
);
set @end_time = getdate();
Print 'Load Duration:' + Cast(Getdiff(second, @start_time, @end_time) As Nvarchar) + 'second';
Print '----------------------------------------------';

Set @start_time = getdate() 
Print '>> Truncating the table: Bronze.crm_sales_details'
Truncate Table Bronze.crm_sales_details;
Print '>> Inserting the data into: Bronze.crm_sales_details'
Bulk Insert Bronze.crm_sales_details
From 'C:\Users\rafia\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
With (
	FirstRow = 2,
	Fieldterminator = ',',
	Tablock
);
Set @end_time = getdate() 
Print 'Load Duration:' + Cast(Getdiff(second, @start_time, @end_time) As Nvarchar) + 'second';
Print '----------------------------------------------';

Print '=================================='
Print 'Loading ERP Tables'
Print '=================================='
Print '>> Truncating the table: Bronze.erp_loc_a101'

Set @start_time = getdate() 
Truncate Table Bronze.erp_loc_a101;
Print '>> Inserting the data into: Bronze.erp_loc_a101'
Bulk Insert Bronze.erp_loc_a101
From 'C:\Users\rafia\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
With (
	FirstRow = 2,
	Fieldterminator = ',',
	Tablock
);
Set @end_time = getdate() 
Print 'Load Duration:' + Cast(Getdiff(second, @start_time, @end_time) As Nvarchar) + 'second';
Print '----------------------------------------------';



Set @start_time = getdate() 
Print '>> Truncating the table: Bronze.erp_cust_az12'
Truncate Table Bronze.erp_cust_az12;
Print '>> Inserting the data into: Bronze.erp_cust_az12'
Bulk Insert Bronze.erp_cust_az12
From 'C:\Users\rafia\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
With (
	FirstRow = 2,
	Fieldterminator = ',',
	Tablock
);
Set @end_time = getdate() 
Print 'Load Duration:' + Cast(Getdiff(second, @start_time, @end_time) As Nvarchar) + 'second';
Print '----------------------------------------------';

Set @start_time = getdate() 
Print '>> Truncating the table: Bronze.erp_PX_G1V2'
Truncate Table Bronze.erp_PX_G1V2;
Print '>> Inserting the data into: Bronze.erp_PX_G1V2'
Bulk Insert Bronze.erp_PX_G1V2
From 'C:\Users\rafia\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
With (
	FirstRow = 2,
	Fieldterminator = ',',
	Tablock
);
Set @end_time = getdate() 
Print 'Load Duration:' + Cast(Getdiff(second, @start_time, @end_time) As Nvarchar) + 'second';
Print '----------------------------------------------';
End try

Begin Catch
	Print '---------------------------'
	Print 'Error Found in the Bronze Layer'
	Print 'Error' + Error_Message();
	Print 'Error:' + Cast(Error_Number() As NVarchar);
	Print 'Error:' + Cast(Error_State() As NVarchar);
	Print '---------------------------'
End Catch
End

