--------------------------------------------------------
--  Drop all Tables
--------------------------------------------------------
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE ADDRESS CASCADE CONSTRAINTS;
DROP TABLE CUSTOMERS CASCADE CONSTRAINTS;
DROP TABLE PARTS CASCADE CONSTRAINTS;
DROP TABLE PARTS_IN_ORDER CASCADE CONSTRAINTS;
DROP TABLE PARTS_IN_REPAIR CASCADE CONSTRAINTS;
DROP TABLE PROVINCES CASCADE CONSTRAINTS;
DROP TABLE REPAIRS CASCADE CONSTRAINTS;
DROP TABLE STATUS CASCADE CONSTRAINTS;
DROP TABLE TECHNICIANS CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENTS CASCADE CONSTRAINTS;

--------------------------------------------------------
--  Create all Tables
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE ORDERS
(
  ORDER_ID NUMBER NOT NULL,
  CUSTOMER_ID NUMBER,
  TECHNICIAN_ID NUMBER,
  ORDER_DATE DATE,
  ORDER_STATUS NUMBER,
  TOTAL_COST NUMBER(10, 2)
);

--------------------------------------------------------
--  DDL for Table ADDRESS
--------------------------------------------------------

CREATE TABLE ADDRESS
(
  ADDRESS_ID NUMBER NOT NULL PRIMARY KEY,
  STREET_NAME VARCHAR2(40 BYTE),
  STREET_NUMBER NUMBER,
  CITY VARCHAR2(40 BYTE),
  PROVINCE_ID NUMBER
);

COMMENT ON COLUMN ADDRESS.PROVINCE_ID IS 'Links to Provinces table';
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

CREATE TABLE CUSTOMERS
(
  CUSTOMER_ID NUMBER NOT NULL PRIMARY KEY
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
  PART_NAME VARCHAR2(35 BYTE),
  PART_BRAND VARCHAR2(35 BYTE),
  PART_TYPE VARCHAR2(35 BYTE),
  PART_COST FLOAT(2),
  PARTS_IN_STOCK NUMBER
);
--------------------------------------------------------
--  DDL for Table PARTS_IN_ORDER
--------------------------------------------------------

  CREATE TABLE PARTS_IN_ORDER
(
    PIO_ID NUMBER PRIMARY KEY,
    ORDER_ID NUMBER,
    PARTS_ID NUMBER
);
--------------------------------------------------------
--  DDL for Table PARTS_IN_REPAIR
--------------------------------------------------------

  CREATE TABLE PARTS_IN_REPAIR
(
    PIR_ID NUMBER PRIMARY KEY,
  REPAIR_ID NUMBER,
  PART_ID NUMBER
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

CREATE TABLE REPAIRS
(
  REPAIR_ID NUMBER NOT NULL PRIMARY KEY,
  CUSTOMER_ID NUMBER NOT NULL,
  TECHNICIAN_ID NUMBER NOT NULL,
  STATUS_ID NUMBER NOT NULL,
  ADDRESS_ID NUMBER,
  REPAIR_DATE DATE,
  ACCUMULATED_COST FLOAT(126)
);


--------------------------------------------------------
--  DDL for Table STATUS
--------------------------------------------------------

  CREATE TABLE STATUS
(
  STATUS_ID NUMBER NOT NULL PRIMARY KEY,
  STATUS_NAME VARCHAR2(35 BYTE)
);

COMMENT ON COLUMN STATUS.STATUS_NAME IS 'In Progress/Todo/In Transit/Completed/ETC';
--------------------------------------------------------
--  DDL for Table TECHNICIANS
--------------------------------------------------------
CREATE TABLE TECHNICIANS
(
  TECHNICIAN_ID NUMBER NOT NULL PRIMARY KEY,
  AVAILABILITY NUMBER,
  TECH_SURNAME VARCHAR2(35 BYTE),
  TECH_PHONE_NUMBER VARCHAR2(10 BYTE),
  TECH_NAME VARCHAR2(35 BYTE),
  DEPARTMENT_ID NUMBER
);

COMMENT ON COLUMN TECHNICIANS.AVAILABILITY IS 'Each department role has a set max jobs, this is each user''s current jobs count';
COMMENT ON COLUMN TECHNICIANS.DEPARTMENT_ID IS 'The technicians department';


--------------------------------------------------------
--  DDL for Table DEPARTMENTS
--------------------------------------------------------
CREATE TABLE DEPARTMENTS
(
  DEPARTMENT_ID INT NOT NULL PRIMARY KEY
, DEPARTMENT_NAME VARCHAR2(40)
, DEPARTMENT_WORK_CAPACITY INTEGER
);
--

--------------------------------------------------------
--  Add contraints
--------------------------------------------------------
-- Orders
ALTER TABLE ORDERS
ADD CONSTRAINT PK_ORDERS PRIMARY KEY (ORDER_ID);
ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_CUST_FK1 FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID) ON DELETE CASCADE;

ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_TECHN_FK2 FOREIGN KEY (TECHNICIAN_ID) REFERENCES TECHNICIANS(TECHNICIAN_ID) ON DELETE CASCADE;
--

-- Customers
ALTER TABLE CUSTOMERS
ADD CONSTRAINT CUSTOMER_ADDRESS_FK FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID);
--

--  Technicians
ALTER TABLE TECHNICIANS
ADD CONSTRAINT TECH_DEPT_FK FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID);
--

-- Repairs
ALTER TABLE REPAIRS
 ADD CONSTRAINT REP_CUST_FK1 FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID) ON DELETE CASCADE;
ALTER TABLE REPAIRS
 ADD CONSTRAINT REP_TECHN_FK2 FOREIGN KEY (TECHNICIAN_ID) REFERENCES TECHNICIANS(TECHNICIAN_ID) ON DELETE CASCADE;
ALTER TABLE REPAIRS
 ADD CONSTRAINT REP_STATUS_FK4 FOREIGN KEY (STATUS_ID) REFERENCES STATUS(STATUS_ID) ON DELETE CASCADE;
--


--PARTS_IN_REPAIRS
ALTER TABLE PARTS_IN_REPAIR
ADD CONSTRAINT PIR_PARTS_FK2 FOREIGN KEY (PART_ID)REFERENCES PARTS(PART_ID);

ALTER TABLE PARTS_IN_REPAIR
ADD CONSTRAINT PIR_REP_FK1 FOREIGN KEY (REPAIR_ID) REFERENCES ORDERS(ORDER_ID);
--

--PARTS_IN_ORDER
ALTER TABLE PARTS_IN_ORDER
ADD CONSTRAINT PIO_ORDERS_FK1 FOREIGN KEY(ORDER_ID)REFERENCES ORDERS(ORDER_ID);
ALTER TABLE PARTS_IN_ORDER
ADD CONSTRAINT PIO_ORDERS_FK2 FOREIGN KEY (PARTS_ID)REFERENCES PARTS(PART_ID);
--
