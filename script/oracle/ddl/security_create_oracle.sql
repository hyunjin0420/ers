CREATE TABLE U_MEMBER
(
  M_INDEX           NUMBER(38)                  NOT NULL,
  M_ID              NVARCHAR2(20)               NOT NULL,
  M_PWD             NVARCHAR2(128)              NOT NULL,
  M_NAME            NVARCHAR2(10)               NOT NULL,
  M_JOINDATE        DATE                        NOT NULL,
  M_COMPANYTEL      NVARCHAR2(20),
  M_MOBILE          NVARCHAR2(20),
  M_EMAIL           NVARCHAR2(50),
  M_ETCINFO         NVARCHAR2(1000),
  M_LASTVISITE      DATE,
  M_LEVEL           CHAR(1 BYTE),
  M_G_FLAG          CHAR(1 BYTE),
  M_WORKGROUP       NVARCHAR2(10)               DEFAULT 'OTH',
  ERSMON_MENU_FLAG  NVARCHAR2(10)               DEFAULT '1111',
  M_QA_F            CHAR(1 BYTE)                DEFAULT 0,
  M_AGT_F           CHAR(1 BYTE),
  M_AGTID           VARCHAR2(32 BYTE),
  M_TMON_F          CHAR(1 BYTE)                DEFAULT 0,
  M_CTI_ID          VARCHAR2(32 BYTE),
  M_CTI_PWD         VARCHAR2(128 BYTE),
  M_CTI_DN          VARCHAR2(16 BYTE),
  SERVERIP          VARCHAR2(32 BYTE),
  CONNECTION_TYPE   CHAR(1 BYTE)                DEFAULT 1,
  TEMPID            VARCHAR2(20 BYTE),
  PWDCHANGEDATE     DATE                        DEFAULT sysdate,
  AUTHCNT           NUMBER                      DEFAULT 0,
  M_NO              VARCHAR2(256 BYTE),
  VIEWCHECK         CHAR(1 BYTE)                DEFAULT 1
);

ALTER TABLE U_MEMBER ADD (
  PRIMARY KEY
  (M_ID));



CREATE TABLE FW_AUTH_MAP
(
    M_LEVEL  CHAR(1)  NOT NULL ,
    AUTHOR_CODE           VARCHAR2(32)  NOT NULL ,
    ETC           VARCHAR2(32) 
);

CREATE INDEX FW_AUTH_MAP_INX1 ON FW_AUTH_MAP
(AUTHOR_CODE  ASC);



CREATE TABLE FW_AUTH_INFO
(
    AUTHOR_CODE           VARCHAR2(32)  NOT NULL ,
    AUTHOR_NM             VARCHAR2(60)  NOT NULL ,
    AUTHOR_DC             VARCHAR2(200)  NULL ,
    AUTHOR_CREAT_DE       CHAR(20)  NOT NULL ,
CONSTRAINT  FW_AUTH_INFO_PK PRIMARY KEY (AUTHOR_CODE)
);


CREATE TABLE FW_ROLE_HIERARCHY
(
    PARNTS_ROLE           VARCHAR2(30)  NOT NULL ,
    CHLDRN_ROLE           VARCHAR2(30)  NOT NULL ,
CONSTRAINT  FW_ROLE_HIERARCHY_PK PRIMARY KEY (PARNTS_ROLE,CHLDRN_ROLE),
CONSTRAINT  FW_ROLE_HIERARCHY_FK1 FOREIGN KEY (PARNTS_ROLE) REFERENCES FW_AUTH_INFO(AUTHOR_CODE) ON DELETE CASCADE,
CONSTRAINT  FW_ROLE_HIERARCHY_FK2 FOREIGN KEY (CHLDRN_ROLE) REFERENCES FW_AUTH_INFO(AUTHOR_CODE) ON DELETE CASCADE
);

CREATE UNIQUE INDEX FW_ROLE_HIERARCHY_INX1 ON FW_ROLE_HIERARCHY
(PARNTS_ROLE  ASC);
CREATE INDEX FW_ROLE_HIERARCHY_INX2 ON FW_ROLE_HIERARCHY
(CHLDRN_ROLE  ASC);



CREATE TABLE FW_ROLE_INFO
(
    ROLE_CODE             VARCHAR2(50)  NOT NULL ,
    ROLE_NM               VARCHAR2(60)  NOT NULL ,
    ROLE_PTTRN            VARCHAR2(300)  NULL ,
    ROLE_DC               VARCHAR2(200)  NULL ,
    ROLE_TY               VARCHAR2(80)  NULL ,
    ROLE_SORT             VARCHAR2(10)  NULL ,
    ROLE_CREAT_DE         CHAR(20)  NOT NULL ,
CONSTRAINT  FW_ROLE_INFO_PK PRIMARY KEY (ROLE_CODE)
);



CREATE TABLE FW_ROLE_AUTH_RELATE
(
    AUTHOR_CODE           VARCHAR2(30)  NOT NULL ,
    ROLE_CODE             VARCHAR2(50)  NOT NULL ,
    CREAT_DT              DATE  NULL ,
CONSTRAINT  FW_ROLE_AUTH_RELATE_PK PRIMARY KEY (AUTHOR_CODE,ROLE_CODE),
CONSTRAINT  FW_ROLE_AUTH_RELATE_FK1 FOREIGN KEY (AUTHOR_CODE) REFERENCES FW_AUTH_INFO(AUTHOR_CODE) ON DELETE CASCADE,
CONSTRAINT  FW_ROLE_AUTH_RELATE_FK2 FOREIGN KEY (ROLE_CODE) REFERENCES FW_ROLE_INFO(ROLE_CODE) ON DELETE CASCADE
);

CREATE INDEX FW_ROLE_AUTH_RELATE_INX1 ON FW_ROLE_AUTH_RELATE
(AUTHOR_CODE  ASC);
CREATE INDEX FW_ROLE_AUTH_RELATE_INX2 ON FW_ROLE_AUTH_RELATE
(ROLE_CODE  ASC);



