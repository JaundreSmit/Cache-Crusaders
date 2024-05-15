--------------------------------------------------------
--  DDL for Table ADDRESS
--------------------------------------------------------

  CREATE TABLE "FANIE"."ADDRESS" 
   (	"ADDRESS_ID" NUMBER(*,0), 
	"STREET_NAME" VARCHAR2(20 BYTE), 
	"STREET_NUMBER" NUMBER(*,0), 
	"CITY" VARCHAR2(20 BYTE), 
	"PROVINCE_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "FANIE"."ADDRESS"."PROVINCE_ID" IS 'Links to Provinces table';