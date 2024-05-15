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
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
