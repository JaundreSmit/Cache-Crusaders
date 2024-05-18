-----------
--Queries--
-----------
--Q1
-----------
SELECT
    C.CUSTOMER_ID,
    C.CUSTOMER_EMAIL,
    C.CUSTOMER_PHONE_NUMBER,
    C.CUSTOMER_NAME,
    C.CUSTOMER_SURNAME,
    A.STREET_NAME,
    A.STREET_NUMBER,
    A.CITY,
    A.PROVINCE_ID
FROM
    CUSTOMERS C
JOIN
    ADDRESS A ON C.ADDRESS_ID = A.ADDRESS_ID
WHERE
    C.CUSTOMER_ID = '&CUSTOMER_ID';

-----------
--Q2
-----------
SELECT
    CUSTOMERS.CUSTOMER_ID,
    CUSTOMERS.CUSTOMER_EMAIL,
    CUSTOMERS.CUSTOMER_PHONE_NUMBER,
    CUSTOMERS.CUSTOMER_NAME,
    CUSTOMERS.CUSTOMER_SURNAME,
    ORDERS.ORDER_DATE,
    ORDERS.ORDER_STATUS,
    ORDERS.ORDER_ID,
    ORDERS.TOTAL_COST
FROM
    CUSTOMERS
JOIN
    ORDERS ON CUSTOMERS.CUSTOMER_ID = ORDERS.CUSTOMER_ID
WHERE
    UPPER(CUSTOMER_NAME) LIKE UPPER('%&CUSTOMER_NAME%');

-----------
--Q3
-----------
SELECT ROUND(SUM(X.TOTAL_COST), 2) AS TOTAL_MONTH_COST
FROM
(SELECT O.TOTAL_COST,O.ORDER_DATE,CUSTOMER_ID FROM ORDERS O WHERE O.ORDER_DATE >= '01-JAN-23')
UNION ALL
SELECT R.ACCUMULATED_COST,R.REPAIR_DATE,CUSTOMER_ID FROM REPAIRS R WHERE r.repair_date >= '01-JAN-23') X
ORDER BY TOTAL_COST;

-----------
--Q4
-----------
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

-----------
--Q5
-----------
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

-----------
--Q6
-----------
INSERT INTO ORDERS
VALUES (ORDER_ID_value.nextval, '&CUSTOMER_ID', '&TECHNICIAN_ID', '&ORDER_DATE', '&ORDER_STATUS',
  ROUND((SELECT
  SUM(p.PART_COST) FROM PARTS p
JOIN PARTS_IN_ORDER i
ON p.PART_ID = i.PARTS_ID
JOIN ORDERS o ON o.ORDER_ID = i.ORDER_ID
WHERE o.ORDER_ID = ORDER_ID_value
GROUP BY o.ORDER_ID)*1.10, 2));

-----------
--Q7
-----------
UPDATE ORDERS
SET ORDER_STATUS = '&ORDER_STATUS'
WHERE ORDER_ID = '&ORDER_ID';

-----------
--Q8
-----------
INSERT INTO REPAIRS
VALUES (REPAIR_ID_value.nextval, '&CUSTOMER_ID', '&TECHNICIAN_ID', '&STATUS_ID', '&ADDRESS_ID', '&REPAIR_DATE',
  ROUND((SELECT
  SUM(p.PART_COST)
FROM PARTS p
JOIN PARTS_IN_REPAIR i
ON p.PART_ID = i.PART_ID
JOIN REPAIRS r ON r.REPAIR_ID = i.REPAIR_ID
WHERE r.REPAIR_ID = REPAIR_ID_value
GROUP BY r.REPAIR_ID)*1.10, 2));

-----------
--Q9
-----------
UPDATE REPAIRS
SET STATUS_ID = '&STATUS_ID', REPAIR_DATE = '&REPAIR_DATE'
WHERE REPAIR_ID = '&REPAIR_ID';

-----------
--Q10
-----------
INSERT INTO PARTS
VALUES (PART_ID_value.nextval, '&PART_NAME', '&PART_BRAND', '&PART_TYPE', '&PART_COST', '&PARTS_IN_STOCK');

-----------
--Q11
-----------
UPDATE PARTS
SET PART_COST = '&PART_COST', PARTS_IN_STOCK = '&PARTS_IN_STOCK'
WHERE PART_ID = '&PART_ID';

-----------
--Q12
-----------
INSERT INTO TECHNICIANS (TECHNICIAN_ID, AVAILABILITY, TECH_NAME, TECH_SURNAME, TECH_PHONE_NUMBER, DEPARTMENT_ID)
VALUES (TECHNICIAN_ID_value.NEXTVAL, 0, '&Name', '&Surname', '&PhoneNumber', '&DepartmentID');

-----------
--Q13
-----------
UPDATE TECHNICIANS
SET DEPARTMENT_ID = '&New_department_id'
WHERE TECHNICIAN_ID = '&TechnicianID' ;

-----------
--Q14
-----------
INSERT INTO customers
VALUES (CUSTOMER_ID_VALUE.nextval, '&CUSTOMER_EMAIL','&CUSTOMER_CELL_NUMBER','&CUSTOMER_FIRST_NAME','&CUSTOMER_LAST_NAME','&ADDRESS_ID');

-----------
--Q15
-----------
UPDATE CUSTOMERS
SET CUSTOMER_EMAIL = '&Customer_Email',CUSTOMER_PHONE_NUMBER = '&CUSTOMER_CELL_NUMBER',CUSTOMER_NAME = '&CUSTOMER_NAME',CUSTOMER_SURNAME = '&CUSTOMER_SURNAME',ADDRESS_ID = '&ADDRESS_ID'
WHERE CUSTOMER_ID = '&CUSTOMER_ID';

-----------
--Q16
-----------
DELETE FROM CUSTOMERS
WHERE CUSTOMER_ID = '&CUSTOMER_ID';

-----------
--Q17
-----------
SELECT SUM(PART_COST * PARTS_IN_STOCK)
AS Total_Value
FROM PARTS;

-----------
--Q18
-----------
SELECT O.*, C.CUSTOMER_ID, C.CUSTOMER_NAME, C.CUSTOMER_SURNAME, C.CUSTOMER_PHONE_NUMBER, C.CUSTOMER_EMAIL, S.STATUS_NAME
FROM ORDERS O
JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
JOIN STATUS S ON O.ORDER_STATUS = S.STATUS_ID
WHERE O.ORDER_STATUS = '&Status_ID'
ORDER BY O.ORDER_DATE ASC;
