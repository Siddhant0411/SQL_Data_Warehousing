/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @starttime DATETIME,@endtime DATETIME;
	BEGIN TRY
		PRINT '================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '================================================';

		PRINT '------------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '------------------------------------------------';

		SET @starttime = GETDATE();
		TRUNCATE TABLE bronze.crm_cust_info;
		BULK INSERT bronze.crm_cust_info 
		FROM 'C:\Users\Siddhant Sanghoi\Downloads\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();
		PRINT'LOAD DURATION: ' + CAST(DATEDIFF(second,@starttime,@endtime) as NVARCHAR) + ' seconds';
		PRINT'-----------------------------------------------------------------------------------';

		SET @starttime = GETDATE();
		TRUNCATE TABLE bronze.crm_prd_info;
		BULK INSERT bronze.crm_prd_info 
		FROM 'C:\Users\Siddhant Sanghoi\Downloads\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();
		PRINT'LOAD DURATION: ' + CAST(DATEDIFF(second,@starttime,@endtime) as NVARCHAR) + ' seconds';
		PRINT'-----------------------------------------------------------------------------------';

		SET @starttime = GETDATE();
		TRUNCATE TABLE bronze.crm_sales_details;
		BULK INSERT bronze.crm_sales_details 
		FROM 'C:\Users\Siddhant Sanghoi\Downloads\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();
		PRINT'LOAD DURATION: ' + CAST(DATEDIFF(second,@starttime,@endtime) as NVARCHAR) + ' seconds';
		PRINT'-----------------------------------------------------------------------------------';

		PRINT '------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '------------------------------------------------';

		SET @starttime = GETDATE();
		TRUNCATE TABLE bronze.erp_cust_az12;
		BULK INSERT bronze.erp_cust_az12 
		FROM 'C:\Users\Siddhant Sanghoi\Downloads\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();
		PRINT'LOAD DURATION: ' + CAST(DATEDIFF(second,@starttime,@endtime) as NVARCHAR) + ' seconds';
		PRINT'-----------------------------------------------------------------------------------';

		SET @starttime = GETDATE();
		TRUNCATE TABLE bronze.erp_loc_a101;
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Siddhant Sanghoi\Downloads\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();
		PRINT'LOAD DURATION: ' + CAST(DATEDIFF(second,@starttime,@endtime) as NVARCHAR) + ' seconds';
		PRINT'-----------------------------------------------------------------------------------';

		SET @starttime = GETDATE();
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		BULK INSERT bronze.erp_px_cat_g1v2 
		FROM 'C:\Users\Siddhant Sanghoi\Downloads\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();
		PRINT'LOAD DURATION: ' + CAST(DATEDIFF(second,@starttime,@endtime) as NVARCHAR) + ' seconds';
		PRINT'-----------------------------------------------------------------------------------';
	END TRY
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH

END
