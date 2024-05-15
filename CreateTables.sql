--------------------------------------------------------
--  File created - Wednesday-May-15-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "FANIE"."ORDERS" 
   (	"ORDER_ID" NUMBER(*,0), 
	"CUSTOMER_ID" NUMBER(*,0), 
	"TECHNICIAN_ID" NUMBER(*,0), 
	"PART_ID" NUMBER(*,0), 
	"ORDER_DATE" DATE, 
	"ORDER_STATUS" NUMBER(*,0), 
	"TOTAL_COST" FLOAT(126)
   );
--------------------------------------------------------
--  DDL for Table ADDRESS
--------------------------------------------------------

  CREATE TABLE "FANIE"."ADDRESS" 
   (	"ADDRESS_ID" NUMBER(*,0), 
	"STREET_NAME" VARCHAR2(20 BYTE), 
	"STREET_NUMBER" NUMBER(*,0), 
	"CITY" VARCHAR2(20 BYTE), 
	"PROVINCE_ID" NUMBER(*,0)
   );

   COMMENT ON COLUMN "FANIE"."ADDRESS"."PROVINCE_ID" IS 'Links to Provinces table';
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

  CREATE TABLE "FANIE"."CUSTOMERS" 
   (	"CUSTOMER_ID" NUMBER(*,0), 
	"CUSTOMER_EMAIL" VARCHAR2(30 BYTE), 
	"CUSTOMER_PHONE_NUMBER" VARCHAR2(10 BYTE), 
	"CUSTOMER_NAME" VARCHAR2(25 BYTE), 
	"CUSTOMER_SURNAME" VARCHAR2(25 BYTE), 
	"ADDRESS_ID" NUMBER(*,0)
   );

   COMMENT ON COLUMN "FANIE"."CUSTOMERS"."ADDRESS_ID" IS 'Links to Adress Table';
--------------------------------------------------------
--  DDL for Table PARTS
--------------------------------------------------------

  CREATE TABLE "FANIE"."PARTS" 
   (	"PART_ID" NUMBER(*,0), 
	"PART_NAME" VARCHAR2(20 BYTE), 
	"PART_BRAND" VARCHAR2(20 BYTE), 
	"PART_TYPE" VARCHAR2(20 BYTE), 
	"PART_COST" FLOAT(2), 
	"PARTS_IN_STOCK" NUMBER(*,0)
   );
--------------------------------------------------------
--  DDL for Table PARTS_IN_ORDER
--------------------------------------------------------

  CREATE TABLE "FANIE"."PARTS_IN_ORDER" 
   (	"ORDER_ID" NUMBER(*,0), 
	"PART_ID" NUMBER(*,0)
   );
--------------------------------------------------------
--  DDL for Table PARTS_IN_REPAIR
--------------------------------------------------------

  CREATE TABLE "FANIE"."PARTS_IN_REPAIR" 
   (	"REPAIR_ID" NUMBER(*,0), 
	"PART_ID" NUMBER(*,0)
   );
--------------------------------------------------------
--  DDL for Table PROVINCES
--------------------------------------------------------

  CREATE TABLE "FANIE"."PROVINCES" 
   (	"PROVINCE_ID" NUMBER(*,0), 
	"PROVINCE_NAME" VARCHAR2(30 BYTE)
   );
--------------------------------------------------------
--  DDL for Table REPAIR_ORDER
--------------------------------------------------------

  CREATE TABLE "FANIE"."REPAIR_ORDER" 
   (	"REPAIR_ID" NUMBER(*,0), 
	"CUSTOMER_ID" NUMBER(*,0), 
	"TECHNICIAN_ID" NUMBER(*,0), 
	"PART_ID" NUMBER(*,0), 
	"STATUS_ID" NUMBER(*,0), 
	"ADDRESS_ID" NUMBER(*,0), 
	"REPAIR_DATE" DATE, 
	"ACCUMULATED_COST" FLOAT(126)
   );

   COMMENT ON COLUMN "FANIE"."REPAIR_ORDER"."CUSTOMER_ID" IS 'Link to Customer table';
   COMMENT ON COLUMN "FANIE"."REPAIR_ORDER"."TECHNICIAN_ID" IS 'Link to Technician table';
   COMMENT ON COLUMN "FANIE"."REPAIR_ORDER"."PART_ID" IS 'Link to Part table/Parts used for repair';
   COMMENT ON COLUMN "FANIE"."REPAIR_ORDER"."STATUS_ID" IS 'Link to Status table';
   COMMENT ON COLUMN "FANIE"."REPAIR_ORDER"."ADDRESS_ID" IS 'Link To Address table';
   COMMENT ON COLUMN "FANIE"."REPAIR_ORDER"."REPAIR_DATE" IS 'Date job started';
   COMMENT ON COLUMN "FANIE"."REPAIR_ORDER"."ACCUMULATED_COST" IS 'Cost of repair for customers';
--------------------------------------------------------
--  DDL for Table STATUS
--------------------------------------------------------

  CREATE TABLE "FANIE"."STATUS" 
   (	"STATUS_ID" NUMBER(*,0), 
	"STATUS_NAME" VARCHAR2(25 BYTE)
   );

   COMMENT ON COLUMN "FANIE"."STATUS"."STATUS_ID" IS 'Test';
   COMMENT ON COLUMN "FANIE"."STATUS"."STATUS_NAME" IS 'In Progress/Todo/In Transit/Completed/ETC';
--------------------------------------------------------
--  DDL for Table TECHNICIANS
--------------------------------------------------------

  CREATE TABLE "FANIE"."TECHNICIANS" 
   (	"TECHNICIAN_ID" NUMBER(*,0), 
	"AVAILABILITY" NUMBER(*,0), 
	"TECH_SURNAME" VARCHAR2(25 BYTE), 
	"TECH_PHONE_NUMBER" VARCHAR2(10 BYTE), 
	"TECH_NAME" VARCHAR2(25 BYTE), 
	"DEPARTMENT_ID" VARCHAR2(20 BYTE)
   );

   COMMENT ON COLUMN "FANIE"."TECHNICIANS"."AVAILABILITY" IS 'Each department role has a set max jobs, this is each user''s current jobs count';
   COMMENT ON COLUMN "FANIE"."TECHNICIANS"."DEPARTMENT_ID" IS 'Needs FK implemented';

Insert into FANIE.PROVINCES (PROVINCE_ID,PROVINCE_NAME) values (1,'Eastern Cape');
Insert into FANIE.PROVINCES (PROVINCE_ID,PROVINCE_NAME) values (2,'Free State');
Insert into FANIE.PROVINCES (PROVINCE_ID,PROVINCE_NAME) values (3,'Gauteng');
Insert into FANIE.PROVINCES (PROVINCE_ID,PROVINCE_NAME) values (4,'KwaZulu-Natal');
Insert into FANIE.PROVINCES (PROVINCE_ID,PROVINCE_NAME) values (5,'Limpopo');
Insert into FANIE.PROVINCES (PROVINCE_ID,PROVINCE_NAME) values (6,'Mpumalanga');
Insert into FANIE.PROVINCES (PROVINCE_ID,PROVINCE_NAME) values (7,'Northern Cape');
Insert into FANIE.PROVINCES (PROVINCE_ID,PROVINCE_NAME) values (8,'North West');
Insert into FANIE.PROVINCES (PROVINCE_ID,PROVINCE_NAME) values (9,'Western Cape');
