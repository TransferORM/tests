CREATE TABLE  "TBL_ONETOMANY" 
   (	"IDBASIC" NUMBER(18,0) NOT NULL ENABLE, 
	"BASIC_STRING" VARCHAR2(50), 
	 CONSTRAINT "TBL_ONETOMANY_CON" PRIMARY KEY ("IDBASIC") ENABLE
   )
/
CREATE TABLE  "TBL_COMPOSITE" 
   (	"IDCOMPOSITE" VARCHAR2(200) NOT NULL ENABLE, 
	"COMPOSITE_STRING" VARCHAR2(200), 
	"LNKIDBASIC" NUMBER(18,0), 
	 CONSTRAINT "TBL_COMPOSITE_CON" PRIMARY KEY ("IDCOMPOSITE") ENABLE, 
	 CONSTRAINT "TBL_COMPOSITE_ONETOMANY" FOREIGN KEY ("LNKIDBASIC")
	  REFERENCES  "TBL_ONETOMANY" ("IDBASIC") ENABLE
   )
/
CREATE TABLE  "LNK_COMPOSITE1" 
   (	"LNKIDBASIC" NUMBER(18,0) NOT NULL ENABLE, 
	"LNKIDCOMPOSITE" VARCHAR2(200) NOT NULL ENABLE, 
	 CONSTRAINT "LNK_COMPOSITE1_CON" FOREIGN KEY ("LNKIDBASIC")
	  REFERENCES  "TBL_ONETOMANY" ("IDBASIC") ENABLE, 
	 CONSTRAINT "LNK_COMPOSITE1_COMPOSITE" FOREIGN KEY ("LNKIDCOMPOSITE")
	  REFERENCES  "TBL_COMPOSITE" ("IDCOMPOSITE") ENABLE
   )
/
CREATE TABLE  "LNK_MANYTOMANY2UUID" 
   (	"LNKIDMANYTOMANY" VARCHAR2(200) NOT NULL ENABLE, 
	"LNKIDBASIC" VARCHAR2(200) NOT NULL ENABLE
   )
/
CREATE TABLE  "TBL_BASICUUID" 
   (	"IDBASIC" VARCHAR2(200) NOT NULL ENABLE, 
	"BASIC_DATE" DATE NOT NULL ENABLE, 
	"BASIC_NUMERIC" NUMBER(18,0) DEFAULT 0, 
	"BASIC_STRING" VARCHAR2(200) DEFAULT 'gandalf', 
	"BASIC_UUID" VARCHAR2(200) NOT NULL ENABLE, 
	 CONSTRAINT "TBL_BASICUUID_CON" PRIMARY KEY ("IDBASIC") ENABLE
   )
/
CREATE TABLE  "TBL_MANYTOMANYUUID" 
   (	"IDSIMPLE" VARCHAR2(200) NOT NULL ENABLE, 
	 CONSTRAINT "TBL_MANYTOMANYUUID_CON" PRIMARY KEY ("IDSIMPLE") ENABLE
   )
/
CREATE TABLE  "LNK_MANYTOMANYUUID" 
   (	"LNKIDMANYTOMANY" VARCHAR2(200) NOT NULL ENABLE, 
	"LNKIDBASIC" VARCHAR2(200) NOT NULL ENABLE, 
	 CONSTRAINT "LNK_MANYTOMANYUUID_BASICUUID" FOREIGN KEY ("LNKIDBASIC")
	  REFERENCES  "TBL_BASICUUID" ("IDBASIC") ENABLE, 
	 CONSTRAINT "LNK_MANYTOMANYUUID_M2M" FOREIGN KEY ("LNKIDMANYTOMANY")
	  REFERENCES  "TBL_MANYTOMANYUUID" ("IDSIMPLE") ENABLE
   )
/
CREATE TABLE  "TBL_A" 
   (	"A_ID" VARCHAR2(200), 
	"LNKID" VARCHAR2(200), 
	"LNKID2" VARCHAR2(200), 
	"A_VALUE" VARCHAR2(200), 
	 CONSTRAINT "TBL_A_CON" PRIMARY KEY ("A_ID") ENABLE
   )
/
CREATE TABLE  "TBL_AP" 
   (	"AP_ID" VARCHAR2(200), 
	"A_ID" VARCHAR2(200), 
	"STRINGVALUE" VARCHAR2(200), 
	 PRIMARY KEY ("AP_ID") ENABLE
   )
/
CREATE TABLE  "TBL_B" 
   (	"B_ID" VARCHAR2(200), 
	"LNKID" VARCHAR2(200), 
	"LNKID2" VARCHAR2(200), 
	"B_VALUE" VARCHAR2(200), 
	 CONSTRAINT "TBL_B_CON" PRIMARY KEY ("B_ID") ENABLE
   )
/
CREATE TABLE  "TBL_BASIC" 
   (	"IDBASIC" NUMBER(18,0), 
	"BASIC_DATE" DATE, 
	"BASIC_NUMERIC" NUMBER(18,0), 
	"BASIC_STRING" VARCHAR2(200), 
	"BASIC_UUID" VARCHAR2(200), 
	"BASIC_BOOLEAN" NUMBER(*,0), 
	"BASIC_DECIMAL" NUMBER(18,5), 
	 CONSTRAINT "TBL_BASIC_CON" PRIMARY KEY ("IDBASIC") ENABLE
   )
/
CREATE TABLE  "TBL_BASICGUID" 
   (	"IDBASIC" VARCHAR2(200), 
	"BASIC_DATE" DATE NOT NULL ENABLE, 
	"BASIC_NUMERIC" NUMBER(18,0) NOT NULL ENABLE, 
	"BASIC_STRING" VARCHAR2(200), 
	"BASIC_UUID" VARCHAR2(200) NOT NULL ENABLE, 
	 CONSTRAINT "TBL_BASICGUID_CON" PRIMARY KEY ("IDBASIC") ENABLE
   )
/
CREATE TABLE  "TBL_BIGSTUFF" 
   (	"BIGSTUFFID" VARCHAR2(36) NOT NULL ENABLE, 
	"BIGSTUFF_CLOB" CLOB, 
	"BIGSTUFF_BLOB" BLOB, 
	 CONSTRAINT "BIGSTUFF_PK" PRIMARY KEY ("BIGSTUFFID") ENABLE
   )
/
CREATE TABLE  "TBL_C" 
   (	"C_ID" VARCHAR2(200) NOT NULL ENABLE, 
	"LNKID" VARCHAR2(200), 
	"LNKID2" VARCHAR2(200), 
	"C_VALUE" VARCHAR2(200), 
	 CONSTRAINT "TBL_C_CON" PRIMARY KEY ("C_ID") ENABLE
   )
/
CREATE TABLE  "TBL_CHILDMANYTOONEUUID" 
   (	"IDCHILD" VARCHAR2(200) NOT NULL ENABLE, 
	"MANYTOONECHILD_STRING" VARCHAR2(200), 
	 CONSTRAINT "TBL_CHILDMANYTOONEUUID_CON" PRIMARY KEY ("IDCHILD") ENABLE
   )
/
CREATE TABLE  "TBL_D" 
   (	"D_ID" VARCHAR2(200), 
	"LNKID" VARCHAR2(200), 
	"LNKID2" VARCHAR2(200), 
	"D_VALUE" VARCHAR2(200), 
	 PRIMARY KEY ("D_ID") ENABLE
   )
/
CREATE TABLE  "TBL_GENERATE" 
   (	"IDGENERATE" NUMBER(18,0) NOT NULL ENABLE, 
	"GENERATE_VALUE" VARCHAR2(50), 
	 CONSTRAINT "TBL_GENERATE_CON" PRIMARY KEY ("IDGENERATE") ENABLE
   )
/
CREATE TABLE  "TBL_MANYTOONEUUID" 
   (	"IDSIMPLE" VARCHAR2(200) NOT NULL ENABLE, 
	"MANYTOONE_STRING" VARCHAR2(200), 
	"LNKIDCHILD" VARCHAR2(200), 
	 CONSTRAINT "TBL_MANYTOONEUUID_CON" PRIMARY KEY ("IDSIMPLE") ENABLE, 
	 CONSTRAINT "TBL_MANYTOONE_CHILD" FOREIGN KEY ("LNKIDCHILD")
	  REFERENCES  "TBL_CHILDMANYTOONEUUID" ("IDCHILD") ENABLE
   )
/
CREATE TABLE  "TBL_NONE" 
   (	"IDBASIC" NUMBER(18,0) NOT NULL ENABLE, 
	"BASIC_STRING" VARCHAR2(200), 
	 CONSTRAINT "TBL_NONE_CON" PRIMARY KEY ("IDBASIC") ENABLE
   )
/
CREATE TABLE  "TBL_NONECHILD" 
   (	"IDCHILD" NUMBER(18,0) NOT NULL ENABLE, 
	"CHILD_NAME" VARCHAR2(200), 
	"LNKBASICID" NUMBER(18,0) NOT NULL ENABLE, 
	 CONSTRAINT "TBL_NONECHILD_CON" PRIMARY KEY ("IDCHILD") ENABLE, 
	 CONSTRAINT "TBL_NONECHILD_NONE" FOREIGN KEY ("LNKBASICID")
	  REFERENCES  "TBL_NONE" ("IDBASIC") ENABLE
   )
/
CREATE TABLE  "TBL_ONETOMANYCHILD" 
   (	"IDCHILD" NUMBER(18,0) NOT NULL ENABLE, 
	"CHILD_NAME" VARCHAR2(50), 
	"LNKBASICID" NUMBER(18,0), 
	 CONSTRAINT "TBL_ONETOMANYCHILD_CON" PRIMARY KEY ("IDCHILD") ENABLE, 
	 CONSTRAINT "TBL_ONETOMANYCHILD_ONETOMANY" FOREIGN KEY ("LNKBASICID")
	  REFERENCES  "TBL_ONETOMANY" ("IDBASIC") ENABLE
   )
/
CREATE TABLE  "TBL_PROPPARENT" 
   (	"IDPROPPARENT" NUMBER(18,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(50), 
	"THING" VARCHAR2(50), 
	 CONSTRAINT "TBL_PROPPARENT_CON" PRIMARY KEY ("IDPROPPARENT") ENABLE
   )
/
CREATE TABLE  "TBL_PROPCHILD" 
   (	"IDPROPCHILD" NUMBER(18,0) NOT NULL ENABLE, 
	"THING" VARCHAR2(50), 
	"LNKIDPROPPARENT" NUMBER(18,0), 
	 CONSTRAINT "TBL_PROPCHILD_CON" PRIMARY KEY ("IDPROPCHILD") ENABLE, 
	 CONSTRAINT "TBL_PROPCHILD_PROPPARENT" FOREIGN KEY ("LNKIDPROPPARENT")
	  REFERENCES  "TBL_PROPPARENT" ("IDPROPPARENT") ENABLE
   )
/
CREATE TABLE  "TBL_TRANSACTION" 
   (	"IDTRANSACTION" NUMBER(18,0) NOT NULL ENABLE, 
	"STRING" VARCHAR2(50), 
	 CONSTRAINT "TBL_TRANSACTION_CON" PRIMARY KEY ("IDTRANSACTION") ENABLE
   )
/
CREATE TABLE  "TBL_TREE" 
   (	"IDTREE" NUMBER(18,0) NOT NULL ENABLE, 
	"TREE_VALUE" VARCHAR2(200), 
	"LNKIDTREE" NUMBER(18,0), 
	 CONSTRAINT "TBL_TREE_CON" PRIMARY KEY ("IDTREE") ENABLE, 
	 CONSTRAINT "TBL_TREE_TREE" FOREIGN KEY ("LNKIDTREE")
	  REFERENCES  "TBL_TREE" ("IDTREE") ENABLE
   )
/
CREATE TABLE  "TRANSFER_SEQUENCE" 
   (	"SEQUENCE_NAME" VARCHAR2(250) NOT NULL ENABLE, 
	"SEQUENCE_VALUE" NUMBER(20,0) NOT NULL ENABLE, 
	 PRIMARY KEY ("SEQUENCE_NAME") ENABLE
   )
/

CREATE UNIQUE INDEX  "BIGSTUFF_PK" ON  "TBL_BIGSTUFF" ("BIGSTUFFID")
/
CREATE UNIQUE INDEX  "SYS_C004087" ON  "TBL_AP" ("AP_ID")
/
CREATE UNIQUE INDEX  "SYS_C004133" ON  "TBL_D" ("D_ID")
/
CREATE UNIQUE INDEX  "SYS_C004173" ON  "TRANSFER_SEQUENCE" ("SEQUENCE_NAME")
/
CREATE UNIQUE INDEX  "SYS_IL0000013854C00002$$" ON  "TBL_BIGSTUFF" (
/
CREATE UNIQUE INDEX  "SYS_IL0000013854C00003$$" ON  "TBL_BIGSTUFF" (
/
CREATE UNIQUE INDEX  "TBL_A_CON" ON  "TBL_A" ("A_ID")
/
CREATE UNIQUE INDEX  "TBL_BASICGUID_CON" ON  "TBL_BASICGUID" ("IDBASIC")
/
CREATE UNIQUE INDEX  "TBL_BASICUUID_CON" ON  "TBL_BASICUUID" ("IDBASIC")
/
CREATE UNIQUE INDEX  "TBL_BASIC_CON" ON  "TBL_BASIC" ("IDBASIC")
/
CREATE UNIQUE INDEX  "TBL_B_CON" ON  "TBL_B" ("B_ID")
/
CREATE UNIQUE INDEX  "TBL_CHILDMANYTOONEUUID_CON" ON  "TBL_CHILDMANYTOONEUUID" ("IDCHILD")
/
CREATE UNIQUE INDEX  "TBL_COMPOSITE_CON" ON  "TBL_COMPOSITE" ("IDCOMPOSITE")
/
CREATE UNIQUE INDEX  "TBL_C_CON" ON  "TBL_C" ("C_ID")
/
CREATE UNIQUE INDEX  "TBL_GENERATE_CON" ON  "TBL_GENERATE" ("IDGENERATE")
/
CREATE UNIQUE INDEX  "TBL_MANYTOMANYUUID_CON" ON  "TBL_MANYTOMANYUUID" ("IDSIMPLE")
/
CREATE UNIQUE INDEX  "TBL_MANYTOONEUUID_CON" ON  "TBL_MANYTOONEUUID" ("IDSIMPLE")
/
CREATE UNIQUE INDEX  "TBL_NONECHILD_CON" ON  "TBL_NONECHILD" ("IDCHILD")
/
CREATE UNIQUE INDEX  "TBL_NONE_CON" ON  "TBL_NONE" ("IDBASIC")
/
CREATE UNIQUE INDEX  "TBL_ONETOMANYCHILD_CON" ON  "TBL_ONETOMANYCHILD" ("IDCHILD")
/
CREATE UNIQUE INDEX  "TBL_ONETOMANY_CON" ON  "TBL_ONETOMANY" ("IDBASIC")
/
CREATE UNIQUE INDEX  "TBL_PROPCHILD_CON" ON  "TBL_PROPCHILD" ("IDPROPCHILD")
/
CREATE UNIQUE INDEX  "TBL_PROPPARENT_CON" ON  "TBL_PROPPARENT" ("IDPROPPARENT")
/
CREATE UNIQUE INDEX  "TBL_TRANSACTION_CON" ON  "TBL_TRANSACTION" ("IDTRANSACTION")
/
CREATE UNIQUE INDEX  "TBL_TREE_CON" ON  "TBL_TREE" ("IDTREE")
/

 CREATE SEQUENCE   "TBL_GENERATE_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 706 NOCACHE  NOORDER  NOCYCLE
/
 CREATE SEQUENCE   "TBL_NONECHILD_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 23 NOCACHE  NOORDER  NOCYCLE
/
 CREATE SEQUENCE   "TBL_NONE_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 45 NOCACHE  NOORDER  NOCYCLE
/
 CREATE SEQUENCE   "TBL_ONETOMANYCHILD_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1664 NOCACHE  NOORDER  NOCYCLE
/
 CREATE SEQUENCE   "TBL_ONETOMANY_SEQ2"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 863 NOCACHE  NOORDER  NOCYCLE
/
 CREATE SEQUENCE   "TBL_PROPCHILD_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 91 NOCACHE  NOORDER  NOCYCLE
/
 CREATE SEQUENCE   "TBL_PROPPARENT_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 20 NOCACHE  NOORDER  NOCYCLE
/
 CREATE SEQUENCE   "TBL_TRANSACTION_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE
/
 CREATE SEQUENCE   "TBL_TREE_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 120 NOCACHE  NOORDER  NOCYCLE
/
