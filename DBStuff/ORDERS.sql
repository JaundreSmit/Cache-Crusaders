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
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
