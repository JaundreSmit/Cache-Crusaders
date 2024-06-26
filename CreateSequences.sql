DROP SEQUENCE ORDER_ID_value;
DROP SEQUENCE ADDRESS_ID_value;
DROP SEQUENCE CUSTOMER_ID_value;
DROP SEQUENCE PART_ID_value;
DROP SEQUENCE PIO_ID_value;
DROP SEQUENCE PIR_ID_value;
DROP SEQUENCE PROVINCE_ID_value;
DROP SEQUENCE REPAIR_ID_value;
DROP SEQUENCE STATUS_ID_value;
DROP SEQUENCE TECHNICIAN_ID_value;
DROP SEQUENCE DEPARTMENT_ID_value;

CREATE SEQUENCE ORDER_ID_value
start with 1
increment by 1
minvalue 1
maxvalue 10000
cycle;

CREATE SEQUENCE ADDRESS_ID_value
start with 1
increment by 1
minvalue 1
maxvalue 10000
cycle;

CREATE SEQUENCE CUSTOMER_ID_value
start with 1
increment by 1
minvalue 1
maxvalue 10000
cycle;

CREATE SEQUENCE PART_ID_value
start with 1
increment by 1
minvalue 1
maxvalue 10000
cycle;

CREATE SEQUENCE PIO_ID_value
start with 1
increment by 1
minvalue 1
maxvalue 10000
cycle;

CREATE SEQUENCE PIR_ID_value
start with 1
increment by 1
minvalue 1
maxvalue 10000
cycle;

CREATE SEQUENCE PROVINCE_ID_value
start with 1
increment by 1
minvalue 1
maxvalue 10000
cycle;

CREATE SEQUENCE REPAIR_ID_value
start with 1
increment by 1
minvalue 1
maxvalue 10000
cycle;

CREATE SEQUENCE STATUS_ID_value
start with 1
increment by 1
minvalue 1
maxvalue 10000
cycle;

CREATE SEQUENCE TECHNICIAN_ID_value
start with 1
increment by 1
minvalue 1
maxvalue 10000
cycle;

CREATE SEQUENCE DEPARTMENT_ID_value
start with 1
increment by 1
minvalue 1
maxvalue 10000
cycle;
