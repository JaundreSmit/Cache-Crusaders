--------------------------------------------------------
--  Constraints for Table REPAIR_ORDER
--------------------------------------------------------

  ALTER TABLE "FANIE"."REPAIR_ORDER" ADD CONSTRAINT "REPAIR_ORDER_PK" PRIMARY KEY ("REPAIR_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FANIE"."REPAIR_ORDER" MODIFY ("STATUS_ID" NOT NULL ENABLE);
  ALTER TABLE "FANIE"."REPAIR_ORDER" MODIFY ("PARTS_ID" NOT NULL ENABLE);
  ALTER TABLE "FANIE"."REPAIR_ORDER" MODIFY ("TECHNICIAN_ID" NOT NULL ENABLE);
  ALTER TABLE "FANIE"."REPAIR_ORDER" MODIFY ("CUSTOMER_ID" NOT NULL ENABLE);
  ALTER TABLE "FANIE"."REPAIR_ORDER" MODIFY ("REPAIR_ID" NOT NULL ENABLE);