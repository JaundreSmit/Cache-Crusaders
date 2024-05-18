-----------
--Query 5--
-----------
--Check Available Technicians
--Shows all technicians with less than 5 current jobs

SELECT 
  (TECH_NAME || ' ' || TECH_SURNAME) AS "AVAILABLE TECHNICIANS",
  AVAILABILITY
FROM 
  TECHNICIANS
WHERE 
  AVAILABILITY < 5 
  AND department_id = 2
ORDER BY 
  TECH_SURNAME DESC;