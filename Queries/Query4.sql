-----------
--Query 4--
-----------
--Parts Statistics
--Provides BI regarding the parts table

SELECT 
  SUM(PARTS_IN_STOCK) AS "Total Parts",
  SUM(PART_COST * PARTS_IN_STOCK) AS "Total Value (R)",
  ROUND(SUM(PART_COST * PARTS_IN_STOCK) / SUM(PARTS_IN_STOCK), 2) AS "Avg Cost (R)",
  ROUND(MAX(PART_COST * PARTS_IN_STOCK)) AS "Most Valuable  (R)",
  ROUND(MIN(PART_COST * PARTS_IN_STOCK)) AS "Least Valuable  (R)",
  MAX(PARTS_IN_STOCK) AS "Highest Stock",
  MIN(PARTS_IN_STOCK) AS "Lowest Stock",
  COUNT(DISTINCT PART_NAME) AS "Unique Parts",
  SUM(CASE WHEN PARTS_IN_STOCK < 10 THEN 1 ELSE 0 END) AS "Parts Below 10"
FROM PARTS;