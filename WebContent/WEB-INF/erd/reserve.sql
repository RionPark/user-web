
/* Drop Triggers */

DROP TRIGGER TRI_theater_info_ti_num;
DROP TRIGGER TRI_theater_park_tp_num;



/* Drop Tables */

DROP TABLE theater_park CASCADE CONSTRAINTS;
DROP TABLE theater_info CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_theater_info_ti_num;
DROP SEQUENCE SEQ_theater_park_tp_num;




/* Create Sequences */

CREATE SEQUENCE SEQ_theater_info_ti_num INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_theater_park_tp_num INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE theater_info
(
	ti_num number(4,0) NOT NULL,
	ti_name varchar2(30) NOT NULL,
	ti_address varchar2(300) NOT NULL,
	ti_phone1 varchar2(15),
	ti_phone2 varchar2(15),
	PRIMARY KEY (ti_num)
);


CREATE TABLE theater_park
(
	tp_num number(5,0) NOT NULL,
	tp_name varchar2(30) NOT NULL,
	tp_address varchar2(300) NOT NULL,
	tp_phone varchar2(15),
	ti_num number(4,0) NOT NULL,
	PRIMARY KEY (tp_num)
);



/* Create Foreign Keys */

ALTER TABLE theater_park
	ADD FOREIGN KEY (ti_num)
	REFERENCES theater_info (ti_num)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_theater_info_ti_num BEFORE INSERT ON theater_info
FOR EACH ROW
BEGIN
	SELECT SEQ_theater_info_ti_num.nextval
	INTO :new.ti_num
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_theater_park_tp_num BEFORE INSERT ON theater_park
FOR EACH ROW
BEGIN
	SELECT SEQ_theater_park_tp_num.nextval
	INTO :new.tp_num
	FROM dual;
END;

/




