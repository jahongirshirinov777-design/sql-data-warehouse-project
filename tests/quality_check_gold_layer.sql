-- Gold Layer Check:
-- Taking more important values from two almost similar columns

SELECT DISTINCT
	ci.cst_gndr,
	ca.gen,
	CASE
		WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr 
		ELSE COALESCE(ca.gen, 'n/a')
	END AS a
FROM silver.crm_cust_info AS ci
LEFT JOIN silver.erp_cust_az12 ca
ON		ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 la
ON		ci.cst_key = la.cid

-- 
SELECT DISTINCT gender FROM gold.dim_customers
  
-- Here is the problem appeared in bronze.crm_cust_info there are a few rows that cst_id has NULLs (which silver layer could not remove, e.g. 'PO25' and only this vaue row.) 

SELECT * FROM silver.crm_cust_info
WHERE LEN(cst_key) > 10
SELECT * FROM  bronze.crm_cust_info--silver.crm_cust_info
--WHERE cst_key = 'A01Ass'
WHERE LEN(cst_key) < 10

SELECT * FROM bronze.crm_cust_info WHERE cst_id IS NULL

SELECT 
	cst_id,
	COUNT(*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1

		SELECT COUNT(*) FROM(
			SELECT
				cst_id,
				cst_key,
				TRIM(cst_firstname) AS cst_firstname,
				TRIM(cst_lastname) AS cst_lastname,
				CASE
					WHEN LOWER(TRIM(cst_marital_status)) = 'm' THEN 'Married'
					WHEN LOWER(TRIM(cst_marital_status)) = 's' THEN 'Single'
					ELSE 'n/a'
				END AS cst_marital_status,
				CASE
					WHEN LOWER(TRIM(cst_gndr)) = 'm' THEN 'Male'
					WHEN LOWER(TRIM(cst_gndr)) = 'f' THEN 'Female'
					ELSE 'n/a'
				END AS cst_gndr,
				cst_create_date
			FROM(
			SELECT
				*,
				ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
			FROM bronze.crm_cust_info)t
			WHERE flag_last = 1)t
			
			
			
			SELECT COUNT(*) FROM(
			SELECT
				cst_id,
				cst_key,
				TRIM(cst_firstname) AS cst_firstname,
				TRIM(cst_lastname) AS cst_lastname,
				CASE
					WHEN LOWER(TRIM(cst_marital_status)) = 'm' THEN 'Married'
					WHEN LOWER(TRIM(cst_marital_status)) = 's' THEN 'Single'
					ELSE 'n/a'
				END AS cst_marital_status,
				CASE
					WHEN LOWER(TRIM(cst_gndr)) = 'm' THEN 'Male'
					WHEN LOWER(TRIM(cst_gndr)) = 'f' THEN 'Female'
					ELSE 'n/a'
				END AS cst_gndr,
				cst_create_date
			FROM(
			SELECT
				*,
				ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
			FROM bronze.crm_cust_info)t
			WHERE flag_last = 1 AND cst_id IS NOT NULL)t
			
