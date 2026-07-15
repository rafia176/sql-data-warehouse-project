/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/


If object_id('Bronze.crm_cust_info', 'U') is not null
	Drop Table Bronze.crm_cust_info;
Go
Create Table Bronze.crm_cust_info(
cst_id				INT,
cst_key				NVARChar(50),
cst_firstname		NVARChar(50),
cst_lastname		NVARChar(50),
cst_marital_status	NVARChar(50),
cst_gndr			NVARChar(50),
cst_create_date		Date
);
Go

If object_id('Bronze.crm_prd_info', 'U') is not null
	Drop Table Bronze.crm_prd_info;
Go
Create Table Bronze.crm_prd_info(
cst_id			INT,
prd_key			NVARChar(50),
prd_nm			NVARChar(50),
prd_cost		INT,
prd_line		NVARChar(50),
prd_start_dt	Datetime,
prd_end_dt		Datetime
);
Go

If object_id('Bronze.crm_sales_details', 'U') is not null
	Drop Table Bronze.crm_sales_details;
Go
Create Table Bronze.crm_sales_details(
sls_ord_num  NVARCHAR(50),
   sls_prd_key  NVARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT

);
Go

If object_id('Bronze.erp_loc_a101', 'U') is not null
	Drop Table Bronze.erp_loc_a101;
Go
Create Table Bronze.erp_loc_a101(
cid		Nvarchar(50),
cntry	Nvarchar(50)
);
Go

If object_id('Bronze.erp_cust_az12', 'U') is not null
	Drop Table Bronze.erp_cust_az12;
Go

Create Table Bronze.erp_cust_az12(
cid		Nvarchar(50),
bdate	date,
gen		Nvarchar(50)

);
Go

If object_id('Bronze.erp_PX_G1V2', 'U') is not null
	Drop Table Bronze.erp_PX_G1V2;
Go

Create Table Bronze.erp_PX_G1V2(
id			Nvarchar(50),
cat			Nvarchar(50),
subcat		Nvarchar(50),
maintenance Nvarchar(50)
);



