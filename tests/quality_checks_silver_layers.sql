/*===========================================================================
Quality Checks
for myself:
===========================================================================*/

-- Checking if Sales = Quantity * Price
SELECT DISTINCT
	sls_sales AS sls_sales_old,
	sls_quantity AS sls_quantity_old,
	sls_price AS sls_price_old,
	CASE 
	 	WHEN sls_sales <= 0 OR sls_sales IS NULL OR sls_sales != sls_quantity * ABS(sls_price) 
			THEN sls_quantity * ABS(sls_price) 
		ELSE sls_sales
	END AS sls_sales,
	CASE 
		WHEN sls_price IS NULL OR sls_price <= 0 --OR sls_price != ABS(sls_sales)/sls_quantity
			THEN sls_sales/NULLIF(sls_quantity, 0)
		ELSE sls_price
	END AS sls_price
FROM bronze.crm_sales_details
ORDER BY sls_sales, sls_quantity, sls_price
--WHERE sls_price != ABS(sls_sales)/sls_quantity --sls_quantity <0 -- sls_sales = 0 --!= sls_quantity * sls_price OR sls_sales < 0 OR sls_price < 0 OR sls_quantity IS NULL OR sls_sales IS NULL OR sls_price IS NULL
--ORDER BY sls_sales

-- Checking the validity of date
SELECT
NULLIF(sls_order_dt, 0) AS sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt = 0 OR LEN(sls_order_dt) !=8


-- Check for Invalid Date Orders
SELECT DISTINCT COUNT(*)
FROM bronze.crm_sales_details
WHERE prd_end_dt < prd_start_dt --(by using LEAD () and LAG() functions fix the ending date)

-- Check for Invalid Date Orders
SELECT
	bdate
FROM bronze.erp_cust_az12
WHERE bdate < '1926-01-01' OR bdate > GETDATE()

-- Check for Nulls or Negative Numbers
SELECT
	prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL

-- Check for Duplicates
SELECT
	prd_id,
	COUNT(*)
FROM bronze.crm_prd_info			/*and after sending clean data to silver layer 
									we can check for 'silver.crm_cust_info' table we should get nothing as a result*/
GROUP BY prd_id
HAVING COUNT(*) > 1

-- Check for unwanted spaces
SELECT
	cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

-- Check for distincst (what kind of values we have in total)
SELECT DISTINCT
	--cst_gndr--,
	cst_marital_status
FROM silver.crm_cust_info


