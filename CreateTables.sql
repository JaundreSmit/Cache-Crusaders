--------------------------------------------------------
--  File created - Wednesday-May-15-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE ORDERS 
(
  ORDER_ID NUMBER NOT NULL PRIMARY KEY,
  CUSTOMER_ID NUMBER,
  TECHNICIAN_ID NUMBER,
  PART_ID NUMBER,
  ORDER_DATE DATE,
  ORDER_STATUS NUMBER,
  TOTAL_COST NUMBER(10, 2)
);


--  DDL for Table ADDRESS
--------------------------------------------------------

CREATE TABLE ADDRESS 
(
  ADDRESS_ID NUMBER NOT NULL PRIMARY KEY,
  STREET_NAME VARCHAR2(20 BYTE),
  STREET_NUMBER NUMBER,
  CITY VARCHAR2(20 BYTE),
  PROVINCE_ID NUMBER
);

COMMENT ON COLUMN ADDRESS.PROVINCE_ID IS 'Links to Provinces table';
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

CREATE TABLE CUSTOMERS 
(
  CUSTOMER_ID NUMBER NOT NULL PRIMARY KEY,
, CUSTOMER_EMAIL VARCHAR2(50 BYTE) 
, CUSTOMER_PHONE_NUMBER VARCHAR2(15 BYTE) 
, CUSTOMER_NAME VARCHAR2(50 BYTE) 
, CUSTOMER_SURNAME VARCHAR2(50 BYTE) 
, ADDRESS_ID NUMBER NOT NULL 
);

COMMENT ON COLUMN CUSTOMERS.ADDRESS_ID IS 'Links to Address Table';
--------------------------------------------------------
--  DDL for Table PARTS
--------------------------------------------------------
CREATE TABLE PARTS 
(
  PART_ID NUMBER NOT NULL PRIMARY KEY,
  PART_NAME VARCHAR2(20 BYTE),
  PART_BRAND VARCHAR2(20 BYTE),
  PART_TYPE VARCHAR2(20 BYTE),
  PART_COST FLOAT(2),
  PARTS_IN_STOCK NUMBER
);
--------------------------------------------------------
--  DDL for Table PARTS_IN_ORDER
--------------------------------------------------------

  CREATE TABLE PARTS_IN_ORDER 
(
  PIO_ID NUMBER PRIMARY KEY,
  PARTS_ID NUMBER,
  ORDER_ID NUMBER,

);
--------------------------------------------------------
--  DDL for Table PARTS_IN_REPAIR
--------------------------------------------------------

  CREATE TABLE PARTS_IN_REPAIR 
(
  REPAIR_ID NUMBER,
  PART_ID NUMBER,
  PIR_ID NUMBER NOT NULL PRIMARY KEY
);
--------------------------------------------------------
--  DDL for Table PROVINCES
--------------------------------------------------------
CREATE TABLE PROVINCES 
(
  PROVINCE_ID NUMBER NOT NULL PRIMARY KEY,
  PROVINCE_NAME VARCHAR2(30 BYTE)
);
--------------------------------------------------------
--  DDL for Table REPAIR_ORDER
--------------------------------------------------------

CREATE TABLE REPAIR_ORDERS 
(
  REPAIR_ID NUMBER NOT NULL PRIMARY KEY,
  CUSTOMER_ID NUMBER NOT NULL,
  TECHNICIAN_ID NUMBER NOT NULL,
  PARTS_ID NUMBER NOT NULL,
  STATUS_ID NUMBER NOT NULL,
  ADDRESS_ID NUMBER,
  REPAIR_DATE DATE,
  ACCUMULATED_COST FLOAT(126),

);


--------------------------------------------------------
--  DDL for Table STATUS
--------------------------------------------------------

  CREATE TABLE STATUS 
(
  STATUS_ID NUMBER,
  STATUS_NAME VARCHAR2(25 BYTE)
);

COMMENT ON COLUMN STATUS.STATUS_NAME IS 'In Progress/Todo/In Transit/Completed/ETC';
--------------------------------------------------------
--  DDL for Table TECHNICIANS
--------------------------------------------------------
CREATE TABLE TECHNICIANS 
(
  TECHNICIAN_ID NUMBER NOT NULL PRIMARY KEY,
  AVAILABILITY NUMBER,
  TECH_SURNAME VARCHAR2(25 BYTE),
  TECH_PHONE_NUMBER VARCHAR2(10 BYTE),
  TECH_NAME VARCHAR2(25 BYTE),
  DEPARTMENT_ID NUMBER,
);

COMMENT ON COLUMN TECHNICIANS.AVAILABILITY IS 'Each department role has a set max jobs, this is each user''s current jobs count';
COMMENT ON COLUMN TECHNICIANS.DEPARTMENT_ID IS 'The technicians department';


--------------------------------------------------------
--  Add contraints
--------------------------------------------------------
-- Orders
ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_FK1 FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID) ON DELETE CASCADE;

ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_FK2 FOREIGN KEY (TECHNICIAN_ID) REFERENCES TECHNICIANS(TECHNICIAN_ID) ON DELETE CASCADE;

ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_FK3 FOREIGN KEY (PART_ID) REFERENCES PARTS_IN_ORDER(PIO_ID) ON DELETE CASCADE;
--

-- Customers
ALTER TABLE CUSTOMERS
ADD CONSTRAINT CUSTOMER_ADDRESS_FK FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID)
--

--  Technicians
ALTER TABLE TECHNICIANS
ADD CONSTRAINT TECH_DEPT_FK FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID);
--

-- Repairs
ALTER TABLE REPAIRS
 ADD CONSTRAINT REP_CUST_FK1 FOREIGN KEY (CUSTOMER_ID, ADDRESS_ID) REFERENCES CUSTOMERS(CUSTOMER_ID, ADDRESS_ID) ON DELETE CASCADE;
ALTER TABLE REPAIRS
  ADD CONSTRAINT REP_PARTS_FK3 FOREIGN KEY (REPAIR_ID) REFERENCES PARTS_IN_REPAIR(PIR_ID) ON DELETE CASCADE;
ALTER TABLE REPAIRS
  ADD CONSTRAINT REP_STATUS_FK4 FOREIGN KEY (STATUS_ID) REFERENCES STATUS(STATUS_ID) ON DELETE CASCADE;
ALTER TABLE REPAIRS
  ADD CONSTRAINT REP_TECHN_FK2 FOREIGN KEY (TECHNICIAN_ID) REFERENCES TECHNICIANS(TECHNICIAN_ID) ON DELETE CASCADE;
--

-- Parts
ALTER TABLE PARTS
ADD CONSTRAINT FK_PARTS_ID FOREIGN KEY (PARTS_ID) REFERENCES PARTS(PART_ID);
ALTER TABLE PARTS
ADD CONSTRAINT FK_ORDER_ID FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID);

--



--------------------------------------------------------


--Data Insert
--Provinces
Insert into PROVINCES (PROVINCE_ID, PROVINCE_NAME) values 
(1, 'Eastern Cape'), 
(2, 'Free State'), 
(3, 'Gauteng'), 
(4, 'KwaZulu-Natal'), 
(5, 'Limpopo'), 
(6, 'Mpumalanga'), 
(7, 'Northern Cape'), 
(8, 'North West'), 
(9, 'Western Cape');


--Status
Insert Into STATUS (STATUS_ID, STATUS_NAME) values 
(1, 'In Transit'),
(2, 'In Progress'),
(3, 'Completed'),
(4, 'To Do'),
(5, 'Standby');

--Departments
Insert into DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME) values 
(1, 'Customer Service Representatives'), 
(2, 'Technicians'), 
(3, 'Sales and Marketing Personnel'), 
(4, 'IT Personnel');
