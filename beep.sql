--------------------------------------------------------
--  파일이 생성됨 - 금요일-2월-16-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CHANNELS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."CHANNELS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence CHANNELS_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."CHANNELS_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence CHANNEL_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."CHANNEL_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence CHAT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."CHAT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence USERS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."USERS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence VERIFICATION_TOKENS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."VERIFICATION_TOKENS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence VIDEO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."VIDEO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "SCOTT"."CATEGORY" 
   (	"CATEGORY_ID" NUMBER(10,0), 
	"CATEGORY_NAME" VARCHAR2(1000 CHAR), 
	"CATEGORY_IMAGE_URL" VARCHAR2(1000 CHAR), 
	"CATEGORY_TOTAL_VIEW" NUMBER(10,0) DEFAULT NULL
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CHANNELS
--------------------------------------------------------

  CREATE TABLE "SCOTT"."CHANNELS" 
   (	"CHANNEL_ID" NUMBER(10,0), 
	"CHANNEL_USER_ACCOUNT" NUMBER(10,0), 
	"CHANNEL_TITLE" VARCHAR2(3000 CHAR), 
	"CHANNEL_CONTENT" VARCHAR2(3000 CHAR), 
	"CHANNEL_CREATED_TIME" TIMESTAMP (6) DEFAULT systimestamp, 
	"CHANNEL_PROFILE_IMG" VARCHAR2(1000 CHAR) DEFAULT '/images/default.png', 
	"CATEGORY_OF_CHANNEL" NUMBER(10,0), 
	"CHANNEL_VIEWER_COUNT" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CHAT
--------------------------------------------------------

  CREATE TABLE "SCOTT"."CHAT" 
   (	"CHAT_ID" NUMBER(20,0), 
	"USER_NO" NUMBER(10,0), 
	"CHANNEL_ID" NUMBER(10,0), 
	"CONTENT" VARCHAR2(1000 CHAR), 
	"CREATED_TIME" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CHAT_STATE
--------------------------------------------------------

  CREATE TABLE "SCOTT"."CHAT_STATE" 
   (	"CHANNEL_ID" NUMBER(10,0), 
	"CHAT_STATE_SET" VARCHAR2(15 CHAR) DEFAULT 'DEFAULT'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FOLLOWS
--------------------------------------------------------

  CREATE TABLE "SCOTT"."FOLLOWS" 
   (	"FOLLOW_ID" NUMBER(10,0) GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"FOLLOWER_USER_ID" NUMBER(10,0), 
	"FOLLOWING_USER_ID" NUMBER(10,0), 
	"CREATED_TIME" TIMESTAMP (6) DEFAULT systimestamp
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table STREAMING_STATE
--------------------------------------------------------

  CREATE TABLE "SCOTT"."STREAMING_STATE" 
   (	"CHANNEL_ID" NUMBER(10,0), 
	"STREAMING_STATE_SET" VARCHAR2(10 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USER_ACCOUNTS
--------------------------------------------------------

  CREATE TABLE "SCOTT"."USER_ACCOUNTS" 
   (	"USER_ID" NUMBER(10,0) GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"USER_NAME" VARCHAR2(1000 CHAR), 
	"USER_PASSWORD" VARCHAR2(1000 CHAR), 
	"USER_NICKNAME" VARCHAR2(500 CHAR), 
	"JOIN_DATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"USER_EMAIL" VARCHAR2(1000 CHAR), 
	"USER_STREAMING_KEY" VARCHAR2(255 BYTE), 
	"USER_PROFILE_IMAGE_URL" VARCHAR2(255 BYTE) DEFAULT 'default.img', 
	"USER_SELF_INTRODUCTION" VARCHAR2(300 BYTE), 
	"USER_EMAIL_VERIFIED" NUMBER(1,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USER_ROLES
--------------------------------------------------------

  CREATE TABLE "SCOTT"."USER_ROLES" 
   (	"USER_ID" NUMBER(10,0), 
	"USER_ROLES" VARCHAR2(10 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table VERIFICATION_TOKENS
--------------------------------------------------------

  CREATE TABLE "SCOTT"."VERIFICATION_TOKENS" 
   (	"VERIFI_TOKEN_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"VERIFI_TOKEN_VALUE" VARCHAR2(255 BYTE), 
	"VERIFI_TOKEN_USER_ACCOUNT" NUMBER, 
	"VERIFI_TOKEN_EXPIRY_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table VIDEO
--------------------------------------------------------

  CREATE TABLE "SCOTT"."VIDEO" 
   (	"VIDEO_ID" NUMBER(10,0), 
	"USER_NO" NUMBER(10,0), 
	"TITLE" VARCHAR2(1000 CHAR), 
	"DESCRIPTION" VARCHAR2(3000 CHAR), 
	"UPLOAD_DATE" TIMESTAMP (6), 
	"DURATION" NUMBER(10,0), 
	"FILE_PATH" VARCHAR2(1000 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into SCOTT.CATEGORY
SET DEFINE OFF;
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (115,'League of Legends','//images.igdb.com/igdb/image/upload/t_cover_big/co49wj.jpg',1);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (229045,'Pokémon League of Legends','//images.igdb.com/igdb/image/upload/t_cover_big/co6jv4.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (124700,'League of Legends: Wild Rift','//images.igdb.com/igdb/image/upload/t_cover_big/co1s08.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (225568,'Untitled League of Legends MMO','//images.igdb.com/igdb/image/upload/t_cover_big/co5rp7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (115653,'Pokémon Shield','//images.igdb.com/igdb/image/upload/t_cover_big/co1zk1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (37382,'Pokémon Sword','//images.igdb.com/igdb/image/upload/t_cover_big/co1zk2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (144054,'Pokémon Legends: Arceus','//images.igdb.com/igdb/image/upload/t_cover_big/co3d03.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1521,'Pokémon Black Version','//images.igdb.com/igdb/image/upload/t_cover_big/co1z1x.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3270,'Grand Theft Auto: Chinatown Wars','//images.igdb.com/igdb/image/upload/t_cover_big/co2lba.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (45131,'Grand Theft Auto V: Special Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co2nbc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (27912,'Grand Theft Auto IV: Complete Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co1twe.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (98077,'Grand Theft Auto V: Premium Online Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co1twh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (195342,'The Elder Scrolls Online: High Isle','//images.igdb.com/igdb/image/upload/t_cover_big/co4v64.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (21816,'High Velocity Bowling','//images.igdb.com/igdb/image/upload/t_cover_big/w6ijuatsyiwncmzgf5zb.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (275284,'Le Chat Fonce','//images.igdb.com/igdb/image/upload/t_cover_big/co7bq2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (280857,'Chat Guess Games','//images.igdb.com/igdb/image/upload/t_cover_big/co7je9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (262050,'Kongregate Chat','//images.igdb.com/igdb/image/upload/t_cover_big/co6ybv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (138254,'A Chat with Charon','//images.igdb.com/igdb/image/upload/t_cover_big/co2fv6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (220407,'Maskonauts: Chat''Attack','//images.igdb.com/igdb/image/upload/t_cover_big/co5vcv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (398,'Final Fantasy XII','//images.igdb.com/igdb/image/upload/t_cover_big/co3rhx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (193578,'Lights, Camera, Reaction!: IRL Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co4jve.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (71,'Portal','//images.igdb.com/igdb/image/upload/t_cover_big/co1x7d.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (732,'Grand Theft Auto: San Andreas','//images.igdb.com/igdb/image/upload/t_cover_big/co2lb9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1009,'The Last of Us','//images.igdb.com/igdb/image/upload/t_cover_big/co1r7f.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (233,'Half-Life 2','//images.igdb.com/igdb/image/upload/t_cover_big/co1nmw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (20,'BioShock','//images.igdb.com/igdb/image/upload/t_cover_big/co2mli.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (127,'Assassin''s Creed II','//images.igdb.com/igdb/image/upload/t_cover_big/co1rcf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (733,'Grand Theft Auto: Vice City','//images.igdb.com/igdb/image/upload/t_cover_big/co2lbb.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (19560,'God of War','//images.igdb.com/igdb/image/upload/t_cover_big/co1tmu.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (538,'BioShock Infinite','//images.igdb.com/igdb/image/upload/t_cover_big/co2n12.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (74,'Mass Effect 2','//images.igdb.com/igdb/image/upload/t_cover_big/co20ac.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (231,'Half-Life','//images.igdb.com/igdb/image/upload/t_cover_big/co7q89.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (500,'Batman: Arkham Asylum','//images.igdb.com/igdb/image/upload/t_cover_big/co1voj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (231577,'Blood Bowl 3: Black Orcs Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co60er.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (147666,'Shinobi Blade','//images.igdb.com/igdb/image/upload/t_cover_big/co5as7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (133455,'Let''s Cook Together','//images.igdb.com/igdb/image/upload/t_cover_big/co2uuv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (89616,'Bubble Whirl Shooter','//images.igdb.com/igdb/image/upload/t_cover_big/co448a.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (263822,'All Alone','//images.igdb.com/igdb/image/upload/t_cover_big/co701a.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (132180,'Valkyria Revolution: Vanargand Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co2gco.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (213046,'The Ultimate FMV Bundle 2','//images.igdb.com/igdb/image/upload/t_cover_big/co52iy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (41342,'19: Neunzehn','//images.igdb.com/igdb/image/upload/t_cover_big/co6k0i.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (14144,'Final Fantasy X/X-2 HD Remaster','//images.igdb.com/igdb/image/upload/t_cover_big/co2zpl.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (279064,'League of Legends: Esports Manager','//images.igdb.com/igdb/image/upload/t_cover_big/co7gh1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1522,'Pokémon White Version','//images.igdb.com/igdb/image/upload/t_cover_big/co1z21.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (102874,'Pokémon Quest','//images.igdb.com/igdb/image/upload/t_cover_big/co1zjv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (399,'Final Fantasy IV','//images.igdb.com/igdb/image/upload/t_cover_big/co2y76.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (79844,'YuYu Hakusho Final: Makai Saikyou Retsuden','//images.igdb.com/igdb/image/upload/t_cover_big/co3z43.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (426,'Final Fantasy VI','//images.igdb.com/igdb/image/upload/t_cover_big/co31c2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (16587,'Final Fantasy IV','//images.igdb.com/igdb/image/upload/t_cover_big/co31c0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (6707,'Tales from the Borderlands','//images.igdb.com/igdb/image/upload/t_cover_big/co20tr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (12503,'The Witcher 3: Wild Hunt - Hearts of Stone','//images.igdb.com/igdb/image/upload/t_cover_big/co1t7q.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (9509,'Call of Duty: Black Ops III','//images.igdb.com/igdb/image/upload/t_cover_big/co20yw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1219,'Kingdom Hearts','//images.igdb.com/igdb/image/upload/t_cover_big/co30zf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (37777,'Shadow of the Tomb Raider','//images.igdb.com/igdb/image/upload/t_cover_big/co1vcn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3212,'The Sims 4','//images.igdb.com/igdb/image/upload/t_cover_big/co3h3l.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (28204,'Call of Duty: WWII','//images.igdb.com/igdb/image/upload/t_cover_big/co1rdj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7444,'Shovel Knight','//images.igdb.com/igdb/image/upload/t_cover_big/co6pup.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (880,'Resident Evil 2','//images.igdb.com/igdb/image/upload/t_cover_big/co2vz0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11157,'Hitman','//images.igdb.com/igdb/image/upload/t_cover_big/co2fgr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (991,'Halo 4','//images.igdb.com/igdb/image/upload/t_cover_big/co1xhf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (37016,'Metro Exodus','//images.igdb.com/igdb/image/upload/t_cover_big/co1iuj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (9498,'Deus Ex: Mankind Divided','//images.igdb.com/igdb/image/upload/t_cover_big/co25jt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (25657,'Destiny 2','//images.igdb.com/igdb/image/upload/t_cover_big/co67qb.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1981,'Saints Row IV','//images.igdb.com/igdb/image/upload/t_cover_big/co1nrn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1048,'Hitman: Blood Money','//images.igdb.com/igdb/image/upload/t_cover_big/co2dm6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (26855,'Dead Cells','//images.igdb.com/igdb/image/upload/t_cover_big/co7jfv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (114795,'Apex Legends','//images.igdb.com/igdb/image/upload/t_cover_big/co1wzo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (99,'Need for Speed: Carbon','//images.igdb.com/igdb/image/upload/t_cover_big/co209k.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7789,'The Binding of Isaac: Rebirth','//images.igdb.com/igdb/image/upload/t_cover_big/co1lbm.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (312,'Doom II: Hell on Earth','//images.igdb.com/igdb/image/upload/t_cover_big/co6iip.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (223,'The Sims','//images.igdb.com/igdb/image/upload/t_cover_big/co3hcl.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (26764,'Mario Kart 8 Deluxe','//images.igdb.com/igdb/image/upload/t_cover_big/co213p.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (361,'Far Cry 2','//images.igdb.com/igdb/image/upload/t_cover_big/co1vpo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (224,'The Sims 2','//images.igdb.com/igdb/image/upload/t_cover_big/co3dm5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (837,'Prince of Persia: Warrior Within','//images.igdb.com/igdb/image/upload/t_cover_big/co39vm.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (547,'Gears of War','//images.igdb.com/igdb/image/upload/t_cover_big/co28gi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (517,'F.E.A.R.','//images.igdb.com/igdb/image/upload/t_cover_big/co1utk.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7205,'SuperHot','//images.igdb.com/igdb/image/upload/t_cover_big/co2656.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (103298,'Doom Eternal','//images.igdb.com/igdb/image/upload/t_cover_big/co3p5n.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1559,'Pokémon FireRed Version','//images.igdb.com/igdb/image/upload/t_cover_big/co1ziq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1075,'Super Mario Sunshine','//images.igdb.com/igdb/image/upload/t_cover_big/co21rh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7346,'The Legend of Zelda: Breath of the Wild','//images.igdb.com/igdb/image/upload/t_cover_big/co3p2d.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (73,'Mass Effect','//images.igdb.com/igdb/image/upload/t_cover_big/co1x7o.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (25076,'Red Dead Redemption 2','//images.igdb.com/igdb/image/upload/t_cover_big/co1q1f.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (501,'Batman: Arkham City','//images.igdb.com/igdb/image/upload/t_cover_big/co1voh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7331,'Uncharted 4: A Thief''s End','//images.igdb.com/igdb/image/upload/t_cover_big/co1r7h.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1164,'Tomb Raider','//images.igdb.com/igdb/image/upload/t_cover_big/co1rbu.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (434,'Red Dead Redemption','//images.igdb.com/igdb/image/upload/t_cover_big/co2lcv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (565,'Uncharted 2: Among Thieves','//images.igdb.com/igdb/image/upload/t_cover_big/co1tnb.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (529,'Far Cry 3','//images.igdb.com/igdb/image/upload/t_cover_big/co1vpd.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11156,'Horizon Zero Dawn','//images.igdb.com/igdb/image/upload/t_cover_big/co2una.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (16,'Fallout: New Vegas','//images.igdb.com/igdb/image/upload/t_cover_big/co1u60.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1029,'The Legend of Zelda: Ocarina of Time','//images.igdb.com/igdb/image/upload/t_cover_big/co3nnx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (121,'Minecraft','//images.igdb.com/igdb/image/upload/t_cover_big/co49x5.jpg',0);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (75,'Mass Effect 3','//images.igdb.com/igdb/image/upload/t_cover_big/co1x7q.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1011,'Borderlands 2','//images.igdb.com/igdb/image/upload/t_cover_big/co20tn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7351,'Doom','//images.igdb.com/igdb/image/upload/t_cover_big/co1nc7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7599,'Life is Strange','//images.igdb.com/igdb/image/upload/t_cover_big/co1r8e.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1074,'Super Mario 64','//images.igdb.com/igdb/image/upload/t_cover_big/co721v.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (623,'Call of Duty 4: Modern Warfare','//images.igdb.com/igdb/image/upload/t_cover_big/co1wko.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1070,'Super Mario World','//images.igdb.com/igdb/image/upload/t_cover_big/co65za.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (128,'Assassin''s Creed','//images.igdb.com/igdb/image/upload/t_cover_big/co1rrw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (533,'Dishonored','//images.igdb.com/igdb/image/upload/t_cover_big/co5pcs.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (18,'Max Payne','//images.igdb.com/igdb/image/upload/t_cover_big/co3wb2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (731,'Grand Theft Auto IV','//images.igdb.com/igdb/image/upload/t_cover_big/co2lbv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1871,'The Walking Dead: Season One','//images.igdb.com/igdb/image/upload/t_cover_big/co2j1g.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (113,'Assassin''s Creed Brotherhood','//images.igdb.com/igdb/image/upload/t_cover_big/co6t4d.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (15,'Fallout 3','//images.igdb.com/igdb/image/upload/t_cover_big/co1ycw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1970,'Assassin''s Creed IV Black Flag','//images.igdb.com/igdb/image/upload/t_cover_big/co4qfn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (76,'Dragon Age: Origins','//images.igdb.com/igdb/image/upload/t_cover_big/co2mvs.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (12517,'Undertale','//images.igdb.com/igdb/image/upload/t_cover_big/co2855.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (19565,'Marvel''s Spider-Man','//images.igdb.com/igdb/image/upload/t_cover_big/co1r77.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (9630,'Fallout 4','//images.igdb.com/igdb/image/upload/t_cover_big/co1yc6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7342,'Inside','//images.igdb.com/igdb/image/upload/t_cover_big/co2fca.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (26758,'Super Mario Odyssey','//images.igdb.com/igdb/image/upload/t_cover_big/co1mxf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1068,'Super Mario Bros. 3','//images.igdb.com/igdb/image/upload/t_cover_big/co7ozx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1026,'The Legend of Zelda: A Link to the Past','//images.igdb.com/igdb/image/upload/t_cover_big/co3vzn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7334,'Bloodborne','//images.igdb.com/igdb/image/upload/t_cover_big/co1rba.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (6036,'The Last of Us Remastered','//images.igdb.com/igdb/image/upload/t_cover_big/co5zks.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (59,'The Elder Scrolls IV: Oblivion','//images.igdb.com/igdb/image/upload/t_cover_big/co1tc8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (375,'Metal Gear Solid','//images.igdb.com/igdb/image/upload/t_cover_big/co7k2q.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (14593,'Hollow Knight','//images.igdb.com/igdb/image/upload/t_cover_big/co1rgi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (974,'Resident Evil 4','//images.igdb.com/igdb/image/upload/t_cover_big/co2wk8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11133,'Dark Souls III','//images.igdb.com/igdb/image/upload/t_cover_big/co1vcf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1331,'Limbo','//images.igdb.com/igdb/image/upload/t_cover_big/co1qrs.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (730,'Grand Theft Auto III','//images.igdb.com/igdb/image/upload/t_cover_big/co2lb8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (427,'Final Fantasy VII','//images.igdb.com/igdb/image/upload/t_cover_big/co2kx2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (512,'Uncharted 3: Drake''s Deception','//images.igdb.com/igdb/image/upload/t_cover_big/co1tp8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (132,'Warcraft III: Reign of Chaos','//images.igdb.com/igdb/image/upload/t_cover_big/co1xuq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (559,'Call of Duty: Modern Warfare 2','//images.igdb.com/igdb/image/upload/t_cover_big/co3cwt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (247,'Half-Life 2: Episode Two','//images.igdb.com/igdb/image/upload/t_cover_big/co2mw2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1266,'Assassin''s Creed III','//images.igdb.com/igdb/image/upload/t_cover_big/co1xii.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (5503,'Batman: Arkham Knight','//images.igdb.com/igdb/image/upload/t_cover_big/co1nh1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2155,'Dark Souls','//images.igdb.com/igdb/image/upload/t_cover_big/co1x78.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (478,'The Witcher 2: Assassins of Kings','//images.igdb.com/igdb/image/upload/t_cover_big/co1wy4.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (126,'Diablo II','//images.igdb.com/igdb/image/upload/t_cover_big/co3gfq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7344,'Ori and the Blind Forest','//images.igdb.com/igdb/image/upload/t_cover_big/co1y41.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (116,'Star Wars: Knights of the Old Republic','//images.igdb.com/igdb/image/upload/t_cover_big/co1tmz.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3025,'Middle-earth: Shadow of Mordor','//images.igdb.com/igdb/image/upload/t_cover_big/co20pd.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (17000,'Stardew Valley','//images.igdb.com/igdb/image/upload/t_cover_big/xrpmydnu9rpxvxfjkiu7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11208,'NieR: Automata','//images.igdb.com/igdb/image/upload/t_cover_big/co5pcj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (39,'Mafia','//images.igdb.com/igdb/image/upload/t_cover_big/co1qrt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1372,'Counter-Strike: Global Offensive','//images.igdb.com/igdb/image/upload/t_cover_big/co6996.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (358,'Super Mario Bros.','//images.igdb.com/igdb/image/upload/t_cover_big/co6pib.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2031,'Wolfenstein: The New Order','//images.igdb.com/igdb/image/upload/t_cover_big/co21c0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7323,'Rise of the Tomb Raider','//images.igdb.com/igdb/image/upload/t_cover_big/co1rqa.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1802,'Chrono Trigger','//images.igdb.com/igdb/image/upload/t_cover_big/co3plw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (545,'Call of Duty: Black Ops','//images.igdb.com/igdb/image/upload/t_cover_big/co1wkl.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1384,'Hotline Miami','//images.igdb.com/igdb/image/upload/t_cover_big/co1vqp.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2207,'Shadow of the Colossus','//images.igdb.com/igdb/image/upload/t_cover_big/co1ozz.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (26192,'The Last of Us Part II','//images.igdb.com/igdb/image/upload/t_cover_big/co5ziw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (431,'Uncharted: Drake''s Fortune','//images.igdb.com/igdb/image/upload/t_cover_big/co1tp7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2993,'The Wolf Among Us','//images.igdb.com/igdb/image/upload/t_cover_big/co1rcy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (37,'Dead Space','//images.igdb.com/igdb/image/upload/t_cover_big/co2g7w.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1262,'South Park: The Stick of Truth','//images.igdb.com/igdb/image/upload/t_cover_big/co1v8x.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (537,'Assassin''s Creed Revelations','//images.igdb.com/igdb/image/upload/t_cover_big/co1xih.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (379,'Metal Gear Solid 3: Snake Eater','//images.igdb.com/igdb/image/upload/t_cover_big/co5ei5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (8173,'Overwatch','//images.igdb.com/igdb/image/upload/t_cover_big/co1rcb.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (40,'Mafia II','//images.igdb.com/igdb/image/upload/t_cover_big/co2n13.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (866,'Sid Meier''s Civilization V','//images.igdb.com/igdb/image/upload/t_cover_big/co20up.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1077,'Super Mario Galaxy','//images.igdb.com/igdb/image/upload/t_cover_big/co21ro.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (230,'StarCraft','//images.igdb.com/igdb/image/upload/t_cover_big/co1x7n.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (26226,'Celeste','//images.igdb.com/igdb/image/upload/t_cover_big/co3byy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1020,'Grand Theft Auto V','//images.igdb.com/igdb/image/upload/t_cover_big/co2lbd.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1942,'The Witcher 3: Wild Hunt','//images.igdb.com/igdb/image/upload/t_cover_big/co1wyy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (72,'Portal 2','//images.igdb.com/igdb/image/upload/t_cover_big/co1rs4.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (472,'The Elder Scrolls V: Skyrim','//images.igdb.com/igdb/image/upload/t_cover_big/co1tnw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (275104,'Shin Pokemon: Red Version','//images.igdb.com/igdb/image/upload/t_cover_big/co7k6q.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (275103,'Shin Pokemon: Blue Version','//images.igdb.com/igdb/image/upload/t_cover_big/co7k6p.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (275105,'Shin Pokemon: Green Version','//images.igdb.com/igdb/image/upload/t_cover_big/co7k6u.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2290,'Pokémon Stadium 2','//images.igdb.com/igdb/image/upload/t_cover_big/co4w07.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1352,'Journey','//images.igdb.com/igdb/image/upload/t_cover_big/co1q8q.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1985,'Metal Gear Solid V: The Phantom Pain','//images.igdb.com/igdb/image/upload/t_cover_big/co1v85.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (26128,'Lost Ark','//images.igdb.com/igdb/image/upload/t_cover_big/co4w4j.jpg',6);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (250199,'Pokemon Flux','//images.igdb.com/igdb/image/upload/t_cover_big/co7k62.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (250467,'Pokemon Bois','//images.igdb.com/igdb/image/upload/t_cover_big/co6j4i.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (266156,'Pokemon Myth','//images.igdb.com/igdb/image/upload/t_cover_big/co7k61.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (8353,'Pokémon White Version 2','//images.igdb.com/igdb/image/upload/t_cover_big/co1z8e.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (272886,'Pokemon Saiph 2','//images.igdb.com/igdb/image/upload/t_cover_big/co7d73.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (264130,'Pokemon Daycare','//images.igdb.com/igdb/image/upload/t_cover_big/co7k69.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (196863,'Pokemon Breeder','//images.igdb.com/igdb/image/upload/t_cover_big/co4na8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (265984,'Pokemon Black 2: DE','//images.igdb.com/igdb/image/upload/t_cover_big/co728m.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (283116,'Pokemon Orb Version','//images.igdb.com/igdb/image/upload/t_cover_big/co7nb6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (240006,'Pokemon Heads & Tails','//images.igdb.com/igdb/image/upload/t_cover_big/co67mr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (204875,'Prison Life Simulator 2022: World Fight Battle GTA Ultimate','//images.igdb.com/igdb/image/upload/t_cover_big/co4vd0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (121176,'GTA: La Heist','//images.igdb.com/igdb/image/upload/t_cover_big/co6mgh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (256090,'Blood on the Clocktower','//images.igdb.com/igdb/image/upload/t_cover_big/co6q6z.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (214991,'Maxon Petting Simulator','//images.igdb.com/igdb/image/upload/t_cover_big/co5y0p.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (173172,'Outer Wilds: Archaeologist Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co3yjh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (142494,'Dragon Ball Z: Kakarot - Dragon Ball Card Warriors','//images.igdb.com/igdb/image/upload/t_cover_big/co4hal.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (5010,'MLB Power Pros 2008','//images.igdb.com/igdb/image/upload/t_cover_big/co4hkv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (88973,'Goblin Sword','//images.igdb.com/igdb/image/upload/t_cover_big/co1zdd.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (119159,'Fuga: Melodies of Steel','//images.igdb.com/igdb/image/upload/t_cover_big/co3gll.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (4095,'Scaler','//images.igdb.com/igdb/image/upload/t_cover_big/co4bvj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (141663,'Pokémon Unbound','//images.igdb.com/igdb/image/upload/t_cover_big/co7k5w.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (20196,'Metal Gear Solid: The Legacy Collection','//images.igdb.com/igdb/image/upload/t_cover_big/co45jf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (135478,'Hrot','//images.igdb.com/igdb/image/upload/t_cover_big/co2omv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (123757,'PilotXross','//images.igdb.com/igdb/image/upload/t_cover_big/co3vbi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (83563,'NeptuneGL','//images.igdb.com/igdb/image/upload/t_cover_big/co3b9x.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (116090,'Loop Craft','//images.igdb.com/igdb/image/upload/t_cover_big/co3hb5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (76883,'In the Valley of Gods','//images.igdb.com/igdb/image/upload/t_cover_big/co2eyk.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (106694,'Plague Hunter','//images.igdb.com/igdb/image/upload/t_cover_big/co5vmj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (259874,'The God Slayer','//images.igdb.com/igdb/image/upload/t_cover_big/co6vrv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (245937,'5 Star Fishy','//images.igdb.com/igdb/image/upload/t_cover_big/co6okb.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (223380,'Project Faith','//images.igdb.com/igdb/image/upload/t_cover_big/co5vnc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (81753,'AfterTheDawn','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (225206,'Margaritari','//images.igdb.com/igdb/image/upload/t_cover_big/co5vnb.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (279950,'Kitty Cat Combat','//images.igdb.com/igdb/image/upload/t_cover_big/co7orc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (279661,'Monster Hunter Wilds','//images.igdb.com/igdb/image/upload/t_cover_big/co7hab.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (26716,'Moonlight Blade','//images.igdb.com/igdb/image/upload/t_cover_big/co28b9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (536,'Dead Island','//images.igdb.com/igdb/image/upload/t_cover_big/co3lym.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1941,'Infamous: Second Son','//images.igdb.com/igdb/image/upload/t_cover_big/co1izy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (425,'Final Fantasy VIII','//images.igdb.com/igdb/image/upload/t_cover_big/co2z7d.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (19130,'Sid Meier''s Civilization VI','//images.igdb.com/igdb/image/upload/t_cover_big/co5r54.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7349,'Mass Effect: Andromeda','//images.igdb.com/igdb/image/upload/t_cover_big/co39vk.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2552,'Mad Max','//images.igdb.com/igdb/image/upload/t_cover_big/co1uuh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (306,'Far Cry','//images.igdb.com/igdb/image/upload/t_cover_big/co1vpf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (378,'Metal Gear Rising: Revengeance','//images.igdb.com/igdb/image/upload/t_cover_big/co2l1t.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7570,'Assassin''s Creed Rogue','//images.igdb.com/igdb/image/upload/t_cover_big/co1xir.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1512,'Pokémon Yellow Version: Special Pikachu Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co5pih.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2899,'EarthBound','//images.igdb.com/igdb/image/upload/t_cover_big/co6v07.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (60,'The Secret of Monkey Island','//images.igdb.com/igdb/image/upload/t_cover_big/co28bp.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (26401,'Star Wars Battlefront II','//images.igdb.com/igdb/image/upload/t_cover_big/co3wi7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (480,'Silent Hill','//images.igdb.com/igdb/image/upload/t_cover_big/co2vye.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (6,'Baldur''s Gate II: Shadows of Amn','//images.igdb.com/igdb/image/upload/t_cover_big/co71yr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (36926,'Monster Hunter: World','//images.igdb.com/igdb/image/upload/t_cover_big/co1rst.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (307,'Counter-Strike: Source','//images.igdb.com/igdb/image/upload/t_cover_big/co1txv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1187,'Crash Bandicoot: Warped','//images.igdb.com/igdb/image/upload/t_cover_big/co55ae.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (26193,'Uncharted: The Lost Legacy','//images.igdb.com/igdb/image/upload/t_cover_big/co1tp9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11737,'Outer Wilds','//images.igdb.com/igdb/image/upload/t_cover_big/co65ac.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3225,'No Man''s Sky','//images.igdb.com/igdb/image/upload/t_cover_big/co6zat.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (620,'Burnout Paradise','//images.igdb.com/igdb/image/upload/t_cover_big/co28p7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2985,'Persona 4 Golden','//images.igdb.com/igdb/image/upload/t_cover_big/co1n1x.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (75235,'Ghost of Tsushima','//images.igdb.com/igdb/image/upload/t_cover_big/co2crj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (5601,'The Witness','//images.igdb.com/igdb/image/upload/t_cover_big/co3hih.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1939,'Destiny','//images.igdb.com/igdb/image/upload/t_cover_big/co1rco.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3022,'Transistor','//images.igdb.com/igdb/image/upload/t_cover_big/co1pi1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (5328,'Metal Gear Solid V: Ground Zeroes','//images.igdb.com/igdb/image/upload/t_cover_big/co1v88.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1186,'Crash Bandicoot 2: Cortex Strikes Back','//images.igdb.com/igdb/image/upload/t_cover_big/co55a7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1082,'Resident Evil 6','//images.igdb.com/igdb/image/upload/t_cover_big/co3pyq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (36897,'A Way Out','//images.igdb.com/igdb/image/upload/t_cover_big/co1vca.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (37001,'Ori and the Will of the Wisps','//images.igdb.com/igdb/image/upload/t_cover_big/co2e1l.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7360,'Tom Clancy''s Rainbow Six Siege','//images.igdb.com/igdb/image/upload/t_cover_big/co5cxf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (111,'Amnesia: The Dark Descent','//images.igdb.com/igdb/image/upload/t_cover_big/co1qq5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (12515,'Pokémon Go','//images.igdb.com/igdb/image/upload/t_cover_big/co6i7b.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (100000000,'Just chatting','//static-cdn.jtvnw.net/ttv-boxart/509658-144x192.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (979,'Call of Duty: Modern Warfare 3','//images.igdb.com/igdb/image/upload/t_cover_big/co1wkn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1887,'Dragon Age: Inquisition','//images.igdb.com/igdb/image/upload/t_cover_big/co2mvy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (124,'Left 4 Dead 2','//images.igdb.com/igdb/image/upload/t_cover_big/co1y2f.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (113112,'Hades','//images.igdb.com/igdb/image/upload/t_cover_big/co39vc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11198,'Rocket League','//images.igdb.com/igdb/image/upload/t_cover_big/co5w0w.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (8197,'Tetris','//images.igdb.com/igdb/image/upload/t_cover_big/co2ufk.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (9730,'Firewatch','//images.igdb.com/igdb/image/upload/t_cover_big/co1m35.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (960,'Max Payne 3','//images.igdb.com/igdb/image/upload/t_cover_big/co2mjo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (21,'BioShock 2','//images.igdb.com/igdb/image/upload/t_cover_big/co2mlj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (6801,'Far Cry 4','//images.igdb.com/igdb/image/upload/t_cover_big/co2npa.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (43,'Deus Ex: Human Revolution','//images.igdb.com/igdb/image/upload/t_cover_big/co1rd2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1121,'Watch Dogs','//images.igdb.com/igdb/image/upload/t_cover_big/co2p5w.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (19686,'Resident Evil 2','//images.igdb.com/igdb/image/upload/t_cover_big/co1ir3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (327,'Age of Empires II: The Age of Kings','//images.igdb.com/igdb/image/upload/t_cover_big/co55xo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (673,'Doom','//images.igdb.com/igdb/image/upload/t_cover_big/co5rav.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (493,'Heavy Rain','//images.igdb.com/igdb/image/upload/t_cover_big/co3rhy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (551,'God of War II','//images.igdb.com/igdb/image/upload/t_cover_big/co3dik.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (549,'God of War','//images.igdb.com/igdb/image/upload/t_cover_big/co3ddc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (343,'Battlefield 3','//images.igdb.com/igdb/image/upload/t_cover_big/co1xbu.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (481,'Silent Hill 2','//images.igdb.com/igdb/image/upload/t_cover_big/co2vyg.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (109,'L.A. Noire','//images.igdb.com/igdb/image/upload/t_cover_big/co2ldn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (622,'Call of Duty 2','//images.igdb.com/igdb/image/upload/t_cover_big/co3acf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (239,'StarCraft II: Wings of Liberty','//images.igdb.com/igdb/image/upload/t_cover_big/co1tnn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3035,'The Stanley Parable','//images.igdb.com/igdb/image/upload/t_cover_big/co1rc9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (498,'Borderlands','//images.igdb.com/igdb/image/upload/t_cover_big/co20tx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7603,'Hellblade: Senua''s Sacrifice','//images.igdb.com/igdb/image/upload/t_cover_big/co2l7l.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (14362,'Detroit: Become Human','//images.igdb.com/igdb/image/upload/t_cover_big/co6mzf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1051,'Mirror''s Edge','//images.igdb.com/igdb/image/upload/t_cover_big/co5gbw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1033,'The Legend of Zelda: The Wind Waker','//images.igdb.com/igdb/image/upload/t_cover_big/co3ohz.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (38,'Dead Space 2','//images.igdb.com/igdb/image/upload/t_cover_big/co20xq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1627,'Super Smash Bros. Melee','//images.igdb.com/igdb/image/upload/t_cover_big/co21yv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1103,'Super Metroid','//images.igdb.com/igdb/image/upload/t_cover_big/co5osy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (418,'Final Fantasy X','//images.igdb.com/igdb/image/upload/t_cover_big/co1tr1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (9927,'Persona 5','//images.igdb.com/igdb/image/upload/t_cover_big/co1r76.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (28540,'Assassin''s Creed Origins','//images.igdb.com/igdb/image/upload/t_cover_big/co1rbe.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (19,'Max Payne 2: The Fall of Max Payne','//images.igdb.com/igdb/image/upload/t_cover_big/co2lcl.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (376,'Metal Gear Solid 2: Sons of Liberty','//images.igdb.com/igdb/image/upload/t_cover_big/co5e1c.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (76882,'Sekiro: Shadows Die Twice','//images.igdb.com/igdb/image/upload/t_cover_big/co2a23.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1877,'Cyberpunk 2077','//images.igdb.com/igdb/image/upload/t_cover_big/co7497.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (120,'Diablo III','//images.igdb.com/igdb/image/upload/t_cover_big/co2l1u.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (98,'Need for Speed: Most Wanted','//images.igdb.com/igdb/image/upload/t_cover_big/co209j.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (119133,'Elden Ring','//images.igdb.com/igdb/image/upload/t_cover_big/co4jni.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11233,'What Remains of Edith Finch','//images.igdb.com/igdb/image/upload/t_cover_big/co1rbj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1062,'Alan Wake','//images.igdb.com/igdb/image/upload/t_cover_big/co2dft.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1377,'Spec Ops: The Line','//images.igdb.com/igdb/image/upload/t_cover_big/co2acb.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (625,'Call of Duty: World at War','//images.igdb.com/igdb/image/upload/t_cover_big/co1wl8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (338,'Half-Life 2: Episode One','//images.igdb.com/igdb/image/upload/t_cover_big/co2mw3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3042,'Dying Light','//images.igdb.com/igdb/image/upload/t_cover_big/co65yq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (5606,'Assassin''s Creed Unity','//images.igdb.com/igdb/image/upload/t_cover_big/co1xiq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (885,'Super Meat Boy','//images.igdb.com/igdb/image/upload/t_cover_big/co276m.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (19562,'Resident Evil 7: Biohazard','//images.igdb.com/igdb/image/upload/t_cover_big/co545w.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (421,'Final Fantasy IX','//images.igdb.com/igdb/image/upload/t_cover_big/co2unc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (740,'Halo: Combat Evolved','//images.igdb.com/igdb/image/upload/t_cover_big/co2r2r.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1979,'Battlefield 4','//images.igdb.com/igdb/image/upload/t_cover_big/co1nmf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1879,'Terraria','//images.igdb.com/igdb/image/upload/t_cover_big/co1rbo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (41,'Deus Ex','//images.igdb.com/igdb/image/upload/t_cover_big/co7nlb.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (90101,'Super Smash Bros. Ultimate','//images.igdb.com/igdb/image/upload/t_cover_big/co2255.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (495,'Metro 2033','//images.igdb.com/igdb/image/upload/t_cover_big/co1rd6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1078,'Super Mario Galaxy 2','//images.igdb.com/igdb/image/upload/t_cover_big/co21tl.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (56,'The Elder Scrolls III: Morrowind','//images.igdb.com/igdb/image/upload/t_cover_big/co2knd.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1122,'Call of Duty: Black Ops II','//images.igdb.com/igdb/image/upload/t_cover_big/co1wkv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1030,'The Legend of Zelda: Majora''s Mask','//images.igdb.com/igdb/image/upload/t_cover_big/co3pah.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3097,'The Walking Dead: Season Two','//images.igdb.com/igdb/image/upload/t_cover_big/co2k36.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1105,'Metroid Prime','//images.igdb.com/igdb/image/upload/t_cover_big/co3w4w.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (118,'Star Wars: Knights of the Old Republic II - The Sith Lords','//images.igdb.com/igdb/image/upload/t_cover_big/co1qrj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (74701,'Star Wars Jedi: Fallen Order','//images.igdb.com/igdb/image/upload/t_cover_big/co1rbi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (891,'Team Fortress 2','//images.igdb.com/igdb/image/upload/t_cover_big/co6rzl.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (97,'Need for Speed: Underground 2','//images.igdb.com/igdb/image/upload/t_cover_big/co209h.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (103054,'Assassin''s Creed Odyssey','//images.igdb.com/igdb/image/upload/t_cover_big/co2nul.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (96,'Need for Speed: Underground','//images.igdb.com/igdb/image/upload/t_cover_big/co209g.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1905,'Fortnite','//images.igdb.com/igdb/image/upload/t_cover_big/co2ekt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (18320,'Battlefield 1','//images.igdb.com/igdb/image/upload/t_cover_big/co2n9d.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (14,'Fallout 2','//images.igdb.com/igdb/image/upload/t_cover_big/co50kv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1334,'Brothers: A Tale of Two Sons','//images.igdb.com/igdb/image/upload/t_cover_big/co1rro.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (123,'World of Warcraft','//images.igdb.com/igdb/image/upload/t_cover_big/co2l7z.jpg',3);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (987,'Halo 3','//images.igdb.com/igdb/image/upload/t_cover_big/co1xhc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2368,'Dark Souls II','//images.igdb.com/igdb/image/upload/t_cover_big/co2eoo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (621,'Call of Duty','//images.igdb.com/igdb/image/upload/t_cover_big/co2n19.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (80,'The Witcher','//images.igdb.com/igdb/image/upload/t_cover_big/co1xrx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2003,'Batman: Arkham Origins','//images.igdb.com/igdb/image/upload/t_cover_big/co1nmd.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (499,'God of War III','//images.igdb.com/igdb/image/upload/t_cover_big/co3koi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (9061,'Cuphead','//images.igdb.com/igdb/image/upload/t_cover_big/co62ao.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1983,'Bastion','//images.igdb.com/igdb/image/upload/t_cover_big/co1qlj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (8263,'Assassin''s Creed Syndicate','//images.igdb.com/igdb/image/upload/t_cover_big/co1xis.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1221,'Kingdom Hearts II','//images.igdb.com/igdb/image/upload/t_cover_big/co30t1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (126459,'Valorant','//images.igdb.com/igdb/image/upload/t_cover_big/co2mvt.jpg',0);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (136668,'Scrutinized','//images.igdb.com/igdb/image/upload/t_cover_big/co2ezh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (151665,'Palworld','//images.igdb.com/igdb/image/upload/t_cover_big/co7n02.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (207028,'Final Fantasy VII','//images.igdb.com/igdb/image/upload/t_cover_big/co4xgk.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (152250,'Stranger of Paradise: Final Fantasy Origin','//images.igdb.com/igdb/image/upload/t_cover_big/co4kag.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (144024,'Final Fantasy VII Remake Intergrade','//images.igdb.com/igdb/image/upload/t_cover_big/co4vor.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (137130,'Collection of SaGa: Final Fantasy Legend','//images.igdb.com/igdb/image/upload/t_cover_big/co2mn6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (130494,'Final Gear','//images.igdb.com/igdb/image/upload/t_cover_big/co4pck.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (242236,'Final Three Kingdoms 2','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (296,'Crysis','//images.igdb.com/igdb/image/upload/t_cover_big/co2on1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (103329,'Control','//images.igdb.com/igdb/image/upload/t_cover_big/co2evj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (847,'Resident Evil 5','//images.igdb.com/igdb/image/upload/t_cover_big/co2vzi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (836,'Prince of Persia: The Sands of Time','//images.igdb.com/igdb/image/upload/t_cover_big/co4t8l.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (28552,'Far Cry 5','//images.igdb.com/igdb/image/upload/t_cover_big/co21a6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (17447,'Titanfall 2','//images.igdb.com/igdb/image/upload/t_cover_big/fhbeilnghyhhmjqhinqa.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1022,'The Legend of Zelda','//images.igdb.com/igdb/image/upload/t_cover_big/co1uii.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1036,'The Legend of Zelda: Twilight Princess','//images.igdb.com/igdb/image/upload/t_cover_big/co3mtv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (142,'Star Wars: Battlefront II','//images.igdb.com/igdb/image/upload/t_cover_big/co1nsg.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1342,'Beyond: Two Souls','//images.igdb.com/igdb/image/upload/t_cover_big/co2mps.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1128,'Castlevania: Symphony of the Night','//images.igdb.com/igdb/image/upload/t_cover_big/co53m8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (539,'Metro: Last Light','//images.igdb.com/igdb/image/upload/t_cover_big/co2h9d.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2350,'Mario Kart 8','//images.igdb.com/igdb/image/upload/t_cover_big/co213q.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (873,'Saints Row: The Third','//images.igdb.com/igdb/image/upload/t_cover_big/co2634.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (122,'Left 4 Dead','//images.igdb.com/igdb/image/upload/t_cover_big/co1qrm.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (289,'Age of Empires','//images.igdb.com/igdb/image/upload/t_cover_big/co1zsh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7609,'Until Dawn','//images.igdb.com/igdb/image/upload/t_cover_big/co2s5q.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2909,'The Legend of Zelda: A Link Between Worlds','//images.igdb.com/igdb/image/upload/t_cover_big/co3p0j.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11118,'Dishonored 2','//images.igdb.com/igdb/image/upload/t_cover_big/co5pd0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (380,'Metal Gear Solid 4: Guns of the Patriots','//images.igdb.com/igdb/image/upload/t_cover_big/co5eju.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1279,'Hearthstone','//images.igdb.com/igdb/image/upload/t_cover_big/co1sh2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1073,'Super Mario World 2: Yoshi''s Island','//images.igdb.com/igdb/image/upload/t_cover_big/co2kn9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (78,'Dragon Age II','//images.igdb.com/igdb/image/upload/t_cover_big/co2mw1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2963,'Dota 2','//images.igdb.com/igdb/image/upload/t_cover_big/co6ene.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2033,'Call of Duty: Ghosts','//images.igdb.com/igdb/image/upload/t_cover_big/co3b15.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (26472,'Disco Elysium','//images.igdb.com/igdb/image/upload/t_cover_big/co1sfj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1968,'Rayman Legends','//images.igdb.com/igdb/image/upload/t_cover_big/co3ma8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (27316,'A Plague Tale: Innocence','//images.igdb.com/igdb/image/upload/t_cover_big/co1lat.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1185,'Crash Bandicoot','//images.igdb.com/igdb/image/upload/t_cover_big/co555l.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (530,'Hitman: Absolution','//images.igdb.com/igdb/image/upload/t_cover_big/co1qrc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (986,'Halo 2','//images.igdb.com/igdb/image/upload/t_cover_big/co1x77.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (352,'Battlefield: Bad Company 2','//images.igdb.com/igdb/image/upload/t_cover_big/co1xbi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (241,'Counter-Strike','//images.igdb.com/igdb/image/upload/t_cover_big/co7ms5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (19564,'Death Stranding','//images.igdb.com/igdb/image/upload/t_cover_big/co5vq8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (4754,'Alien: Isolation','//images.igdb.com/igdb/image/upload/t_cover_big/co1vzu.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1267,'Sleeping Dogs','//images.igdb.com/igdb/image/upload/t_cover_big/co2e3z.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (9066,'Cities: Skylines','//images.igdb.com/igdb/image/upload/t_cover_big/co1mx3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2853,'Braid','//images.igdb.com/igdb/image/upload/t_cover_big/co25ni.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (19441,'Watch Dogs 2','//images.igdb.com/igdb/image/upload/t_cover_big/co2p3j.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2935,'Papers, Please','//images.igdb.com/igdb/image/upload/t_cover_big/co1vep.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11,'Vampire: The Masquerade - Bloodlines','//images.igdb.com/igdb/image/upload/t_cover_big/co2n14.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (13,'Fallout','//images.igdb.com/igdb/image/upload/t_cover_big/co1ybn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (990,'Halo: Reach','//images.igdb.com/igdb/image/upload/t_cover_big/co1xha.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (364,'Heroes of Might and Magic III: The Restoration of Erathia','//images.igdb.com/igdb/image/upload/t_cover_big/co2a47.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (471,'Crysis 2','//images.igdb.com/igdb/image/upload/t_cover_big/co2on2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (9727,'Soma','//images.igdb.com/igdb/image/upload/t_cover_big/co2a20.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (260,'The Sims 3','//images.igdb.com/igdb/image/upload/t_cover_big/co5vwl.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (4438,'Sonic the Hedgehog 2','//images.igdb.com/igdb/image/upload/t_cover_big/co5kkj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3192,'Sonic the Hedgehog','//images.igdb.com/igdb/image/upload/t_cover_big/co6yzr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (22439,'The Witcher 3: Wild Hunt - Game of the Year Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co1wz4.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1244,'Tekken 3','//images.igdb.com/igdb/image/upload/t_cover_big/co3tsh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (19531,'Prey','//images.igdb.com/igdb/image/upload/t_cover_big/pzgwdpvoww1nrlkv7d5x.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1910,'Outlast','//images.igdb.com/igdb/image/upload/t_cover_big/co1yat.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (6632,'Call of Duty: Advanced Warfare','//images.igdb.com/igdb/image/upload/t_cover_big/co1wky.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1090,'Donkey Kong Country','//images.igdb.com/igdb/image/upload/t_cover_big/co70qn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1628,'Super Smash Bros. Brawl','//images.igdb.com/igdb/image/upload/t_cover_big/co221w.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2342,'Mario Kart 64','//images.igdb.com/igdb/image/upload/t_cover_big/co67hm.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1517,'Pokémon Emerald Version','//images.igdb.com/igdb/image/upload/t_cover_big/co1zhr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1561,'Pokémon Red Version','//images.igdb.com/igdb/image/upload/t_cover_big/co5pi4.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (359,'Final Fantasy XV','//images.igdb.com/igdb/image/upload/t_cover_big/co6nz1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1067,'Super Mario Bros. 2','//images.igdb.com/igdb/image/upload/t_cover_big/co1wos.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2183,'Mario Kart Wii','//images.igdb.com/igdb/image/upload/t_cover_big/co214e.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (125,'Diablo','//images.igdb.com/igdb/image/upload/t_cover_big/co3ggo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (36952,'Wolfenstein II: The New Colossus','//images.igdb.com/igdb/image/upload/t_cover_big/co21c5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (61,'Monkey Island 2: LeChuck''s Revenge','//images.igdb.com/igdb/image/upload/t_cover_big/co30yr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (9174,'Little Nightmares','//images.igdb.com/igdb/image/upload/t_cover_big/co1rdi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (133,'Warcraft III: The Frozen Throne','//images.igdb.com/igdb/image/upload/t_cover_big/co1xxv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1906,'Gone Home','//images.igdb.com/igdb/image/upload/t_cover_big/qwhxxrcxzw7inwfrfkbq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (819,'Grand Theft Auto 2','//images.igdb.com/igdb/image/upload/t_cover_big/co2lb2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (113114,'The Outer Worlds','//images.igdb.com/igdb/image/upload/t_cover_big/co2eew.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2136,'Bayonetta','//images.igdb.com/igdb/image/upload/t_cover_big/co1p92.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1277,'Plants vs. Zombies','//images.igdb.com/igdb/image/upload/t_cover_big/co69id.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1318,'XCOM: Enemy Unknown','//images.igdb.com/igdb/image/upload/t_cover_big/co29i2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (8254,'Resident Evil','//images.igdb.com/igdb/image/upload/t_cover_big/co1taw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (913,'Tony Hawk''s Pro Skater 2','//images.igdb.com/igdb/image/upload/t_cover_big/co1y77.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1092,'Donkey Kong Country 2: Diddy''s Kong Quest','//images.igdb.com/igdb/image/upload/t_cover_big/co217m.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (981,'Rayman Origins','//images.igdb.com/igdb/image/upload/t_cover_big/co1v7k.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (4786,'The Evil Within','//images.igdb.com/igdb/image/upload/t_cover_big/co5wgs.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2181,'Wii Sports','//images.igdb.com/igdb/image/upload/t_cover_big/co3vge.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7706,'This War of Mine','//images.igdb.com/igdb/image/upload/t_cover_big/co3ans.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3278,'Garry''s Mod','//images.igdb.com/igdb/image/upload/t_cover_big/co1mxa.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (8187,'Just Cause 3','//images.igdb.com/igdb/image/upload/t_cover_big/co24o5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1638,'GoldenEye 007','//images.igdb.com/igdb/image/upload/t_cover_big/co62k0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1519,'Pokémon Platinum Version','//images.igdb.com/igdb/image/upload/t_cover_big/co1zhu.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (105,'Need for Speed: Hot Pursuit','//images.igdb.com/igdb/image/upload/t_cover_big/co2h9s.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3186,'Street Fighter II','//images.igdb.com/igdb/image/upload/t_cover_big/co55et.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2132,'The Binding of Isaac','//images.igdb.com/igdb/image/upload/t_cover_big/co1qll.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1216,'Dead Space 3','//images.igdb.com/igdb/image/upload/t_cover_big/co2int.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (10919,'XCOM 2','//images.igdb.com/igdb/image/upload/t_cover_big/co1mvj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2903,'Warframe','//images.igdb.com/igdb/image/upload/t_cover_big/co1nhi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1339,'Psychonauts','//images.igdb.com/igdb/image/upload/t_cover_big/co38t0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2939,'The Vanishing of Ethan Carter','//images.igdb.com/igdb/image/upload/t_cover_big/co1r7q.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1268,'Crysis 3','//images.igdb.com/igdb/image/upload/t_cover_big/co2on3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (246,'Diablo II: Lord of Destruction','//images.igdb.com/igdb/image/upload/t_cover_big/co3gfn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1558,'Pokémon Gold Version','//images.igdb.com/igdb/image/upload/t_cover_big/co5pia.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1341,'Beyond Good & Evil','//images.igdb.com/igdb/image/upload/t_cover_big/co2n6b.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1079,'Super Mario 3D Land','//images.igdb.com/igdb/image/upload/t_cover_big/co21tq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (81085,'Dark Souls: Remastered','//images.igdb.com/igdb/image/upload/t_cover_big/co2uro.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2345,'Mario Kart DS','//images.igdb.com/igdb/image/upload/t_cover_big/co214h.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1513,'Pokémon Silver Version','//images.igdb.com/igdb/image/upload/t_cover_big/co5pid.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (5619,'Demon''s Souls','//images.igdb.com/igdb/image/upload/t_cover_big/co27sk.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (4756,'Child of Light','//images.igdb.com/igdb/image/upload/t_cover_big/co21q2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2001,'Far Cry 3: Blood Dragon','//images.igdb.com/igdb/image/upload/t_cover_big/co1vpp.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (989,'Halo 3: ODST','//images.igdb.com/igdb/image/upload/t_cover_big/co1xhh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (482,'Silent Hill 3','//images.igdb.com/igdb/image/upload/t_cover_big/co3kol.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (6032,'Borderlands: The Pre-Sequel','//images.igdb.com/igdb/image/upload/t_cover_big/co20tq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1076,'New Super Mario Bros.','//images.igdb.com/igdb/image/upload/t_cover_big/co21rm.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (130,'Warcraft II: Tides of Darkness','//images.igdb.com/igdb/image/upload/t_cover_big/co3wix.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3152,'Don''t Starve','//images.igdb.com/igdb/image/upload/t_cover_big/co1qqw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (18968,'Call of Duty: Infinite Warfare','//images.igdb.com/igdb/image/upload/t_cover_big/co1wkp.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (14746,'Batman: The Telltale Series','//images.igdb.com/igdb/image/upload/t_cover_big/co1u65.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11800,'Divinity: Original Sin II','//images.igdb.com/igdb/image/upload/t_cover_big/co1y5v.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2671,'Guitar Hero III: Legends of Rock','//images.igdb.com/igdb/image/upload/t_cover_big/co1wqm.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (494,'Bulletstorm','//images.igdb.com/igdb/image/upload/t_cover_big/co7abq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (19457,'The Elder Scrolls V: Skyrim - Special Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co1vco.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (832,'Planescape: Torment','//images.igdb.com/igdb/image/upload/t_cover_big/co3ggb.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (570,'Prototype','//images.igdb.com/igdb/image/upload/t_cover_big/co1ql2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3182,'Diablo III: Reaper of Souls','//images.igdb.com/igdb/image/upload/t_cover_big/co3gfx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2682,'LEGO Star Wars: The Complete Saga','//images.igdb.com/igdb/image/upload/t_cover_big/co1qrr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2025,'Mount & Blade: Warband','//images.igdb.com/igdb/image/upload/t_cover_big/co1y8y.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (136,'Devil May Cry 3: Dante''s Awakening','//images.igdb.com/igdb/image/upload/t_cover_big/co1u6u.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7610,'Game of Thrones: A Telltale Games Series','//images.igdb.com/igdb/image/upload/t_cover_big/co1nrt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (8222,'Dark Souls II: Scholar of the First Sin','//images.igdb.com/igdb/image/upload/t_cover_big/co20um.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (40477,'Slay the Spire','//images.igdb.com/igdb/image/upload/t_cover_big/co1iyf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11119,'Fallout Shelter','//images.igdb.com/igdb/image/upload/t_cover_big/co6p4w.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (333,'Quake','//images.igdb.com/igdb/image/upload/t_cover_big/co1ybm.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3221,'Rogue Legacy','//images.igdb.com/igdb/image/upload/t_cover_big/co27fi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2344,'Mario Kart: Double Dash!!','//images.igdb.com/igdb/image/upload/t_cover_big/co7ndu.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (134,'Devil May Cry','//images.igdb.com/igdb/image/upload/t_cover_big/co5tki.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (134581,'Marvel''s Spider-Man: Miles Morales','//images.igdb.com/igdb/image/upload/t_cover_big/co2dwe.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (119388,'The Legend of Zelda: Tears of the Kingdom','//images.igdb.com/igdb/image/upload/t_cover_big/co5vmg.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (37094,'Shadow of the Colossus','//images.igdb.com/igdb/image/upload/t_cover_big/co272w.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (5,'Baldur''s Gate','//images.igdb.com/igdb/image/upload/t_cover_big/co20gb.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (5973,'Broforce','//images.igdb.com/igdb/image/upload/t_cover_big/co28vv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (22,'System Shock 2','//images.igdb.com/igdb/image/upload/t_cover_big/co4bak.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (277,'Battlefield 2','//images.igdb.com/igdb/image/upload/t_cover_big/co2nal.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (232,'Half-Life: Opposing Force','//images.igdb.com/igdb/image/upload/t_cover_big/co1qre.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (82090,'Forza Horizon 4','//images.igdb.com/igdb/image/upload/t_cover_big/co2e1a.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (26196,'Crash Bandicoot N. Sane Trilogy','//images.igdb.com/igdb/image/upload/t_cover_big/co1v62.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1876,'Spore','//images.igdb.com/igdb/image/upload/t_cover_big/co2ac9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (523,'Infamous','//images.igdb.com/igdb/image/upload/t_cover_big/co525t.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2549,'Half-Life: Blue Shift','//images.igdb.com/igdb/image/upload/t_cover_big/co1qrd.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2148,'Banjo-Kazooie','//images.igdb.com/igdb/image/upload/t_cover_big/co1zsj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (119171,'Baldur''s Gate 3','//images.igdb.com/igdb/image/upload/t_cover_big/co670h.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (9602,'Super Smash Bros. for Wii U','//images.igdb.com/igdb/image/upload/t_cover_big/co213x.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (295,'Command & Conquer: Red Alert','//images.igdb.com/igdb/image/upload/t_cover_big/co1nx0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (115115,'Resident Evil 3','//images.igdb.com/igdb/image/upload/t_cover_big/co22l7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7842,'Danganronpa: Trigger Happy Havoc','//images.igdb.com/igdb/image/upload/t_cover_big/co1n1w.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (23248,'Frostpunk','//images.igdb.com/igdb/image/upload/t_cover_big/mferu1am1yv5pcy5aplm.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11790,'The Last of Us: Left Behind','//images.igdb.com/igdb/image/upload/t_cover_big/co5xg8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1576,'Spyro the Dragon','//images.igdb.com/igdb/image/upload/t_cover_big/co3kmh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1557,'Pokémon Ruby Version','//images.igdb.com/igdb/image/upload/t_cover_big/co1zhq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (119177,'Call of Duty: Modern Warfare','//images.igdb.com/igdb/image/upload/t_cover_big/co1rsg.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (647,'Command & Conquer','//images.igdb.com/igdb/image/upload/t_cover_big/co1zyz.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (326,'Medal of Honor: Allied Assault','//images.igdb.com/igdb/image/upload/t_cover_big/co7nlr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (284,'Wolfenstein 3D','//images.igdb.com/igdb/image/upload/t_cover_big/co2604.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3750,'Quantum Break','//images.igdb.com/igdb/image/upload/t_cover_big/co2dqe.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (4,'Thief','//images.igdb.com/igdb/image/upload/t_cover_big/co22nc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1556,'Pokémon HeartGold Version','//images.igdb.com/igdb/image/upload/t_cover_big/co1z57.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2438,'Prince of Persia','//images.igdb.com/igdb/image/upload/t_cover_big/co2bva.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1114,'Castlevania','//images.igdb.com/igdb/image/upload/t_cover_big/co6dcb.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (562,'Tom Clancy''s Splinter Cell: Conviction','//images.igdb.com/igdb/image/upload/t_cover_big/co1ypl.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (9643,'Return of the Obra Dinn','//images.igdb.com/igdb/image/upload/t_cover_big/co27j9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (5913,'Men of Valor','//images.igdb.com/igdb/image/upload/t_cover_big/co3jde.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (55044,'Arena of Valor','//images.igdb.com/igdb/image/upload/t_cover_big/co2pg0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (174596,'Valorant: Mobile','//images.igdb.com/igdb/image/upload/t_cover_big/co5564.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (38438,'Spellcraft: Aspects of Valor','//images.igdb.com/igdb/image/upload/t_cover_big/co55dx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (173314,'Valor','//images.igdb.com/igdb/image/upload/t_cover_big/co509c.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (201815,'League of Light: Dark Omens & League of Light: Wicked Harvest','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (103952,'In League','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (261746,'League TD','//images.igdb.com/igdb/image/upload/t_cover_big/co6xyh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (51310,'S4 League','//images.igdb.com/igdb/image/upload/t_cover_big/co48zx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (207883,'UFS League','//images.igdb.com/igdb/image/upload/t_cover_big/co4yas.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (106351,'Piczle Lines DX 500 More Puzzles!','//images.igdb.com/igdb/image/upload/t_cover_big/co1iai.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (250004,'D or D','//images.igdb.com/igdb/image/upload/t_cover_big/co7lxo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (39864,'D. D. Crew','//images.igdb.com/igdb/image/upload/t_cover_big/lx0i4fgu5kisd3gvoxfn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (109441,'D. D. Crew','//images.igdb.com/igdb/image/upload/t_cover_big/nd3ta33ejwl5utxoygq3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (4319,'D','//images.igdb.com/igdb/image/upload/t_cover_big/co3sww.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (187612,'No Leg Lenny','//images.igdb.com/igdb/image/upload/t_cover_big/co6l2i.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (119934,'Break a Leg','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (151368,'Two Legs','//images.igdb.com/igdb/image/upload/t_cover_big/co451i.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (250188,'Hi-Leg Fantasy','//images.igdb.com/igdb/image/upload/t_cover_big/co6i69.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (91880,'Hairy Legs','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (217582,'Broken Legs','//images.igdb.com/igdb/image/upload/t_cover_big/co59uf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (178507,'B-e-e-t-l-e','//images.igdb.com/igdb/image/upload/t_cover_big/co4pgh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (124007,'Doubutsu no Mori e+','//images.igdb.com/igdb/image/upload/t_cover_big/co5pe2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (232879,'Game & Watch-e: Vermin','//images.igdb.com/igdb/image/upload/t_cover_big/co6y0t.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (232882,'Game & Watch-e: Vermin','//images.igdb.com/igdb/image/upload/t_cover_big/co6y0u.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (92847,'Manhole-e: Classic Version','//images.igdb.com/igdb/image/upload/t_cover_big/co3c25.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (240945,'Noroi E: The Origin of Nightmares','//images.igdb.com/igdb/image/upload/t_cover_big/co72y9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (109233,'Lapis x Labyrinth','//images.igdb.com/igdb/image/upload/t_cover_big/co26q3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (107619,'Noël: La Niege','//images.igdb.com/igdb/image/upload/t_cover_big/co2ylj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (6760,'La Pucelle Tactics','//images.igdb.com/igdb/image/upload/t_cover_big/co3bfx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (114353,'Epic Adventures: La Jangada','//images.igdb.com/igdb/image/upload/t_cover_big/co1sgj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7936,'La-Mulana','//images.igdb.com/igdb/image/upload/t_cover_big/co2hd2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (215005,'La La Land','//images.igdb.com/igdb/image/upload/t_cover_big/co55fo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (221400,'Dai-2-ji Super Robot Taisen G','//images.igdb.com/igdb/image/upload/t_cover_big/co5gu4.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (42371,'Kidou Butou-den G Gundam','//images.igdb.com/igdb/image/upload/t_cover_big/co3bgl.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (222157,'G-Mode Archives 37: Moe Slot Beach no Shizuku','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3486,'Extreme-G: XG2','//images.igdb.com/igdb/image/upload/t_cover_big/co3c57.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (38324,'SD Gundam G Next','//images.igdb.com/igdb/image/upload/t_cover_big/co39pg.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (137538,'G-Mode Archives 03: Kururin Cafe','//images.igdb.com/igdb/image/upload/t_cover_big/co4cfc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1081,'The Elder Scrolls Online','//images.igdb.com/igdb/image/upload/t_cover_big/co1ybf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (53,'The Elder Scrolls II: Daggerfall','//images.igdb.com/igdb/image/upload/t_cover_big/co1yan.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (206234,'Dot Kareshi: We''re 8bit Lovers! II - Tenku no Kissu','//images.igdb.com/igdb/image/upload/t_cover_big/co68bi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (57,'The Elder Scrolls III: Tribunal','//images.igdb.com/igdb/image/upload/t_cover_big/co21i8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (58,'The Elder Scrolls III: Bloodmoon','//images.igdb.com/igdb/image/upload/t_cover_big/co21i1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (52,'The Elder Scrolls: Arena','//images.igdb.com/igdb/image/upload/t_cover_big/co2knc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (55,'The Elder Scrolls Adventures: Redguard','//images.igdb.com/igdb/image/upload/t_cover_big/co53qi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (81249,'The Elder Scrolls VI','//images.igdb.com/igdb/image/upload/t_cover_big/co1ycv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11120,'The Elder Scrolls: Legends','//images.igdb.com/igdb/image/upload/t_cover_big/co3woi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (206232,'Dot Kareshi: We''re 8bit Lovers! III - Yami no Hanayome','//images.igdb.com/igdb/image/upload/t_cover_big/co68bj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (56144,'Tokyo Ghoul: Re Birth','//images.igdb.com/igdb/image/upload/t_cover_big/reouemyuxibpozn57wqw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (206242,'Dot Kareshi: We''re 8bit Lovers! I - Densetsu no Otome','//images.igdb.com/igdb/image/upload/t_cover_big/co68bh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (223547,'Death End Re;Quest: Dungeon Re;Quest Pack','//images.igdb.com/igdb/image/upload/t_cover_big/co5q03.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7707,'Saints Row IV: Re-Elected','//images.igdb.com/igdb/image/upload/t_cover_big/co1y9h.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (54838,'Co-Co Corn Mafia','//images.igdb.com/igdb/image/upload/t_cover_big/co2ajw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (96507,'X-COM: em@il Games','//images.igdb.com/igdb/image/upload/t_cover_big/co7px5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (210226,'Ha*co','//images.igdb.com/igdb/image/upload/t_cover_big/co4zux.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (168290,'Company of Heroes 2: US Forces Commander - Rifle Company','//images.igdb.com/igdb/image/upload/t_cover_big/co554b.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (267808,'Com__et','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (36883,'Stifflip & Co.','//images.igdb.com/igdb/image/upload/t_cover_big/vbumhkjhyuoyad296pry.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (168289,'Company of Heroes 2: US Forces Commander - Mechanized Company','//images.igdb.com/igdb/image/upload/t_cover_big/co554g.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (253239,'Love Com: Punch de Cont.','//images.igdb.com/igdb/image/upload/t_cover_big/co6mem.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (253197,'Penalti MTV com Cléston','//images.igdb.com/igdb/image/upload/t_cover_big/co6mc2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (141921,'2 Player Co-op Quest!','//images.igdb.com/igdb/image/upload/t_cover_big/co2u24.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (52794,'Company of Heroes 2: Ardennes Assault - Fox Company Rangers','//images.igdb.com/igdb/image/upload/t_cover_big/co3b8w.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (59515,'Dotcom (.com)','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (198369,'SM64EX Co-op','//images.igdb.com/igdb/image/upload/t_cover_big/co5tik.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (147566,'Z-Company','//images.igdb.com/igdb/image/upload/t_cover_big/co30el.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (200390,'E-mail X-com','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (203411,'Ghostwriters & Co.','//images.igdb.com/igdb/image/upload/t_cover_big/co4tjq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11932,'Bad Company','//images.igdb.com/igdb/image/upload/t_cover_big/wa5xbdudh0rtoq3ogndl.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (205132,'Tank Company','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (191930,'Pokémon Violet','//images.igdb.com/igdb/image/upload/t_cover_big/co5sfa.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (269228,'Lea','//images.igdb.com/igdb/image/upload/t_cover_big/co7hub.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (89301,'Lea Born for Adventure','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (147432,'Imagine: Rescue Vet','//images.igdb.com/igdb/image/upload/t_cover_big/co30b1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7925,'Imagine: Movie Star','//images.igdb.com/igdb/image/upload/t_cover_big/c0eugmzrz7vr5tmry7wr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (285054,'Lo-Rez','//images.igdb.com/igdb/image/upload/t_cover_big/co7pik.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (285502,'Li-Lo','//images.igdb.com/igdb/image/upload/t_cover_big/co7q3r.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (189282,'Lo-Fi: Thexnerxxm','//images.igdb.com/igdb/image/upload/t_cover_big/co4fcr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (138313,'Mega Lo Mania & First Samurai','//images.igdb.com/igdb/image/upload/t_cover_big/co3o13.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (179620,'Lo-fi','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (104220,'LO-OP','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (128898,'Kör Comp','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (245533,'Comp IV','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (280711,'Monolith: The Horror Comp','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (226389,'Pal','//images.igdb.com/igdb/image/upload/t_cover_big/co7i21.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (18381,'Pac & Pal','//images.igdb.com/igdb/image/upload/t_cover_big/co74d5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (215109,'Arcade Archives: Pac & Pal','//images.igdb.com/igdb/image/upload/t_cover_big/co56to.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (166517,'PAL: Shinken Densetsu','//images.igdb.com/igdb/image/upload/t_cover_big/co3rnc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (145020,'Pen Pals','//images.igdb.com/igdb/image/upload/t_cover_big/co2w4t.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (276038,'Pen Pals','//images.igdb.com/igdb/image/upload/t_cover_big/co7hlu.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (239934,'Pokémon Violet: The Hidden Treasure of Area Zero','//images.igdb.com/igdb/image/upload/t_cover_big/co67it.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (239930,'Pokémon Violet: The Hidden Treasure of Area Zero - Part 1: The Teal Mask','//images.igdb.com/igdb/image/upload/t_cover_big/co6ld1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (239933,'Pokémon Violet: The Hidden Treasure of Area Zero - Part 2: The Indigo Disk','//images.igdb.com/igdb/image/upload/t_cover_big/co6ld0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (9997,'A6: A-Train 6','//images.igdb.com/igdb/image/upload/t_cover_big/psa7bgw4kghtxpcmt2bf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (373,'Might & Magic: Heroes VI','//images.igdb.com/igdb/image/upload/t_cover_big/co2ss4.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (65224,'The Idolmaster: Gravure for You! Vol. 6','//images.igdb.com/igdb/image/upload/t_cover_big/co2rmi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (33783,'DSS','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (286071,'DSS war party','//images.igdb.com/igdb/image/upload/t_cover_big/co7qoy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (23610,'League of Angels','//images.igdb.com/igdb/image/upload/t_cover_big/co2qjh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (84169,'Kin','//images.igdb.com/igdb/image/upload/t_cover_big/co44hu.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (98306,'Kin','//images.igdb.com/igdb/image/upload/t_cover_big/co2qhu.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (27737,'Kingdom Hearts Union χ[Cross]','//images.igdb.com/igdb/image/upload/t_cover_big/co1tqb.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (27243,'Doodle Kingdom','//images.igdb.com/igdb/image/upload/t_cover_big/co6mux.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (14159,'Kingdom Hearts HD 2.8 Final Chapter Prologue','//images.igdb.com/igdb/image/upload/t_cover_big/co312y.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (44535,'Kingdom Hearts HD 2.8 Final Chapter Prologue: Limited Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co3130.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (70744,'Kingdom of Kroz II','//images.igdb.com/igdb/image/upload/t_cover_big/co39y8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (46807,'Kingdom Grand Prix','//images.igdb.com/igdb/image/upload/t_cover_big/co3byj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (54663,'Pinchcliffe Grand Prix','//images.igdb.com/igdb/image/upload/t_cover_big/sinvejvmekiiar7ow3yk.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (13074,'MicroProse Formula One Grand Prix','//images.igdb.com/igdb/image/upload/t_cover_big/eyaoc9jzknnksllzrqce.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (239064,'Grand Theft Auto V','//images.igdb.com/igdb/image/upload/t_cover_big/co66qs.jpg',969);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (163113,'Grand Theft Auto: Rio de Janeiro','//images.igdb.com/igdb/image/upload/t_cover_big/co4hhd.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (52189,'Grand Theft Auto VI','//images.igdb.com/igdb/image/upload/t_cover_big/co7gdk.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (132185,'Punishing: Gray Raven','//images.igdb.com/igdb/image/upload/t_cover_big/co4wk7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (155362,'100% Orange Juice: Kiriko & NoName Pack','//images.igdb.com/igdb/image/upload/t_cover_big/co52y7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (80087,'Danball Senki W','//images.igdb.com/igdb/image/upload/t_cover_big/co3urz.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (79341,'Super Robot Taisen W','//images.igdb.com/igdb/image/upload/t_cover_big/co4kix.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (21405,'Super Robot Taisen W','//images.igdb.com/igdb/image/upload/t_cover_big/co4qc4.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (208751,'Hunter W','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (192159,'25°N 71°W','//images.igdb.com/igdb/image/upload/t_cover_big/co4vvy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (165362,'Lineage W','//images.igdb.com/igdb/image/upload/t_cover_big/co3zdy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (75116,'Dung Beetle','//images.igdb.com/igdb/image/upload/t_cover_big/wab1azo6opx4vwf7qj8n.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (158804,'Dung Beetle Strike','//images.igdb.com/igdb/image/upload/t_cover_big/co3p8c.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2319,'Pokémon Mystery Dungeon: Red Rescue Team','//images.igdb.com/igdb/image/upload/t_cover_big/co21em.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2323,'Pokémon Mystery Dungeon: Explorers of Sky','//images.igdb.com/igdb/image/upload/t_cover_big/co7ovf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (4566,'Pokémon Mystery Dungeon: Gates to Infinity','//images.igdb.com/igdb/image/upload/t_cover_big/co1z4z.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (39354,'1000 Miglia: Great 1000 Miles Rally','//images.igdb.com/igdb/image/upload/t_cover_big/co4el9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (42219,'Super Tsume Shogi 1000','//images.igdb.com/igdb/image/upload/t_cover_big/co76g6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (182346,'Maple County','//images.igdb.com/igdb/image/upload/t_cover_big/co49jh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (105308,'1000 Stages','//images.igdb.com/igdb/image/upload/t_cover_big/co297a.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (91694,'Maple Colors H','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (264926,'Cats Hidden in Maple Hollow','//images.igdb.com/igdb/image/upload/t_cover_big/co7f0s.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (32266,'True Love: Confide to the Maple','//images.igdb.com/igdb/image/upload/t_cover_big/co4501.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (140723,'Lewd Leaf Land: Maple Tea Ecstasy','//images.igdb.com/igdb/image/upload/t_cover_big/co60li.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (178056,'BS Zelda no Densetsu Map 2: Dai-2-wa','//images.igdb.com/igdb/image/upload/t_cover_big/co40r0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (9804,'MapleStory','//images.igdb.com/igdb/image/upload/t_cover_big/co7diu.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (80348,'MapleStory 2','//images.igdb.com/igdb/image/upload/t_cover_big/co251n.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (79942,'MapleStory DS','//images.igdb.com/igdb/image/upload/t_cover_big/co6ds1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (98295,'MapleStory M','//images.igdb.com/igdb/image/upload/t_cover_big/co2qn4.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (38880,'MapleStory Live','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (108795,'Maplestory Blitz','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (175283,'Lethe','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (16993,'New Lethes','//images.igdb.com/igdb/image/upload/t_cover_big/co4c3m.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (222249,'Shin Tennis no Ouji-sama: Let''s Go!! Daily Life from RisingBeat','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (34325,'Lethe - Episode One','//images.igdb.com/igdb/image/upload/t_cover_big/co2tgf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (123345,'Let''s Sing 2020','//images.igdb.com/igdb/image/upload/t_cover_big/co2c8t.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (121966,'Lethe: Broken memories','//images.igdb.com/igdb/image/upload/t_cover_big/co4590.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (282681,'Let''s Go Bassfishing!','//images.igdb.com/igdb/image/upload/t_cover_big/co7mkc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (174991,'Dream and Lethe Record','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (21022,'Let''s Fish! Hooked On','//images.igdb.com/igdb/image/upload/t_cover_big/co4a1r.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (24103,'Lethal Skies II','//images.igdb.com/igdb/image/upload/t_cover_big/y3hr1nc51mtj9n12w2u7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (259601,'Lethal Operation: Episode 3 - Lethal Arms of Justice','//images.igdb.com/igdb/image/upload/t_cover_big/co6vgj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (5398,'Lethal Enforcers II: Gun Fighters','//images.igdb.com/igdb/image/upload/t_cover_big/gkqfjxmkwtvycw1lidkw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (18312,'Tastee Lethal Tactics','//images.igdb.com/igdb/image/upload/t_cover_big/co1oqr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (77250,'Lethal Enforcers I & II','//images.igdb.com/igdb/image/upload/t_cover_big/co1jvy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (230142,'5.0','//images.igdb.com/igdb/image/upload/t_cover_big/co5y9j.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (186671,'50','//images.igdb.com/igdb/image/upload/t_cover_big/co5cvs.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (48034,'50 Classic Games','//images.igdb.com/igdb/image/upload/t_cover_big/xzgmuodqvi4ufwa2pmp4.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (5472,'50 Cent: Blood on the Sand','//images.igdb.com/igdb/image/upload/t_cover_big/co25gw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (185185,'Your World, 50 Years From Now','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (225642,'Perfect Memento of Touhou Question: More 50 Questions Part 2','//images.igdb.com/igdb/image/upload/t_cover_big/co5rtd.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11426,'100% Orange Juice','//images.igdb.com/igdb/image/upload/t_cover_big/co25ad.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (231486,'100$','//images.igdb.com/igdb/image/upload/t_cover_big/co6obm.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (113529,'Rick Henderson','//images.igdb.com/igdb/image/upload/t_cover_big/co2js3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (127358,'Ruined King: A League of Legends Story','//images.igdb.com/igdb/image/upload/t_cover_big/co2jtl.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (127354,'Convergence: A League of Legends Story','//images.igdb.com/igdb/image/upload/t_cover_big/co56x9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (42091,'Formation Armed F','//images.igdb.com/igdb/image/upload/t_cover_big/co2vf2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (45376,'Super Robot Wars F Final','//images.igdb.com/igdb/image/upload/t_cover_big/myjx3h0k2zu4qszcjkxr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (38348,'BS F-Zero Grand Prix 2: Practice','//images.igdb.com/igdb/image/upload/t_cover_big/co2uzj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1680,'Wild Arms Alter Code: F','//images.igdb.com/igdb/image/upload/t_cover_big/co4pta.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (44790,'Magical Drop F: Daibouken Mo Raku Janai!','//images.igdb.com/igdb/image/upload/t_cover_big/co3u7x.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3489,'F-Zero X','//images.igdb.com/igdb/image/upload/t_cover_big/co53i2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (254629,'Cate P','//images.igdb.com/igdb/image/upload/t_cover_big/co6qwe.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (200491,'Cate West 2: The Velvet Keys','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (93959,'Abra Ca Dabra','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (99939,'Garbage Truck: Los Angeles, CA','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (4752,'Cate West: The Vanishing Files','//images.igdb.com/igdb/image/upload/t_cover_big/co48u5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (26101,'Cash Guns Chaos','//images.igdb.com/igdb/image/upload/t_cover_big/co60c6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (21619,'Coded Arms','//images.igdb.com/igdb/image/upload/t_cover_big/co2hvo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (18940,'Combat Arms','//images.igdb.com/igdb/image/upload/t_cover_big/co2hvq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (247342,'An Hei Po Huai Shen: Diablo','//images.igdb.com/igdb/image/upload/t_cover_big/co6kl3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (4327,'PO''ed','//images.igdb.com/igdb/image/upload/t_cover_big/co1p5m.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (119700,'Jian Po','//images.igdb.com/igdb/image/upload/t_cover_big/co5fyx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (257111,'Po-Go-No!','//images.igdb.com/igdb/image/upload/t_cover_big/co774m.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (94331,'Poing','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (80385,'Poing 6','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (38485,'K-ON! Houkago Live!!','//images.igdb.com/igdb/image/upload/t_cover_big/co4526.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (22768,'K-Razy Antiks','//images.igdb.com/igdb/image/upload/t_cover_big/gtcsjicks08r3bfv6ctj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (79340,'Super Robot Taisen K','//images.igdb.com/igdb/image/upload/t_cover_big/co2fen.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (108826,'Gakuen K: Wonderful School Days - V Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co5kjw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (16929,'Ar-K','//images.igdb.com/igdb/image/upload/t_cover_big/co3lm4.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (80967,'K''nossos','//images.igdb.com/igdb/image/upload/t_cover_big/co2mav.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (4410,'Shi-Kin-Joh','//images.igdb.com/igdb/image/upload/t_cover_big/co6028.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (141490,'Drova: Forsaken Kin','//images.igdb.com/igdb/image/upload/t_cover_big/co6ztq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (141187,'Kin''iro Loveriche: Golden Time','//images.igdb.com/igdb/image/upload/t_cover_big/co2lda.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (219635,'Light Kin','//images.igdb.com/igdb/image/upload/t_cover_big/co5eyp.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (19474,'Gwent: The Witcher Card Game','//images.igdb.com/igdb/image/upload/t_cover_big/co4hk2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (187871,'Fallout: New Vegas - Gun Runners'' Arsenal','//images.igdb.com/igdb/image/upload/t_cover_big/co7dt2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (257332,'Bluey: The Videogame','//images.igdb.com/igdb/image/upload/t_cover_big/co73oi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (93206,'Ryouko Inoue Chatting Room','//images.igdb.com/igdb/image/upload/t_cover_big/co7o98.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (63114,'Bandai Namco Games Presents: J Legend Retsuden','//images.igdb.com/igdb/image/upload/t_cover_big/co6c6q.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (40193,'J. J. Squawkers','//images.igdb.com/igdb/image/upload/t_cover_big/co4or3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (131135,'J & J''s Vegas Pack: Black-Jack','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (6629,'Super Robot Taisen J','//images.igdb.com/igdb/image/upload/t_cover_big/co4ykv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (37255,'Wonder Project J: Kikai no Shounen Pino','//images.igdb.com/igdb/image/upload/t_cover_big/co2ir6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (199499,'Dere-chat','//images.igdb.com/igdb/image/upload/t_cover_big/co5g5u.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (173819,'Sono Kubiwa wo Hanasanaide: Ookami wo Tabetai Akazukin to Akazukin wo Tabetai Ryoushi','//images.igdb.com/igdb/image/upload/t_cover_big/co4h4e.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (135303,'Kono Subarashii Sekai ni Shukufuku wo!: Kono Yokubou no Ishou ni Chouai wo!','//images.igdb.com/igdb/image/upload/t_cover_big/co2c3u.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (25579,'Lupin Sansei: Lupin ni wa Shi wo, Zenigata ni wa Koi wo','//images.igdb.com/igdb/image/upload/t_cover_big/jre3rcjrvc0jt5cyczzp.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (112301,'Kono Subarashii Sekai ni Shukufuku wo!: Kono Yokubukai Game ni Shinpan wo!','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (165900,'Kono Subarashii Sekai ni Shukufuku wo! Kono Yokubukai Game ni Shinpan Wo!: Limited Edition','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (265575,'Milfy City: Final Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co71oz.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (286480,'BoardLand','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (286433,'Scrabble','//images.igdb.com/igdb/image/upload/t_cover_big/co7r0q.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (252831,'Microsoft Flight Simulator: Dune','//images.igdb.com/igdb/image/upload/t_cover_big/co6m11.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (286910,'Powermount','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (258628,'Under the Snow','//images.igdb.com/igdb/image/upload/t_cover_big/co7rjm.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (285583,'Heroes of the Citadel','//images.igdb.com/igdb/image/upload/t_cover_big/co7qdy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (170233,'My Lovely Daughter: The Inquisitor','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (217131,'Astro Duel 2','//images.igdb.com/igdb/image/upload/t_cover_big/co7rji.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (286210,'Eggconsole Ys PC-8801mkIISR','//images.igdb.com/igdb/image/upload/t_cover_big/co7rj8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (283284,'Eggconsole Yokai Tantei PC-8801','//images.igdb.com/igdb/image/upload/t_cover_big/co7rj7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (280336,'A Spider to A Fly','//images.igdb.com/igdb/image/upload/t_cover_big/co7ixh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (91784,'Osouji Sentai Clean Keeper H','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (188828,'Billy Bumbum: A Cheeky Puzzler','//images.igdb.com/igdb/image/upload/t_cover_big/co5bmq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (171185,'Inspector Schmidt: A Bavarian Tale','//images.igdb.com/igdb/image/upload/t_cover_big/co7rj3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (195719,'Playhead','//images.igdb.com/igdb/image/upload/t_cover_big/co5kiz.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (286905,'Gods Raid','//images.igdb.com/igdb/image/upload/t_cover_big/co7rj1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (286904,'Kevin (1997-2077)','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (286903,'Teletext','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (286902,'Planet Mort','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (142182,'Dungeon & Fighter Mobile','//images.igdb.com/igdb/image/upload/t_cover_big/co4kn0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (26606,'Dungeon Fighter Online','//images.igdb.com/igdb/image/upload/t_cover_big/co3wer.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (142154,'Dungeon & Fighter: Spirit','//images.igdb.com/igdb/image/upload/t_cover_big/co2nk0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (194079,'Dungeon Fighter Online M','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (102873,'Pokémon: Let''s Go, Eevee!','//images.igdb.com/igdb/image/upload/t_cover_big/co1zjz.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (25877,'Pokémon: Let''s Go, Pikachu!','//images.igdb.com/igdb/image/upload/t_cover_big/co1zjy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (8076,'Speedy Gonzales: Los Gatos Bandidos','//images.igdb.com/igdb/image/upload/t_cover_big/co3dfj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (70085,'El Capitán Trueno en la Montaña de los Suspiros','//images.igdb.com/igdb/image/upload/t_cover_big/co26gw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (162737,'X-Plane 11: FunnerFlight - Airport Los Angeles International V2','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (154152,'Los Cops','//images.igdb.com/igdb/image/upload/t_cover_big/co45f8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (269610,'Los Lunnis','//images.igdb.com/igdb/image/upload/t_cover_big/co761f.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (236107,'Los Páramos','//images.igdb.com/igdb/image/upload/t_cover_big/co64b3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (241785,'Poke All Toads','//images.igdb.com/igdb/image/upload/t_cover_big/co7i3i.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (241219,'Genius Quiz Poke','//images.igdb.com/igdb/image/upload/t_cover_big/co69lp.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (241969,'Gênio Quiz Poke 2','//images.igdb.com/igdb/image/upload/t_cover_big/co69o1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (76965,'Poked','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (25149,'Poke-Man','//images.igdb.com/igdb/image/upload/t_cover_big/m5kzx1nzhmurwdzhkvzn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (262203,'El','//images.igdb.com/igdb/image/upload/t_cover_big/co6yh1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (74294,'El Ministerio del Tiempo VR: Salva el tiempo','//images.igdb.com/igdb/image/upload/t_cover_big/co2b0u.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (72345,'El Ministerio del Tiempo VR: El tiempo en tus manos','//images.igdb.com/igdb/image/upload/t_cover_big/co2b0t.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (214994,'El Dorado','//images.igdb.com/igdb/image/upload/t_cover_big/co5cbl.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (115413,'El crítico','//images.igdb.com/igdb/image/upload/t_cover_big/co1jd2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (9828,'El Matador','//images.igdb.com/igdb/image/upload/t_cover_big/co3put.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (4676,'Another Code: R - A Journey into Lost Memories','//images.igdb.com/igdb/image/upload/t_cover_big/co4ole.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (46071,'Puzzle & Action: Tant-R','//images.igdb.com/igdb/image/upload/t_cover_big/co2z06.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (136061,'R-Type III & Super R-Type Collector''s Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co7dni.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (173124,'Touhou Genso Wanderer: Lotus Labyrinth R','//images.igdb.com/igdb/image/upload/t_cover_big/co3xev.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (218458,'JoJo''s Bizarre Adventure: All Star Battle R - Digital Deluxe Edition','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (114322,'Hotel R''n''R','//images.igdb.com/igdb/image/upload/t_cover_big/co28jj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (257072,'Pa-nap','//images.igdb.com/igdb/image/upload/t_cover_big/co6s12.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (64338,'Cu-On-Pa SFC','//images.igdb.com/igdb/image/upload/t_cover_big/co49eg.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (134436,'Cu-On-Pa BS Ban','//images.igdb.com/igdb/image/upload/t_cover_big/co43nt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (219446,'PA-3 X Pac-Man Special Game','//images.igdb.com/igdb/image/upload/t_cover_big/co6g0i.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (260171,'Pa!nt','//images.igdb.com/igdb/image/upload/t_cover_big/co6w82.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (161825,'Microsoft Flight Simulator X: Steam Edition - Piper PA-28-181 Archer II','//images.igdb.com/igdb/image/upload/t_cover_big/co3j0p.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (203416,'Simple DS Series Vol. 35: The Genshijin DS','//images.igdb.com/igdb/image/upload/t_cover_big/co4tjx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (281690,'RPG Tsukuuru DS','//images.igdb.com/igdb/image/upload/t_cover_big/co7l21.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (67121,'PostPet DS: Yumemiru Momo to Fushigi no Pen','//images.igdb.com/igdb/image/upload/t_cover_big/co6syt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1494,'SimCity DS','//images.igdb.com/igdb/image/upload/t_cover_big/co2den.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (269785,'Jigsaw Puzzle DS: DS de Meguru Sekai Isan no Tabi','//images.igdb.com/igdb/image/upload/t_cover_big/co7694.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (203406,'Simple DS Series Vol. 14: The Jidousha Kyoushuujo DS','//images.igdb.com/igdb/image/upload/t_cover_big/co4tiz.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (137,'Star Wars: The Force Unleashed II','//images.igdb.com/igdb/image/upload/t_cover_big/co25xw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (69258,'Star Trek III','//images.igdb.com/igdb/image/upload/t_cover_big/vhezpv80db1o7vkb2c28.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1232,'Phantasy Star II','//images.igdb.com/igdb/image/upload/t_cover_big/co4hht.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (194604,'Destiny Star Girlfriend','//images.igdb.com/igdb/image/upload/t_cover_big/co7ken.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (45529,'Phantasy Star: Fukkoku-ban','//images.igdb.com/igdb/image/upload/t_cover_big/co5xk8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (283537,'Honkai: Star Rail - If One Dreams At Midnight','//images.igdb.com/igdb/image/upload/t_cover_big/co7oeu.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (184586,'Ki_swpr','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (27902,'Ki(n)ds','//images.igdb.com/igdb/image/upload/t_cover_big/njti5rveten5xlv0wcm0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (214591,'Vs. The Quest of Ki','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (56522,'Bara no Ki ni: Bara no Hanasaku','//images.igdb.com/igdb/image/upload/t_cover_big/co5djv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (131748,'Monster Girls You-Ki Chan','//images.igdb.com/igdb/image/upload/t_cover_big/co20c5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (194579,'Ero Zemi: Ecchi ni Yaru-ki ni ABC','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7514,'King''s Quest VII: The Princeless Bride','//images.igdb.com/igdb/image/upload/t_cover_big/co28rx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (65695,'One Piece: Mezase! King of Berry','//images.igdb.com/igdb/image/upload/t_cover_big/co6q1x.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7501,'King''s Quest VI: Heir Today, Gone Tomorrow','//images.igdb.com/igdb/image/upload/t_cover_big/co6ysf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (231927,'King of Kings','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (123016,'DTXMania GR','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11720,'Pokémon Card GB2: Great Rocket-Dan Sanjou!','//images.igdb.com/igdb/image/upload/t_cover_big/co7cri.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (108422,'Project GR-5LYR: Galactic Relocation','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (87255,'Bubble Pop Math Challenge Gr. 1-2 Premium','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (163114,'Grand Theft Auto: Brasil','//images.igdb.com/igdb/image/upload/t_cover_big/co3j7h.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (77203,'Power Boat GT','//images.igdb.com/igdb/image/upload/t_cover_big/zvh8il7viecljskam02w.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (44411,'Zen-Nihon GT Senshuken','//images.igdb.com/igdb/image/upload/t_cover_big/co4xrh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3375,'GT 64: Championship Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co47qf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (144128,'Sega GT 2002 / Jet Set Radio Future','//images.igdb.com/igdb/image/upload/t_cover_big/co2wor.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (164853,'Assetto Corsa Competizione: Intercontinental GT Pack','//images.igdb.com/igdb/image/upload/t_cover_big/co3kfo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (225807,'Pocket GT','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (264763,'Jump Like a Grad Student','//images.igdb.com/igdb/image/upload/t_cover_big/co711j.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (249222,'Atomgrad','//images.igdb.com/igdb/image/upload/t_cover_big/co6qq0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (75744,'One Piece: Maboroshi no Grand Line Boukenki!','//images.igdb.com/igdb/image/upload/t_cover_big/co53sb.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (18993,'The Peanuts Movie: Snoopy''s Grand Adventure','//images.igdb.com/igdb/image/upload/t_cover_big/co6uz3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (69168,'Wallace & Gromit''s Grand Adventures: Episode 3 - Muzzled!','//images.igdb.com/igdb/image/upload/t_cover_big/co507f.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (69160,'Wallace & Gromit''s Grand Adventures: Episode 4 - The Bogey Man','//images.igdb.com/igdb/image/upload/t_cover_big/co507g.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (115575,'Wallace & Gromit''s Grand Adventures: Episode 1 - Fright of the Bumblebees','//images.igdb.com/igdb/image/upload/t_cover_big/co507e.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (268772,'Master Detective Archives: Rain Code - Ch. Vivia: The Near-Death Detective + Ch. Yakou: Thank You, My Detective','//images.igdb.com/igdb/image/upload/t_cover_big/co7565.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (176055,'Bienvenue chez les Ch''tis','//images.igdb.com/igdb/image/upload/t_cover_big/co3zi1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (176063,'Bienvenue chez les Ch''tis','//images.igdb.com/igdb/image/upload/t_cover_big/co3zi2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (147792,'A Ch''ti Bundle','//images.igdb.com/igdb/image/upload/t_cover_big/co56yy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (159366,'Prison of the Magi: Ch. 0','//images.igdb.com/igdb/image/upload/t_cover_big/co3hil.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (243618,'Zeldo''s Challenge Ch. 1: Bingo''s Revenge','//images.igdb.com/igdb/image/upload/t_cover_big/co6by6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (112042,'Chatty','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (149279,'Le Monde de Titeuf','//images.igdb.com/igdb/image/upload/t_cover_big/co3158.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (255830,'Le Fol','//images.igdb.com/igdb/image/upload/t_cover_big/co6pvx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (52190,'The LEGO Ninjago Movie Video Game','//images.igdb.com/igdb/image/upload/t_cover_big/co253j.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (89734,'Le Parcours','//images.igdb.com/igdb/image/upload/t_cover_big/t2k82atvd8yccbvifipz.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (149280,'Le Monde de Nadia','//images.igdb.com/igdb/image/upload/t_cover_big/co3159.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (201206,'League of Golf','//images.igdb.com/igdb/image/upload/t_cover_big/co4r21.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (32856,'League of Evil','//images.igdb.com/igdb/image/upload/t_cover_big/co27ze.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (47277,'League of Light','//images.igdb.com/igdb/image/upload/t_cover_big/co1pf7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (22856,'League of Evil 2','//images.igdb.com/igdb/image/upload/t_cover_big/co2sf8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (65005,'J-League Pro Soccer Club o Tsukurou!','//images.igdb.com/igdb/image/upload/t_cover_big/ldx5aj6saueu33yck6do.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (65006,'J-League Pro Soccer Club o Tsukurou! 2','//images.igdb.com/igdb/image/upload/t_cover_big/q62ysg9jtkexkkt2vp9k.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (64791,'J-League Pro Soccer Club o Tsukurou! 3','//images.igdb.com/igdb/image/upload/t_cover_big/drgi72shsdnerl2sk8lu.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (65010,'J-League Pro Soccer Club o Tsukurou! 5','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (62764,'J-League Pro Soccer Club o Tsukurou! ''04','//images.igdb.com/igdb/image/upload/t_cover_big/vlwopd3ysma01vlhp0j7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (62766,'J-League Pro Soccer Club o Tsukurou! 6 Pride of J','//images.igdb.com/igdb/image/upload/t_cover_big/co75t7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (124474,'LOL','//images.igdb.com/igdb/image/upload/t_cover_big/co2ql4.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (98829,'LOL Dolls - lol surprise game','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (130177,'Slime LOL','//images.igdb.com/igdb/image/upload/t_cover_big/co2c20.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (241922,'Genius Quiz LoL','//images.igdb.com/igdb/image/upload/t_cover_big/co69ml.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (219450,'LOL: Hasse toh Phasse x Pac-Man','//images.igdb.com/igdb/image/upload/t_cover_big/co5exk.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (88819,'LoL Kart','//images.igdb.com/igdb/image/upload/t_cover_big/gcxx7w0b0t8w9bs2zgjb.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (131397,'YuYu Hakusho 100% Maji Battle','//images.igdb.com/igdb/image/upload/t_cover_big/co6bxh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (38359,'Cotton 100%','//images.igdb.com/igdb/image/upload/t_cover_big/co3zdc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (109062,'Yume Oukoku to Nemureru 100-nin no Ouji-sama','//images.igdb.com/igdb/image/upload/t_cover_big/co6846.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (183648,'DC League of Super-Pets: The Adventures of Krypto and Ace','//images.igdb.com/igdb/image/upload/t_cover_big/co49zm.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (157216,'League of Enthusiastic Losers','//images.igdb.com/igdb/image/upload/t_cover_big/co4579.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (182190,'Song of Nunu: A League of Legends Story','//images.igdb.com/igdb/image/upload/t_cover_big/co48wp.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (180299,'Hextech Mayhem: A League of Legends Story','//images.igdb.com/igdb/image/upload/t_cover_big/co483k.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (191398,'Mario Strikers: Battle League','//images.igdb.com/igdb/image/upload/t_cover_big/co4has.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (227099,'League of Enthusiastic Losers + Clumsy Rush','//images.igdb.com/igdb/image/upload/t_cover_big/co5vi3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (152296,'Cat''s Kiss','//images.igdb.com/igdb/image/upload/t_cover_big/co39t0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (145537,'.Cat','//images.igdb.com/igdb/image/upload/t_cover_big/co2xd1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (187000,'Cham the Cat Adventure','//images.igdb.com/igdb/image/upload/t_cover_big/co5awt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (112545,'Cat Game!','//images.igdb.com/igdb/image/upload/t_cover_big/co4pul.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (200122,'Simon''s Cat in Cat Chat','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (129999,'Cat Quest + Cat Quest II: Pawsome Pack','//images.igdb.com/igdb/image/upload/t_cover_big/co25o7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (116910,'The Lost We Lost','//images.igdb.com/igdb/image/upload/t_cover_big/co3c73.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (18036,'Raiders of the Lost Ark','//images.igdb.com/igdb/image/upload/t_cover_big/co5vyf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2615,'Norse by Norse West: The Return of the Lost Vikings','//images.igdb.com/igdb/image/upload/t_cover_big/co492l.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (194149,'Jurassic Island: Lost Ark Survival','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7058,'Lost: Via Domus','//images.igdb.com/igdb/image/upload/t_cover_big/co2e8z.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (92796,'A Tribute to the Rolling Boulder (from Raiders of the Lost Ark)','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (165536,'Lost Passage: Ushinawareta Hitofushi','//images.igdb.com/igdb/image/upload/t_cover_big/co3qbk.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (95143,'ARK -the lost fairytale-','//images.igdb.com/igdb/image/upload/t_cover_big/co2fwd.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (146851,'Lost Judgment','//images.igdb.com/igdb/image/upload/t_cover_big/co53ld.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1253,'The Lost Vikings 2','//images.igdb.com/igdb/image/upload/t_cover_big/co1u32.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (280892,'Ao no Kanata no Four Rhythm Extra1+2P','//images.igdb.com/igdb/image/upload/t_cover_big/co7ji1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (108312,'Pok','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (139018,'Kotori Love Ex P','//images.igdb.com/igdb/image/upload/t_cover_big/co2gvx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (279557,'Pok The Little Artiste','//images.igdb.com/igdb/image/upload/t_cover_big/co7h48.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (135583,'Arcade Archives: P-47','//images.igdb.com/igdb/image/upload/t_cover_big/co4ick.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (31979,'Tribe of Pok','//images.igdb.com/igdb/image/upload/t_cover_big/teu9mqoxctm3m1b8oalt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (79381,'Digital Combat Simulator: P-51D Mustang','//images.igdb.com/igdb/image/upload/t_cover_big/kvxdvrkc9gr7coskvmgt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (171399,'Indian Army: Mission Pok','//images.igdb.com/igdb/image/upload/t_cover_big/co5h8u.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (278398,'Dr. P','//images.igdb.com/igdb/image/upload/t_cover_big/co7f9g.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2924,'Broken Sword 5: The Serpent''s Curse','//images.igdb.com/igdb/image/upload/t_cover_big/co2mn5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (94701,'Virtua Fighter 5 R','//images.igdb.com/igdb/image/upload/t_cover_big/co38vk.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (279537,'DJMax Respect V: V Extension V Pack','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (255884,'Taboo 5','//images.igdb.com/igdb/image/upload/t_cover_big/co6pzp.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (111644,'ACA Neo Geo: Pleasure Goal - 5 on 5 Mini Soccer','//images.igdb.com/igdb/image/upload/t_cover_big/co1qzp.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (152479,'13 Wood St','//images.igdb.com/igdb/image/upload/t_cover_big/co3pn3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (215972,'Train Sim World 3: West Cornwall Local: Penzance - St Austell & St Ives Route','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (193157,'Train Sim World 2: West Cornwall Local: Penzance - St Austell & St Ives Route','//images.igdb.com/igdb/image/upload/t_cover_big/co5t67.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (133059,'Fobia: St. Dinfna Hotel','//images.igdb.com/igdb/image/upload/t_cover_big/co4l4i.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (208692,'13 Wood St Remastered','//images.igdb.com/igdb/image/upload/t_cover_big/co4yux.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (274401,'St. Luminous Jogakuin','//images.igdb.com/igdb/image/upload/t_cover_big/co7awo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (148652,'Mamegoma Yoi Ko Marui Ko Genki na Ko!','//images.igdb.com/igdb/image/upload/t_cover_big/co68my.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (278022,'Ko Ko Ro...','//images.igdb.com/igdb/image/upload/t_cover_big/co7ev3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (35426,'Koi-Koi Japan','//images.igdb.com/igdb/image/upload/t_cover_big/co6c7l.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (64540,'No-Ri-Ko','//images.igdb.com/igdb/image/upload/t_cover_big/xo4bm2qqto2rizxwkuaa.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (224194,'Shinobi, Koi Utsutsu: Setsugekka Koi Emaki','//images.igdb.com/igdb/image/upload/t_cover_big/co5qds.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (209825,'K.O.','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (226082,'Ikemen Bakumatsu: Unmei no Koi Hana no Miyako to Koi no Ran','//images.igdb.com/igdb/image/upload/t_cover_big/co5sih.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (285748,'Oshi no Ko Quiz','//images.igdb.com/igdb/image/upload/t_cover_big/co7qel.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (214562,'Otometeki Koi Kakumei Love Revo!! 100kg Kara Hajimaru Koi Monogatari','//images.igdb.com/igdb/image/upload/t_cover_big/co54ge.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (80012,'OK K.O.! Let''s Play Heroes','//images.igdb.com/igdb/image/upload/t_cover_big/co50dx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (282480,'Koi','//images.igdb.com/igdb/image/upload/t_cover_big/co7m3n.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (237961,'Tank Legend Online: League of Tanks','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (208468,'League of Legends Esports Manager','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (5680,'Dr Kawashima''s Devilish Brain Training','//images.igdb.com/igdb/image/upload/t_cover_big/co557t.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (47847,'Dr. Mario Express','//images.igdb.com/igdb/image/upload/t_cover_big/co4lat.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3478,'Dr. Luigi','//images.igdb.com/igdb/image/upload/t_cover_big/co1wns.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (21910,'Dr. Mario Online Rx','//images.igdb.com/igdb/image/upload/t_cover_big/co21td.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (65535,'Dr. Rin ni Kiitemite! Koi no Rin Fuusui','//images.igdb.com/igdb/image/upload/t_cover_big/co6mh4.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (122705,'Dr Kawashima''s Brain Training for Nintendo Switch','//images.igdb.com/igdb/image/upload/t_cover_big/co1u8o.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (254062,'Robo Ret','//images.igdb.com/igdb/image/upload/t_cover_big/co6rn7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (238175,'Super Neptunia RPG: Party Member - Compa','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (166400,'Hyperdevotion Noire: Goddess Black Heart - Ultimate Member “Compa”','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (265152,'Violet','//images.igdb.com/igdb/image/upload/t_cover_big/co7ci7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (178331,'Violet and...','//images.igdb.com/igdb/image/upload/t_cover_big/co45rv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (184526,'Violet','//images.igdb.com/igdb/image/upload/t_cover_big/co4a5k.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (60138,'Violet','//images.igdb.com/igdb/image/upload/t_cover_big/a5gkspajqtdptgo2xk9n.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (203516,'Pokémon Scarlet and Pokémon Violet Double Pack','//images.igdb.com/igdb/image/upload/t_cover_big/co5shr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (43964,'Koi Koi Mahjong','//images.igdb.com/igdb/image/upload/t_cover_big/boogt4dolvnzx9ymu1bn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7528,'King''s Quest VIII: The Mask of Eternity','//images.igdb.com/igdb/image/upload/t_cover_big/co5v70.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (48148,'King of Kings: The Early Years','//images.igdb.com/igdb/image/upload/t_cover_big/co5wu6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (127602,'League of Pixels','//images.igdb.com/igdb/image/upload/t_cover_big/co457b.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (173002,'Gra & Vity','//images.igdb.com/igdb/image/upload/t_cover_big/co5dt1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (20426,'Gran Turismo','//images.igdb.com/igdb/image/upload/t_cover_big/co20bh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (138777,'Gran Turismo Sport: Spec II','//images.igdb.com/igdb/image/upload/t_cover_big/co2g86.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (245883,'Grade Sword','//images.igdb.com/igdb/image/upload/t_cover_big/co6dzn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1594,'Gran Turismo','//images.igdb.com/igdb/image/upload/t_cover_big/co6e10.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (17260,'Math Gran Prix','//images.igdb.com/igdb/image/upload/t_cover_big/ucacvyah5xaiexfgorjw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1600,'Gran Turismo 3: A-Spec','//images.igdb.com/igdb/image/upload/t_cover_big/co5xru.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (136852,'Gran Turismo 5 Spec 2.0','//images.igdb.com/igdb/image/upload/t_cover_big/co2wgv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (4945,'Ju-on: The Grudge','//images.igdb.com/igdb/image/upload/t_cover_big/co2xfc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (255353,'JuJuJu Club: Potsunen','//images.igdb.com/igdb/image/upload/t_cover_big/co6p5y.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (40263,'Jump Ultimate Stars','//images.igdb.com/igdb/image/upload/t_cover_big/co1u9t.jpg',0);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (74382,'Ju','//images.igdb.com/igdb/image/upload/t_cover_big/co2bru.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (40202,'Ju Ju Densetsu','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (117668,'Beetle Ju','//images.igdb.com/igdb/image/upload/t_cover_big/co4pgs.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (117669,'Beetle Ju 3','//images.igdb.com/igdb/image/upload/t_cover_big/co1kw8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (49686,'MiniMoni: Mika no Happy Morning Chatty','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (174236,'Chicken Cha Cha Cha','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (265971,'Akazukin Cha Cha Cha','//images.igdb.com/igdb/image/upload/t_cover_big/co726w.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (98094,'Riya''s Cha Cha Cha World','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (15887,'Akazukin Cha-cha','//images.igdb.com/igdb/image/upload/t_cover_big/co4weq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (262275,'Dracula Cha Cha','//images.igdb.com/igdb/image/upload/t_cover_big/co6ylu.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (228473,'Akazukin Cha-cha','//images.igdb.com/igdb/image/upload/t_cover_big/co5v7e.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7743,'Wizard of Wor','//images.igdb.com/igdb/image/upload/t_cover_big/co38sq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (45618,'Elf Wor','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (10831,'Sid Meier''s Civilization III: Play the World','//images.igdb.com/igdb/image/upload/t_cover_big/co4x1m.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (165475,'Sensible World of Soccer ''97/''98 World Cup Edition','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (105255,'Wings of Wor','//images.igdb.com/igdb/image/upload/t_cover_big/co3xz6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (28830,'Snack World: The Dungeon Crawl - Gold','//images.igdb.com/igdb/image/upload/t_cover_big/co2vxp.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (282083,'Wizard of Wor','//images.igdb.com/igdb/image/upload/t_cover_big/co7lix.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (282084,'Wizard of Wor','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7178,'SBK 08: Superbike World Championship','//images.igdb.com/igdb/image/upload/t_cover_big/co72ez.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (260062,'World Football 98','//images.igdb.com/igdb/image/upload/t_cover_big/co6w15.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (199326,'The Quest for Excalibur: Puy du Fou','//images.igdb.com/igdb/image/upload/t_cover_big/co4trx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (149007,'Maxi Quiz du Foot Francais','//images.igdb.com/igdb/image/upload/t_cover_big/co315i.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (119936,'Du-game','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (277715,'Tour Du Monde','//images.igdb.com/igdb/image/upload/t_cover_big/co7ee6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (15335,'Passengers on the Wind','//images.igdb.com/igdb/image/upload/t_cover_big/rquuhqnevluodg03az4w.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (144074,'L''esprit du loup','//images.igdb.com/igdb/image/upload/t_cover_big/co2u16.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (196447,'Quake: The Punishment Due','//images.igdb.com/igdb/image/upload/t_cover_big/co4mqi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (203699,'Ocean Animals Puzzle for Kids & Toddlers','//images.igdb.com/igdb/image/upload/t_cover_big/co4tyg.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (177991,'A2: A due','//images.igdb.com/igdb/image/upload/t_cover_big/co4w0o.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (59506,'Clarence: Thirty Days & Seven Seas','//images.igdb.com/igdb/image/upload/t_cover_big/co61gf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (240367,'Due Date','//images.igdb.com/igdb/image/upload/t_cover_big/co67zq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (146596,'Card de Renketsu! Densha de GO!','//images.igdb.com/igdb/image/upload/t_cover_big/co2z3b.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (160089,'Gun&Dun','//images.igdb.com/igdb/image/upload/t_cover_big/co41ip.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (60900,'Due Process','//images.igdb.com/igdb/image/upload/t_cover_big/co2hke.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (163800,'La Foret De Pago 2: Souvenir de Glace','//images.igdb.com/igdb/image/upload/t_cover_big/co4549.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (272466,'Wi-fi Dungeon: Organism Online','//images.igdb.com/igdb/image/upload/t_cover_big/co797o.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (254947,'Cafe ma Cherie: Otome of Ikemen Cafe','//images.igdb.com/igdb/image/upload/t_cover_big/co6ojl.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (184992,'Quiet Maple','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (230756,'Sister Location: MA','//images.igdb.com/igdb/image/upload/t_cover_big/co73jn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (66047,'Nazo Waku Yakata: Oto no Ma ni Ma ni','//images.igdb.com/igdb/image/upload/t_cover_big/co6x2e.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (279120,'Map Map: A Game About Maps','//images.igdb.com/igdb/image/upload/t_cover_big/co7g6m.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (112053,'MA-RI-A: The Curse of the Puppet Museum','//images.igdb.com/igdb/image/upload/t_cover_big/co51xh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (232808,'Transformers: War for Cybertron Map and Character Pack','//images.igdb.com/igdb/image/upload/t_cover_big/co61ho.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (213174,'1000$','//images.igdb.com/igdb/image/upload/t_cover_big/co52pr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (181209,'Ma Puzzle','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (78419,'Map','//images.igdb.com/igdb/image/upload/t_cover_big/hthgrhp5acgfccel9sm3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (92013,'1000','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (224032,'Kiem Ma 3D','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (254820,'Map','//images.igdb.com/igdb/image/upload/t_cover_big/co6of5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (91756,'Aban Hawkins & the 1000 Spikes','//images.igdb.com/igdb/image/upload/t_cover_big/co61wk.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (134500,'BS Zelda no Densetsu Map 2','//images.igdb.com/igdb/image/upload/t_cover_big/co2uzw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1254,'DmC: Devil May Cry','//images.igdb.com/igdb/image/upload/t_cover_big/co1u77.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1039,'The Legend of Zelda: Ocarina of Time 3D','//images.igdb.com/igdb/image/upload/t_cover_big/co600u.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (980,'Grand Theft Auto','//images.igdb.com/igdb/image/upload/t_cover_big/co2lb0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (558,'Just Cause 2','//images.igdb.com/igdb/image/upload/t_cover_big/co1qri.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3349,'Paper Mario: The Thousand-Year Door','//images.igdb.com/igdb/image/upload/t_cover_big/co25us.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (55935,'Doki Doki Literature Club!','//images.igdb.com/igdb/image/upload/t_cover_big/co6p5e.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (9254,'Subnautica','//images.igdb.com/igdb/image/upload/t_cover_big/co1iqw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (324,'Age of Mythology','//images.igdb.com/igdb/image/upload/t_cover_big/co2xlp.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11065,'Ratchet & Clank','//images.igdb.com/igdb/image/upload/t_cover_big/co230k.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (27789,'PUBG: Battlegrounds','//images.igdb.com/igdb/image/upload/t_cover_big/co7j43.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1511,'Pokémon Blue Version','//images.igdb.com/igdb/image/upload/t_cover_big/co5pi7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (29004,'Life is Strange: Before the Storm','//images.igdb.com/igdb/image/upload/t_cover_big/co1twj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2437,'Prince of Persia: The Two Thrones','//images.igdb.com/igdb/image/upload/t_cover_big/co4ta0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1270,'Darksiders','//images.igdb.com/igdb/image/upload/t_cover_big/co29t0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (119313,'Fall Guys','//images.igdb.com/igdb/image/upload/t_cover_big/co75h8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (76253,'Devil May Cry 5','//images.igdb.com/igdb/image/upload/t_cover_big/co1rb4.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1991,'Fez','//images.igdb.com/igdb/image/upload/t_cover_big/co1rd9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (13166,'The Witcher 3: Wild Hunt - Blood and Wine','//images.igdb.com/igdb/image/upload/t_cover_big/co2lgo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (475,'Star Wars: The Force Unleashed','//images.igdb.com/igdb/image/upload/t_cover_big/co25xx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (135243,'It Takes Two','//images.igdb.com/igdb/image/upload/t_cover_big/co2t97.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2262,'Gothic II','//images.igdb.com/igdb/image/upload/t_cover_big/co25ag.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (342,'Duke Nukem 3D','//images.igdb.com/igdb/image/upload/t_cover_big/co1y7x.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7292,'Mortal Kombat X','//images.igdb.com/igdb/image/upload/t_cover_big/co1y08.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2332,'Super Mario Kart','//images.igdb.com/igdb/image/upload/t_cover_big/co21w8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (5025,'To the Moon','//images.igdb.com/igdb/image/upload/t_cover_big/co25yv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11492,'Mafia III','//images.igdb.com/igdb/image/upload/t_cover_big/co2mll.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2058,'Payday 2','//images.igdb.com/igdb/image/upload/t_cover_big/co3s5l.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (6739,'Black Mesa','//images.igdb.com/igdb/image/upload/t_cover_big/co20n4.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1626,'Super Smash Bros.','//images.igdb.com/igdb/image/upload/t_cover_big/co2tso.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (281,'Return to Castle Wolfenstein','//images.igdb.com/igdb/image/upload/t_cover_big/co1xzr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (22917,'Gris','//images.igdb.com/igdb/image/upload/t_cover_big/co1qv5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2113,'Star Wars Battlefront','//images.igdb.com/igdb/image/upload/t_cover_big/co2res.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7352,'Abzu','//images.igdb.com/igdb/image/upload/t_cover_big/co28sy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1192,'Crash Team Racing','//images.igdb.com/igdb/image/upload/t_cover_big/co5ehy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2180,'Super Mario 3D World','//images.igdb.com/igdb/image/upload/t_cover_big/co21vd.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (112,'Devil May Cry 4','//images.igdb.com/igdb/image/upload/t_cover_big/co1u6n.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (110248,'Stray','//images.igdb.com/igdb/image/upload/t_cover_big/co4tt2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3075,'FTL: Faster Than Light','//images.igdb.com/igdb/image/upload/t_cover_big/co2gd9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (14587,'Oxenfree','//images.igdb.com/igdb/image/upload/t_cover_big/co2hlq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (114283,'Persona 5 Royal','//images.igdb.com/igdb/image/upload/t_cover_big/co1nic.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7386,'The Talos Principle','//images.igdb.com/igdb/image/upload/t_cover_big/co1rb5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11397,'Yakuza 0','//images.igdb.com/igdb/image/upload/t_cover_big/co252x.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (912,'Tomb Raider','//images.igdb.com/igdb/image/upload/t_cover_big/co3hfx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (966,'Resident Evil 3: Nemesis','//images.igdb.com/igdb/image/upload/t_cover_big/co2vvb.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (424,'Resident Evil','//images.igdb.com/igdb/image/upload/t_cover_big/co20bp.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (119277,'Genshin Impact','//images.igdb.com/igdb/image/upload/t_cover_big/co480t.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (748,'Hitman 2: Silent Assassin','//images.igdb.com/igdb/image/upload/t_cover_big/co1pdt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (548,'Gears of War 2','//images.igdb.com/igdb/image/upload/t_cover_big/co28gg.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2261,'Gothic','//images.igdb.com/igdb/image/upload/t_cover_big/co25r2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1035,'The Legend of Zelda: The Minish Cap','//images.igdb.com/igdb/image/upload/t_cover_big/co3nsk.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (153,'Star Wars: Jedi Knight - Jedi Academy','//images.igdb.com/igdb/image/upload/t_cover_big/co5c44.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (19561,'Days Gone','//images.igdb.com/igdb/image/upload/t_cover_big/co1izz.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (389,'Final Fantasy XIII','//images.igdb.com/igdb/image/upload/t_cover_big/co2ukg.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (299,'Age of Empires III','//images.igdb.com/igdb/image/upload/t_cover_big/co1xy6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (27421,'Middle-earth: Shadow of War','//images.igdb.com/igdb/image/upload/t_cover_big/co20pq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11169,'Final Fantasy VII Remake','//images.igdb.com/igdb/image/upload/t_cover_big/co1qxr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2126,'Hotline Miami 2: Wrong Number','//images.igdb.com/igdb/image/upload/t_cover_big/co3wf6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7327,'Valiant Hearts: The Great War','//images.igdb.com/igdb/image/upload/t_cover_big/co25zo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (184,'Indiana Jones and the Fate of Atlantis','//images.igdb.com/igdb/image/upload/t_cover_big/co6ys2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (13182,'Far Cry: Primal','//images.igdb.com/igdb/image/upload/t_cover_big/co28ha.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (119,'Mortal Kombat','//images.igdb.com/igdb/image/upload/t_cover_big/co20mc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (111469,'Among Us','//images.igdb.com/igdb/image/upload/t_cover_big/co6kqt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (109462,'Animal Crossing: New Horizons','//images.igdb.com/igdb/image/upload/t_cover_big/co3wls.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3193,'Need for Speed: Most Wanted','//images.igdb.com/igdb/image/upload/t_cover_big/co20a5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (280,'Doom 3','//images.igdb.com/igdb/image/upload/t_cover_big/co1v3n.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (245,'Command & Conquer: Red Alert 2','//images.igdb.com/igdb/image/upload/t_cover_big/co2345.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (193,'Day of the Tentacle','//images.igdb.com/igdb/image/upload/t_cover_big/co30yt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1928,'Indigo Prophecy','//images.igdb.com/igdb/image/upload/t_cover_big/co3rhh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1514,'Pokémon Crystal Version','//images.igdb.com/igdb/image/upload/t_cover_big/co5pil.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (320,'S.T.A.L.K.E.R.: Shadow of Chernobyl','//images.igdb.com/igdb/image/upload/t_cover_big/co5pz6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (181,'Grim Fandango','//images.igdb.com/igdb/image/upload/t_cover_big/co25r3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2114,'Tom Clancy''s The Division','//images.igdb.com/igdb/image/upload/t_cover_big/co1yvf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1715,'Mega Man 2','//images.igdb.com/igdb/image/upload/t_cover_big/co5x42.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (355,'Quake III Arena','//images.igdb.com/igdb/image/upload/t_cover_big/co1ybj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1911,'Path of Exile','//images.igdb.com/igdb/image/upload/t_cover_big/co1n6w.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2990,'Machinarium','//images.igdb.com/igdb/image/upload/t_cover_big/co27lo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (910,'Tom Clancy''s Splinter Cell','//images.igdb.com/igdb/image/upload/t_cover_big/co2ysy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (8965,'Darkest Dungeon','//images.igdb.com/igdb/image/upload/t_cover_big/co1rc4.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (534,'The Legend of Zelda: Skyward Sword','//images.igdb.com/igdb/image/upload/t_cover_big/co5wrj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (112875,'God of War Ragnarök','//images.igdb.com/igdb/image/upload/t_cover_big/co5s5v.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (19164,'Borderlands 3','//images.igdb.com/igdb/image/upload/t_cover_big/co20r3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (9192,'Wolfenstein: The Old Blood','//images.igdb.com/igdb/image/upload/t_cover_big/co21et.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (93921,'Gel: Set & Match','//images.igdb.com/igdb/image/upload/t_cover_big/co47r8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (131,'Warcraft II: Beyond the Dark Portal','//images.igdb.com/igdb/image/upload/t_cover_big/co1xxt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (175030,'WOR: World of Riders','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (102868,'World War 3','//images.igdb.com/igdb/image/upload/t_cover_big/co5utn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (20910,'World War Z','//images.igdb.com/igdb/image/upload/t_cover_big/co2i4r.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (119795,'Mi Mi Mi','//images.igdb.com/igdb/image/upload/t_cover_big/co3odu.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (8617,'1001 Spikes','//images.igdb.com/igdb/image/upload/t_cover_big/co1omq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (222580,'Magic Carpet 1001','//images.igdb.com/igdb/image/upload/t_cover_big/co6o2y.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (268037,'1001 Jigsaw. 6 Magic Elements','//images.igdb.com/igdb/image/upload/t_cover_big/co7rsf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (195421,'1001 Jigsaw American Puzzles','//images.igdb.com/igdb/image/upload/t_cover_big/co53kq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (162968,'1001 Jigsaw World Tour Africa','//images.igdb.com/igdb/image/upload/t_cover_big/co3kqq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (266357,'Counter-Strike','//images.igdb.com/igdb/image/upload/t_cover_big/co72lk.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (143558,'Counter-Strike NEO: White Memories','//images.igdb.com/igdb/image/upload/t_cover_big/co2te1.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (25743,'Lethal VR','//images.igdb.com/igdb/image/upload/t_cover_big/co2qk8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1617,'Mortal Kombat vs. DC Universe','//images.igdb.com/igdb/image/upload/t_cover_big/co1y13.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (177702,'Mk Creature.zip','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (138651,'DoorDoor MK II','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (28949,'B-12: Brantisky Mk. 12','//images.igdb.com/igdb/image/upload/t_cover_big/co29v9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (45752,'Top Fighter 2000 MK VIII','//images.igdb.com/igdb/image/upload/t_cover_big/co5vqs.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (69766,'The Aeronautics Quiz MK 2','//images.igdb.com/igdb/image/upload/t_cover_big/myv3sz2frryhg1lq8s6m.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (241328,'555!','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (43424,'Kamen Rider 555','//images.igdb.com/igdb/image/upload/t_cover_big/co7jyy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (246955,'Category Challenge','//images.igdb.com/igdb/image/upload/t_cover_big/co6f3j.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (286771,'Sad','//images.igdb.com/igdb/image/upload/t_cover_big/co7rdv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (131048,'Sad','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (124135,'Sad RPG','//images.igdb.com/igdb/image/upload/t_cover_big/co47ar.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (113672,'Everybody''s Sad','//images.igdb.com/igdb/image/upload/t_cover_big/co2tv4.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (128208,'Uncle Sad Bedroom','//images.igdb.com/igdb/image/upload/t_cover_big/co27un.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (139016,'The world had been sad since Tuesday','//images.igdb.com/igdb/image/upload/t_cover_big/co2gvk.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (76890,'Wow! Wow! Wubzy','//images.igdb.com/igdb/image/upload/t_cover_big/co2rwo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (92094,'Word Wow','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (109314,'Supaplex WOW!','//images.igdb.com/igdb/image/upload/t_cover_big/co42md.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (272713,'Yeah! Wow! Hey!','//images.igdb.com/igdb/image/upload/t_cover_big/co79a5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (132687,'Apocalypse, Wow!','//images.igdb.com/igdb/image/upload/t_cover_big/co3lkm.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (278197,'G-Mode Archives 51: Trio the Punch','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2550,'Dragon Ball Z: Super Butouden 3','//images.igdb.com/igdb/image/upload/t_cover_big/co4l0v.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (114009,'Dragon Ball Z: Kakarot','//images.igdb.com/igdb/image/upload/t_cover_big/co2kqa.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (48682,'Dragon Ball Z II: Gekishin Frieza!!','//images.igdb.com/igdb/image/upload/t_cover_big/co53q5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7480,'Musou Orochi Z','//images.igdb.com/igdb/image/upload/t_cover_big/co215r.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2545,'Dragon Ball Z: Super Butouden','//images.igdb.com/igdb/image/upload/t_cover_big/co4l0r.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2546,'Dragon Ball Z: Super Butouden 2','//images.igdb.com/igdb/image/upload/t_cover_big/co4l4a.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (226065,'Maybe: Interactive Stories - My Dear Goddess','//images.igdb.com/igdb/image/upload/t_cover_big/co5sho.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (25225,'Kim','//images.igdb.com/igdb/image/upload/t_cover_big/co2qhs.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (8150,'Disney''s Kim Possible: What''s the Switch?','//images.igdb.com/igdb/image/upload/t_cover_big/co2qht.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (8144,'Disney''s Kim Possible 2: Drakken''s Demise','//images.igdb.com/igdb/image/upload/t_cover_big/co1vyj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (102410,'Kim and Prostitute','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (76239,'This War of Mine: War Child Charity','//images.igdb.com/igdb/image/upload/t_cover_big/phgsesqf34brwtnwmqxz.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (108364,'War War War: Smiles vs. Ghosts','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (83517,'Total War: Shogun 2 - Dragon War Battle Pack','//images.igdb.com/igdb/image/upload/t_cover_big/di4n4cf6c599wbtrreci.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (466,'Warhammer 40,000: Dawn of War II','//images.igdb.com/igdb/image/upload/t_cover_big/co3lu2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (18980,'Warhammer 40,000: Dawn of War III','//images.igdb.com/igdb/image/upload/t_cover_big/co1weo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (758,'Independence War 2: Edge of Chaos','//images.igdb.com/igdb/image/upload/t_cover_big/co24nz.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (145550,'Mahjong World W','//images.igdb.com/igdb/image/upload/t_cover_big/co2xef.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (47068,'FNaF World','//images.igdb.com/igdb/image/upload/t_cover_big/co6aq6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (230606,'FNaF World: Update 2','//images.igdb.com/igdb/image/upload/t_cover_big/co60v5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (58707,'FNaF World: Halloween Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co72ee.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (27547,'Fire Pro Wrestling World','//images.igdb.com/igdb/image/upload/t_cover_big/co206j.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (50991,'Mr. Driller W','//images.igdb.com/igdb/image/upload/t_cover_big/co68az.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (166656,'Go! Go! Nippon! 2015','//images.igdb.com/igdb/image/upload/t_cover_big/co4vx0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (166659,'Go! Go! Nippon! 2016','//images.igdb.com/igdb/image/upload/t_cover_big/co3rvd.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (186464,'Ganbare Goemon: Jetto GO! GO! GO!','//images.igdb.com/igdb/image/upload/t_cover_big/co5ty9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (212451,'Go Go Muffin','//images.igdb.com/igdb/image/upload/t_cover_big/co7msn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (92251,'Train Simulator + Densha de GO!: Tokyo Line','//images.igdb.com/igdb/image/upload/t_cover_big/co2z3i.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (217860,'Pokémon: Let''s Go, Eevee! GBA','//images.igdb.com/igdb/image/upload/t_cover_big/co6ivp.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (103512,'Pokémon Mystery Dungeon: Let''s Go! Tempest Adventure Squad','//images.igdb.com/igdb/image/upload/t_cover_big/co3dkc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (103513,'Pokémon Mystery Dungeon: Go For It! Radiant Adventure Squad','//images.igdb.com/igdb/image/upload/t_cover_big/co3dmh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (103511,'Pokémon Mystery Dungeon: Keep Going! Wildfire Adventure Squad','//images.igdb.com/igdb/image/upload/t_cover_big/co3dkd.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (237561,'Ove: The Sword of Liberation','//images.igdb.com/igdb/image/upload/t_cover_big/co65lg.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (134286,'Min-Mins','//images.igdb.com/igdb/image/upload/t_cover_big/co288i.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (133835,'Super Smash Bros. Ultimate: Challenger Pack 6','//images.igdb.com/igdb/image/upload/t_cover_big/co60yj.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (123621,'Kōchū Ōja Mushiking: Mori no Min no Densetsu - Min''nade tan Ken! Kabutomushi no Mori','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (96888,'Sok Min','//images.igdb.com/igdb/image/upload/t_cover_big/co41qv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (196129,'Sok Min: Pro','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (150196,'Neko Min','//images.igdb.com/igdb/image/upload/t_cover_big/co7fs7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (240149,'Minecraft Tower Defence','//images.igdb.com/igdb/image/upload/t_cover_big/co67ts.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (233695,'Minecraft: Master Chief Mash-up','//images.igdb.com/igdb/image/upload/t_cover_big/co626z.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (254125,'Minecraft: Frozen','//images.igdb.com/igdb/image/upload/t_cover_big/co6ndv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (221919,'Minecraft: Village & Pillage','//images.igdb.com/igdb/image/upload/t_cover_big/co5jfy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (222606,'Minecraft: Caves & Cliffs - Part II','//images.igdb.com/igdb/image/upload/t_cover_big/co5mlt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (223159,'Minecraft: Caves & Cliffs - Part II','//images.igdb.com/igdb/image/upload/t_cover_big/co5pnq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7475,'Trinity: Souls of Zill O''ll','//images.igdb.com/igdb/image/upload/t_cover_big/co3jci.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (266053,'I''ll Be Here.','//images.igdb.com/igdb/image/upload/t_cover_big/co72ak.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (245899,'I''ll Kill Her','//images.igdb.com/igdb/image/upload/t_cover_big/co6ot0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (211794,'Don''t Stop You''ll Die','//images.igdb.com/igdb/image/upload/t_cover_big/co5gz9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (183970,'I''ll respond to that later','//images.igdb.com/igdb/image/upload/t_cover_big/co6m21.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (170580,'Sounds of Her Love: We''ll always be together','//images.igdb.com/igdb/image/upload/t_cover_big/co78jr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (232404,'O-o-o','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (185838,'O o o','//images.igdb.com/igdb/image/upload/t_cover_big/co4arw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (148100,'O---O','//images.igdb.com/igdb/image/upload/t_cover_big/co5anb.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (209770,'(O_O)','//images.igdb.com/igdb/image/upload/t_cover_big/co4zji.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (180008,'Fears of Glasses O-O','//images.igdb.com/igdb/image/upload/t_cover_big/co47tg.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (163702,'Vampiromania: O Game','//images.igdb.com/igdb/image/upload/t_cover_big/co3jmt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3157,'World of Warcraft: Warlords of Draenor','//images.igdb.com/igdb/image/upload/t_cover_big/co1xw7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (228,'World of Warcraft: Wrath of the Lich King','//images.igdb.com/igdb/image/upload/t_cover_big/co1xv9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (111650,'Warcraft III: Reforged','//images.igdb.com/igdb/image/upload/t_cover_big/co1rrv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (75380,'World of Warcraft: Battle for Azeroth','//images.igdb.com/igdb/image/upload/t_cover_big/co1xvy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (131961,'Clubhouse Games: 51 Worldwide Classics','//images.igdb.com/igdb/image/upload/t_cover_big/co21vp.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (156805,'Li Li Nuo De Qi Huan Zhi Lu','//images.igdb.com/igdb/image/upload/t_cover_big/co5ixh.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (39769,'Area 51','//images.igdb.com/igdb/image/upload/t_cover_big/co3c9i.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (21088,'Planet 51: The Game','//images.igdb.com/igdb/image/upload/t_cover_big/co2dec.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (5729,'Area 51','//images.igdb.com/igdb/image/upload/t_cover_big/co4egt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (259318,'Planet 51: The Game','//images.igdb.com/igdb/image/upload/t_cover_big/co6v4m.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (184186,'51 Baffes','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (120982,'Storm Area 51: The Game','//images.igdb.com/igdb/image/upload/t_cover_big/co424r.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (259317,'Planet 51: The Game','//images.igdb.com/igdb/image/upload/t_cover_big/co6v4l.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (143614,'The Legend of Zelda: Skyward Sword HD','//images.igdb.com/igdb/image/upload/t_cover_big/co3p3a.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (54440,'The Enchanted Kingdom: Elisa''s Adventure','//images.igdb.com/igdb/image/upload/t_cover_big/rs9y1ywklb7uqtxs6bet.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (28582,'Marble Duel','//images.igdb.com/igdb/image/upload/t_cover_big/co3nod.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (194534,'Koi wa Sotto Saku Hana no you ni: Futari wa Eien ni Yorisotte Iku','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (178396,'BS Fire Emblem: Archanea Senki-hen - Dai-4-wa: Hajimari no Toki','//images.igdb.com/igdb/image/upload/t_cover_big/co47l5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (153664,'Ai wa, Nikushimi ni Yoku Niteiru Nikushimi wa, Ai ni Yoku Niteiru','//images.igdb.com/igdb/image/upload/t_cover_big/co3bz7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (112507,'Sou, Atashi-tachi wa Konna ni mo Rifujin na Sekai ni Ikiteiru no dara yo 3 * Kono Sekai de 2 no Hatsubai Yotei wa Arimasen.','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (237215,'Fears of Glasses o-o World War','//images.igdb.com/igdb/image/upload/t_cover_big/co7gwl.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (181573,'World Soccer Jikkyou Winning Eleven 3: World Cup France ''98','//images.igdb.com/igdb/image/upload/t_cover_big/co48m8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (62214,'Thor: The Dark World - The Official Game','//images.igdb.com/igdb/image/upload/t_cover_big/co7rlc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (23834,'O.R.B.: Off-World Resource Base','//images.igdb.com/igdb/image/upload/t_cover_big/co3qnx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (144507,'James Bond 007: The World Is Not Enough','//images.igdb.com/igdb/image/upload/t_cover_big/co5xsr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (31553,'Our World is Ended','//images.igdb.com/igdb/image/upload/t_cover_big/co22tf.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (21235,'Soul Nomad & the World Eaters','//images.igdb.com/igdb/image/upload/t_cover_big/co4a0p.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (201228,'YU-NO: A Girl Who Chants Love at the Bound of This World','//images.igdb.com/igdb/image/upload/t_cover_big/co4r34.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (1641,'James Bond 007: The World Is Not Enough','//images.igdb.com/igdb/image/upload/t_cover_big/co5xsq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7239,'W. L. O. Sekai Renai Kikou','//images.igdb.com/igdb/image/upload/t_cover_big/ryycehjwlckdoqtfytw2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (9391,'WWII: Battle Over the Pacific','//images.igdb.com/igdb/image/upload/t_cover_big/co72hd.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (10605,'Garou: Mark of the Wolves','//images.igdb.com/igdb/image/upload/t_cover_big/co2eya.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (242408,'Counter-Strike 2','//images.igdb.com/igdb/image/upload/t_cover_big/co7989.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (16957,'Counter-Strike Nexon: Studio','//images.igdb.com/igdb/image/upload/t_cover_big/co6v9o.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (152291,'Counter Attack','//images.igdb.com/igdb/image/upload/t_cover_big/co39sk.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (132332,'Minnade Counter Fight','//images.igdb.com/igdb/image/upload/t_cover_big/co2qpc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (172146,'Counter Fight Ichiran','//images.igdb.com/igdb/image/upload/t_cover_big/co63l8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (76823,'Counter-Strike Online 2','//images.igdb.com/igdb/image/upload/t_cover_big/co79u2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (213165,'My Fantastic Ranch','//images.igdb.com/igdb/image/upload/t_cover_big/co52p9.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (191956,'My Little Pony: A Maretime Bay Adventure','//images.igdb.com/igdb/image/upload/t_cover_big/co4k35.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (52598,'My Aquarium','//images.igdb.com/igdb/image/upload/t_cover_big/co2qrd.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (164776,'Minecraft Dungeons: Ultimate Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co3kdi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (118499,'Minecraft Starter Collection','//images.igdb.com/igdb/image/upload/t_cover_big/co285s.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (104051,'Brain 43°C','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (249957,'Starship 43','//images.igdb.com/igdb/image/upload/t_cover_big/co6hyc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (167950,'Panzer Corps: U.S. Corps ''43','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (111317,'Panzer Campaigns: Mius ''43','//images.igdb.com/igdb/image/upload/t_cover_big/co4xak.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (205716,'Panzer Campaigns: Kiev ''43','//images.igdb.com/igdb/image/upload/t_cover_big/co4w2k.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (109182,'Panzer Campaign VII: Kursk ''43','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (65670,'B B-Daman Bakugaiden: Victory he no Michi','//images.igdb.com/igdb/image/upload/t_cover_big/co5v6d.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (148845,'B-Project: Ryuusei Fantasia','//images.igdb.com/igdb/image/upload/t_cover_big/co3gm6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (65671,'B B-Daman Bakugaiden V: Final Mega Tune','//images.igdb.com/igdb/image/upload/t_cover_big/cgrknjtswxwneid3e7c0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (90629,'b','//images.igdb.com/igdb/image/upload/t_cover_big/co3ltn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (155681,'B 2','//images.igdb.com/igdb/image/upload/t_cover_big/co45ul.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (49364,'Battle B-Daman: Fire Spirits!','//images.igdb.com/igdb/image/upload/t_cover_big/co5p6o.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (132654,'Kaizo Mario World','//images.igdb.com/igdb/image/upload/t_cover_big/co2mqu.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (85842,'Rollercoaster World','//images.igdb.com/igdb/image/upload/t_cover_big/co5y3m.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (11816,'Yu-No: A Girl Who Chants Love at the Bound of this World','//images.igdb.com/igdb/image/upload/t_cover_big/co234m.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (185459,'Serenity Ov Ball','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (121310,'Operation Valor','//images.igdb.com/igdb/image/upload/t_cover_big/co5zgn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (18518,'The Count','//images.igdb.com/igdb/image/upload/t_cover_big/ljtbloitjiqsvqcjk6mn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (118570,'ACA Neo Geo: 3 Count Bout','//images.igdb.com/igdb/image/upload/t_cover_big/co28sz.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (269795,'I Love My Follower (Count)','//images.igdb.com/igdb/image/upload/t_cover_big/co77cp.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (71580,'Scott Adams'' Graphic Adventure #5: The Count','//images.igdb.com/igdb/image/upload/t_cover_big/ynf9konhbqjmphbsruhn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (131110,'Count Down','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (273366,'Body Count','//images.igdb.com/igdb/image/upload/t_cover_big/co79uv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (243836,'Mine','//images.igdb.com/igdb/image/upload/t_cover_big/co6c37.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (246765,'Mine','//images.igdb.com/igdb/image/upload/t_cover_big/co7hxq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (176611,'M.I.N.E.','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (59257,'Mine!','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (98028,'Mine Nueeper Ninin ga Shinobuden','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (212089,'Lethal Company','//images.igdb.com/igdb/image/upload/t_cover_big/co5ive.jpg',0);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (219087,'Super Metroid: Less Linear Edition','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (261349,'Overwatch 2: Invasion Bundle','//images.igdb.com/igdb/image/upload/t_cover_big/co6y3e.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (261335,'Overwatch 2: Hero Collection','//images.igdb.com/igdb/image/upload/t_cover_big/co6y2d.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (261336,'Overwatch 2: Complete Hero Collection','//images.igdb.com/igdb/image/upload/t_cover_big/co7nne.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (228002,'Overwatch 2: Season 2 - Greek Mythology','//images.igdb.com/igdb/image/upload/t_cover_big/co5ufr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (252842,'Overwatch 2: Season 6 - Invasion','//images.igdb.com/igdb/image/upload/t_cover_big/co6x50.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (220932,'Overwatch 2: Season 1 - Cyberpunk','//images.igdb.com/igdb/image/upload/t_cover_big/co5k4a.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (125174,'Overwatch 2','//images.igdb.com/igdb/image/upload/t_cover_big/co6srp.jpg',0);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (18099,'Pokémon Moon','//images.igdb.com/igdb/image/upload/t_cover_big/co3co8.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (18100,'Pokémon Sun','//images.igdb.com/igdb/image/upload/t_cover_big/co3co7.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (188044,'Scarlet Nexus: Ultimate Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co4e0z.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (164589,'Scarlet Nexus: Deluxe Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co3k75.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (133302,'Scarlet Nexus','//images.igdb.com/igdb/image/upload/t_cover_big/co3b6l.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (119373,'SaGa: Scarlet Grace - Ambitions','//images.igdb.com/igdb/image/upload/t_cover_big/co49t0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (191931,'Pokémon Scarlet','//images.igdb.com/igdb/image/upload/t_cover_big/co5sfi.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (239935,'Pokémon Scarlet: The Hidden Treasure of Area Zero','//images.igdb.com/igdb/image/upload/t_cover_big/co67iv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (239931,'Pokémon Scarlet: The Hidden Treasure of Area Zero - Part 1: The Teal Mask','//images.igdb.com/igdb/image/upload/t_cover_big/co6ldp.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (239932,'Pokémon Scarlet: The Hidden Treasure of Area Zero - Part 2: The Indigo Disk','//images.igdb.com/igdb/image/upload/t_cover_big/co6ld2.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (3887,'Disney''s PK: Out of the Shadows','//images.igdb.com/igdb/image/upload/t_cover_big/co1w1m.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (130475,'PK XD','//images.igdb.com/igdb/image/upload/t_cover_big/co6hc3.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (231711,'PK Girls','//images.igdb.com/igdb/image/upload/t_cover_big/co622g.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (93521,'PK Scramble','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (828,'Painkiller','//images.igdb.com/igdb/image/upload/t_cover_big/co2b98.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (198265,'PUBG: Battlegrounds - Season 17','//images.igdb.com/igdb/image/upload/t_cover_big/co4orr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (222786,'PUBG: Battlegrounds - Season 20','//images.igdb.com/igdb/image/upload/t_cover_big/co5ow0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (222785,'PUBG: Battlegrounds - Season 19','//images.igdb.com/igdb/image/upload/t_cover_big/co5ovy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (198264,'PUBG: Battlegrounds - Season 16','//images.igdb.com/igdb/image/upload/t_cover_big/co4orn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (217520,'PUBG: Battlegrounds - Season 18','//images.igdb.com/igdb/image/upload/t_cover_big/co5ovq.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (222105,'Gun Gun Pixies H H','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (121766,'Moero Crystal H','//images.igdb.com/igdb/image/upload/t_cover_big/co29mm.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (100434,'After-H','//images.igdb.com/igdb/image/upload/t_cover_big/co3xwv.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (264072,'Sleep: H Now','//images.igdb.com/igdb/image/upload/t_cover_big/co70dz.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (173992,'H-Sniper: World War II','//images.igdb.com/igdb/image/upload/t_cover_big/co5gql.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (194633,'Maid in Witch Life!: Yakata de Hajimaru H na Miryou Seikatsu','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (15465,'VA-11 Hall-A: Cyberpunk Bartender Action','//images.igdb.com/igdb/image/upload/t_cover_big/co2z8k.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (130622,'VA-11 Hall-A Kids','//images.igdb.com/igdb/image/upload/t_cover_big/co25ze.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (207718,'V.A Proxy','//images.igdb.com/igdb/image/upload/t_cover_big/co5hyx.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (182421,'Le mur de Berlin va sauter','//images.igdb.com/igdb/image/upload/t_cover_big/co49h5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (150013,'Wizardry Variants Daphne','//images.igdb.com/igdb/image/upload/t_cover_big/co5p20.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (7821,'Chalvo 55: Super Puzzle Action','//images.igdb.com/igdb/image/upload/t_cover_big/lwx1tljoqognkqjjczih.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (226095,'5.5 Rooms','//images.igdb.com/igdb/image/upload/t_cover_big/co7ghw.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (244169,'Planeta 55','//images.igdb.com/igdb/image/upload/t_cover_big/co6cqr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (273719,'StairCase 55','//images.igdb.com/igdb/image/upload/t_cover_big/co7a6o.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (228259,'Feng Se Lv Ren','//images.igdb.com/igdb/image/upload/t_cover_big/co5vk0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (275138,'Lilim Wants to Lv Up','//images.igdb.com/igdb/image/upload/t_cover_big/co7bim.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (286595,'Hiden Inyou Kikouhou: Ca Da','//images.igdb.com/igdb/image/upload/t_cover_big/co7r5z.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (247001,'41-in-1','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (137294,'The Sims 4: Journey to Batuu','//images.igdb.com/igdb/image/upload/t_cover_big/co2fro.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (139679,'41 Hours','//images.igdb.com/igdb/image/upload/t_cover_big/co2jxo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (63105,'4 Pics 1 Word','//images.igdb.com/igdb/image/upload/t_cover_big/co7jvn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (125140,'Outpost 41','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (75675,'The Sims 4: Cats & Dogs','//images.igdb.com/igdb/image/upload/t_cover_big/co1zpt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (125511,'Operator 41','//images.igdb.com/igdb/image/upload/t_cover_big/co4k4z.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (16784,'You Don''t Know Jack vol. 4 The Ride','//images.igdb.com/igdb/image/upload/t_cover_big/co3l64.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (186380,'Office No. 41','//images.igdb.com/igdb/image/upload/t_cover_big/co4bk6.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (142822,'Panzer Campaigns: Moscow''41','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (208894,'4:32','//images.igdb.com/igdb/image/upload/t_cover_big/co4yxt.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (106813,'SA-Anarchy','//images.igdb.com/igdb/image/upload/t_cover_big/l6t6biffo4k51eesrwil.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (276896,'Chicocos S.A.','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (396,'The Final Fantasy Legend','//images.igdb.com/igdb/image/upload/t_cover_big/co2rle.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (277079,'SA-1: Special Adventure - 1','//images.igdb.com/igdb/image/upload/t_cover_big/co7dqo.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (268488,'Naoko to Hide-bou: Sansuu no Tensai 1: Wa to Sa no Bunshoudai Tsurukamezan Part I','//images.igdb.com/igdb/image/upload/t_cover_big/co74yc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (29958,'Ze VR','//images.igdb.com/igdb/image/upload/t_cover_big/co4gzy.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (183172,'Ze Field','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (69149,'THE Robot Tsukurou Ze!','//images.igdb.com/igdb/image/upload/t_cover_big/vxn9pfnclwvsy8rl0owa.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (125558,'Titeuf: Ze Gag Machine','//images.igdb.com/igdb/image/upload/t_cover_big/co5592.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (228934,'Ueki no Housoku: Taosu ze Robert Juudan!!','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (82103,'2 jeux en 1 I Titeuf: Ze Gag Machine + Titeuf: Méga-Compet''','//images.igdb.com/igdb/image/upload/t_cover_big/dkjlsl9kahj4dfiw6rct.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (152361,'Game & Watch: The Legend of Zelda','//images.igdb.com/igdb/image/upload/t_cover_big/co39zz.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (136280,'Classic NES Series: Zelda II - The Adventure of Link','//images.igdb.com/igdb/image/upload/t_cover_big/co4kyc.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (134014,'The Legend of Zelda: Twilight Princess','//images.igdb.com/igdb/image/upload/t_cover_big/co3w1h.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (163572,'The Legend of Zelda: Four Swords','//images.igdb.com/igdb/image/upload/t_cover_big/co5w9w.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (256282,'The Legend of Zelda: Tears of the Kingdom Randomizer','//images.igdb.com/igdb/image/upload/t_cover_big/co6qc0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (237289,'The Legend of Zelda: Tears of the Kingdom - Collector''s Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co656x.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (278046,'Super Smash Bros. Ultimate: Tears of the Kingdom Link','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (252906,'The Legend of Zelda: Tears of the Kingdom - Better Sages Mod','//images.igdb.com/igdb/image/upload/t_cover_big/co6mu5.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (179238,'Satella-Q: Cho-Q! Henka-Q!','//images.igdb.com/igdb/image/upload/t_cover_big/co4ayr.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (179246,'Satella-Q: Shin Q Omedetou Pika-pika no Q Ninsei','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (179237,'Satella-Q: Kokumin no Q-jitsu','//images.igdb.com/igdb/image/upload/t_cover_big/co483x.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (179244,'Satella-Q: Q-1 Grand Prix Manatsu no Revenge','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (179241,'Satella-Q: Sayonara Heisei Q-nen Nenmatsu Soukessan!','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (179243,'Satella-Q: Mou Sugu Haru desu ne - Chotto Sate-Q Shimasen ka?','/images/no_cover_image.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (133945,'World War Z: Game of the Year Edition','//images.igdb.com/igdb/image/upload/t_cover_big/co265e.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (175684,'World War Armies','//images.igdb.com/igdb/image/upload/t_cover_big/co4yq0.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (2533,'World War II GI','//images.igdb.com/igdb/image/upload/t_cover_big/co3vqn.jpg',null);
Insert into SCOTT.CATEGORY (CATEGORY_ID,CATEGORY_NAME,CATEGORY_IMAGE_URL,CATEGORY_TOTAL_VIEW) values (90521,'Front Wars: World War II','/images/no_cover_image.jpg',null);
REM INSERTING into SCOTT.CHANNELS
SET DEFINE OFF;
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (22,5,'gujguygu','hgcvuygyu',to_timestamp('24/02/01 15:19:57.946000000','RR/MM/DD HH24:MI:SSXFF'),'/images/default.png',123,3);
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (23,8,'영원히 방송할 예정','날죽여그냥',to_timestamp('24/02/01 15:20:44.353000000','RR/MM/DD HH24:MI:SSXFF'),'/images/default.png',125174,0);
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (24,9,'test','test',to_timestamp('24/02/01 15:20:45.228000000','RR/MM/DD HH24:MI:SSXFF'),'/images/default.png',115,0);
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (25,10,'내가방송해봄','ㅁㅁㅇㄴㅇ',to_timestamp('24/02/01 15:20:46.447000000','RR/MM/DD HH24:MI:SSXFF'),'/images/default.png',100000000,0);
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (26,21,'ㅎㅇ','ㅎㅇ',to_timestamp('24/02/01 15:20:47.135000000','RR/MM/DD HH24:MI:SSXFF'),'/images/default.png',212089,0);
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (1,68,'test235''s Channel','Welcome to your new channel!',to_timestamp('24/02/13 18:26:35.358446000','RR/MM/DD HH24:MI:SSXFF'),'default_profile.png',115,0);
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (28,23,'test','test',to_timestamp('24/02/01 15:20:48.494000000','RR/MM/DD HH24:MI:SSXFF'),'/images/default.png',100000000,20);
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (3,70,'test357''s Channel','Welcome to your new channel!',to_timestamp('24/02/13 18:41:05.147529000','RR/MM/DD HH24:MI:SSXFF'),'default_profile.png',115,0);
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (27,97,'dasdas''s Channel','Welcome to your new channel!',to_timestamp('24/02/14 16:04:41.953446000','RR/MM/DD HH24:MI:SSXFF'),'default_profile.png',115,0);
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (29,99,'aaa''s Channel','Welcome to your new channel!',to_timestamp('24/02/15 11:21:57.197617000','RR/MM/DD HH24:MI:SSXFF'),'default_profile.png',115,0);
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (31,101,'방송중','방송중',to_timestamp('24/02/15 16:13:51.815532000','RR/MM/DD HH24:MI:SSXFF'),'default_profile.png',121,0);
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (64,64,'test','test',to_timestamp('24/02/01 15:20:44.353000000','RR/MM/DD HH24:MI:SSXFF'),'/images/default.png',115,0);
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (42,22,'mk1','mk1',to_timestamp('24/02/02 16:59:30.664500000','RR/MM/DD HH24:MI:SSXFF'),'/images/default.png',212089,0);
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (30,100,'b''s Channel','Welcome to your new channel!',to_timestamp('24/02/15 11:23:21.762206000','RR/MM/DD HH24:MI:SSXFF'),'default_profile.png',115,0);
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (32,102,'2100년 방송 종료','555',to_timestamp('24/02/15 16:15:02.593035000','RR/MM/DD HH24:MI:SSXFF'),'default_profile.png',242408,0);
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (33,103,'노방종3000시간테스트','사람은죽지않아',to_timestamp('24/02/16 13:31:21.660566000','RR/MM/DD HH24:MI:SSXFF'),'default_profile.png',121,0);
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (2,6,'sdf','sdf',to_timestamp('24/01/31 14:34:09.286000000','RR/MM/DD HH24:MI:SSXFF'),'/images/default.png',100000000,2);
Insert into SCOTT.CHANNELS (CHANNEL_ID,CHANNEL_USER_ACCOUNT,CHANNEL_TITLE,CHANNEL_CONTENT,CHANNEL_CREATED_TIME,CHANNEL_PROFILE_IMG,CATEGORY_OF_CHANNEL,CHANNEL_VIEWER_COUNT) values (21,83,'msd''s Channel','Welcome to your new channel!',to_timestamp('24/02/14 14:18:08.121259000','RR/MM/DD HH24:MI:SSXFF'),'default_profile.png',115,0);
REM INSERTING into SCOTT.CHAT
SET DEFINE OFF;
REM INSERTING into SCOTT.CHAT_STATE
SET DEFINE OFF;
Insert into SCOTT.CHAT_STATE (CHANNEL_ID,CHAT_STATE_SET) values (25,'FOLLOW');
Insert into SCOTT.CHAT_STATE (CHANNEL_ID,CHAT_STATE_SET) values (23,'DEFAULT');
Insert into SCOTT.CHAT_STATE (CHANNEL_ID,CHAT_STATE_SET) values (24,'DEFAULT');
Insert into SCOTT.CHAT_STATE (CHANNEL_ID,CHAT_STATE_SET) values (26,'DEFAULT');
Insert into SCOTT.CHAT_STATE (CHANNEL_ID,CHAT_STATE_SET) values (3,'DEFAULT');
Insert into SCOTT.CHAT_STATE (CHANNEL_ID,CHAT_STATE_SET) values (1,'DEFAULT');
Insert into SCOTT.CHAT_STATE (CHANNEL_ID,CHAT_STATE_SET) values (28,'DEFAULT');
Insert into SCOTT.CHAT_STATE (CHANNEL_ID,CHAT_STATE_SET) values (27,'DEFAULT');
Insert into SCOTT.CHAT_STATE (CHANNEL_ID,CHAT_STATE_SET) values (29,'DEFAULT');
Insert into SCOTT.CHAT_STATE (CHANNEL_ID,CHAT_STATE_SET) values (31,'DEFAULT');
Insert into SCOTT.CHAT_STATE (CHANNEL_ID,CHAT_STATE_SET) values (64,'DEFAULT');
Insert into SCOTT.CHAT_STATE (CHANNEL_ID,CHAT_STATE_SET) values (42,'DEFAULT');
Insert into SCOTT.CHAT_STATE (CHANNEL_ID,CHAT_STATE_SET) values (30,'DEFAULT');
Insert into SCOTT.CHAT_STATE (CHANNEL_ID,CHAT_STATE_SET) values (32,'DEFAULT');
Insert into SCOTT.CHAT_STATE (CHANNEL_ID,CHAT_STATE_SET) values (21,'DEFAULT');
Insert into SCOTT.CHAT_STATE (CHANNEL_ID,CHAT_STATE_SET) values (22,'ANONYMOUS');
Insert into SCOTT.CHAT_STATE (CHANNEL_ID,CHAT_STATE_SET) values (2,'DEFAULT');
REM INSERTING into SCOTT.FOLLOWS
SET DEFINE OFF;
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (227,9,23,to_timestamp('24/02/16 18:14:46.919555000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (226,22,103,to_timestamp('24/02/16 17:45:11.919544000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (170,23,6,to_timestamp('24/02/14 14:50:47.052000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (196,6,22,to_timestamp('24/02/15 14:57:07.933573000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (171,66,6,to_timestamp('24/02/14 14:50:48.459000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (172,83,6,to_timestamp('24/02/14 14:50:49.775000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (223,22,5,to_timestamp('24/02/16 17:44:51.555047000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (218,10,22,to_timestamp('24/02/16 17:00:39.754274000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (225,22,6,to_timestamp('24/02/16 17:45:06.994402000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (192,22,9,to_timestamp('24/02/15 13:52:17.713451000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (117,6,5,to_timestamp('24/02/05 17:29:51.253720000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (15,5,21,null);
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (208,22,23,to_timestamp('24/02/16 10:46:30.408121000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (217,10,23,to_timestamp('24/02/16 17:00:14.390054000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (224,22,102,to_timestamp('24/02/16 17:44:58.351443000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (184,21,23,to_timestamp('24/02/15 11:56:45.903613000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (141,22,21,to_timestamp('24/02/13 16:14:10.049853000','RR/MM/DD HH24:MI:SSXFF'));
Insert into SCOTT.FOLLOWS (FOLLOW_ID,FOLLOWER_USER_ID,FOLLOWING_USER_ID,CREATED_TIME) values (216,9,6,to_timestamp('24/02/16 16:28:26.094699000','RR/MM/DD HH24:MI:SSXFF'));
REM INSERTING into SCOTT.STREAMING_STATE
SET DEFINE OFF;
Insert into SCOTT.STREAMING_STATE (CHANNEL_ID,STREAMING_STATE_SET) values (32,'ON');
Insert into SCOTT.STREAMING_STATE (CHANNEL_ID,STREAMING_STATE_SET) values (25,'ON');
Insert into SCOTT.STREAMING_STATE (CHANNEL_ID,STREAMING_STATE_SET) values (28,'ON');
Insert into SCOTT.STREAMING_STATE (CHANNEL_ID,STREAMING_STATE_SET) values (23,'ON');
Insert into SCOTT.STREAMING_STATE (CHANNEL_ID,STREAMING_STATE_SET) values (26,'ON');
Insert into SCOTT.STREAMING_STATE (CHANNEL_ID,STREAMING_STATE_SET) values (33,'ON');
Insert into SCOTT.STREAMING_STATE (CHANNEL_ID,STREAMING_STATE_SET) values (31,'ON');
Insert into SCOTT.STREAMING_STATE (CHANNEL_ID,STREAMING_STATE_SET) values (42,'ON');
Insert into SCOTT.STREAMING_STATE (CHANNEL_ID,STREAMING_STATE_SET) values (22,'ON');
Insert into SCOTT.STREAMING_STATE (CHANNEL_ID,STREAMING_STATE_SET) values (2,'ON');
Insert into SCOTT.STREAMING_STATE (CHANNEL_ID,STREAMING_STATE_SET) values (24,'OFF');
REM INSERTING into SCOTT.USER_ACCOUNTS
SET DEFINE OFF;
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (23,'abc','$2a$10$a0kEnXhkjL1XGSIsj1PJX.XZLpEdIl37zHXewJXUsQvqlyyvUn3Pu','민트초코',to_timestamp('24/01/31 14:21:34.320000000','RR/MM/DD HH24:MI:SSXFF'),'user1234@itwill.com',null,'default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (5,'admin','$2a$10$p5fB4LGy1IS1GlbyPRlGNebsS1z3Wp.GcjiGOt9aK4TiDDJIcorx2','이재용',to_timestamp('24/01/29 14:43:49.034000000','RR/MM/DD HH24:MI:SSXFF'),null,null,'default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (6,'user1','$2a$10$jnrrIJERRKjU1.WEzCGdV.v4onN3BucztVHehs7n/dUgsG7PntDw6','woowakgood',to_timestamp('24/01/29 14:55:23.753000000','RR/MM/DD HH24:MI:SSXFF'),'dlvlfdn567@gmail.com','e75d63ac-0015-4e71-983c-626e241c487d','C:\uploads\user1.png','sdffwefawd',1);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (66,'test234','$2a$10$CTOvkOI8d64eIwihQRH3Uu4hm3v4zr8X7vm/HgPvVJ8sCJFS2Cp3y','test234',to_timestamp('24/02/13 18:12:00.774000000','RR/MM/DD HH24:MI:SSXFF'),'test234@itwill.com','e3efc720-d1dc-449c-a0ee-74c225399d95','default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (8,'dlvlfdn567','$2a$10$xwFdQ.4Kokz2GVFBsVNZq.mJWjhF9BldG627d0xw/P6I5wKZn20M.','1234',to_timestamp('24/01/29 16:40:53.051000000','RR/MM/DD HH24:MI:SSXFF'),'dlvlfdn111@itwill.com','61869921-b94a-4a95-98fa-a638e5d12af8','default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (68,'test235','$2a$10$2y8Rvmxed6/q5nJYxNPmNeGsOvE.RZ.8SG2gcgDRTSBHn3XES.XLO','test235',to_timestamp('24/02/13 18:26:35.869000000','RR/MM/DD HH24:MI:SSXFF'),'test235@itwill.com','d767e72e-def3-4de3-a8cf-61f5e694ab07','default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (69,'test356','$2a$10$gEjlKufIirlunLiKmW8Gzu2g/Z6IrUKfwMStPfM4SqB2T23Mo/XxW','test356',to_timestamp('24/02/13 18:38:05.022000000','RR/MM/DD HH24:MI:SSXFF'),'test356@itwill.com','cc63d57a-6289-48c3-98a5-7e3941e08056','default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (70,'test357','$2a$10$ICSXO2mNq06v7H42RpFsBujjxOJ3IBW8ZzWEubEVl2Ih6Y3tdfvcO','test357',to_timestamp('24/02/13 18:41:05.647000000','RR/MM/DD HH24:MI:SSXFF'),'test357@itwill.com','70349f5f-13d1-4143-9241-a60e4a482cdb','default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (88,'test123456','$2a$10$CeSqgfSZNGPJkS.BD9n2N.78DYg7mK8UuHZR2WCKwTR90Y84sNPTa','오라클코라클',to_timestamp('24/02/14 15:34:00.336000000','RR/MM/DD HH24:MI:SSXFF'),'koko@itwill.com','51ac7c14-82c8-46bf-b617-25137e1d46bd','default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (84,'mk11','$2a$10$cOUl4QXhYF6TyxZvBN/njuAWTwGG13vBkYNE3SQnwsJF3Y41s4mgO','asd',to_timestamp('24/02/14 15:16:59.342000000','RR/MM/DD HH24:MI:SSXFF'),'asd@asd.com','be4b3838-93c3-49fb-9ad5-89098c81b336','default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (85,'asdasd','$2a$10$PEyGlM0qKZE49gVC8sxN1eKs1TpS0rbX7XFNZWuUUIFXRuzINC91i','asd',to_timestamp('24/02/14 15:20:13.908000000','RR/MM/DD HH24:MI:SSXFF'),'asd@asd.com','3d40a40e-0b24-44e7-b3ec-2a599d74ecdc','default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (86,'aaaaa','$2a$10$tXHphgcNo3/dv0e4wu0aiekVLQT9Xg5/ca7RHwyobsQtaiz7Fqm3a','asd',to_timestamp('24/02/14 15:22:34.391000000','RR/MM/DD HH24:MI:SSXFF'),'asd@asd.com','f24bbeaa-6e18-4b75-82ea-a4aa651145c1','default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (9,'user2','$2a$10$zqIBBvX9zs7ZzylC6F.rq.VyApUiUCbONxIbEj6.bADrq.osvx26y','gosegu',to_timestamp('24/01/30 11:10:55.449000000','RR/MM/DD HH24:MI:SSXFF'),'aaaa@aaaa',null,'default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (61,'test123','$2a$10$ci4lepEeQ0eoV.7ajegNt.mm0jkNaY1oAneESVZJ6wBXcYjlrbdKK','test123',to_timestamp('24/02/13 17:31:45.824000000','RR/MM/DD HH24:MI:SSXFF'),'test123@itwill.com','83d22aba-d5d0-408e-a955-2e1cb2d8fd86','default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (63,'test1234','$2a$10$Az3jS/w5M1k3b5uIgptaCO9318qMMoMTHbreJq.gQZL9MbPmU2U3O','test1234',to_timestamp('24/02/13 17:34:01.289000000','RR/MM/DD HH24:MI:SSXFF'),'test1234@itwill.com','f7688d8a-fbd2-4a09-8d58-c750d4180cef','default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (64,'test125','$2a$10$MUNwhxV9LwafiCl4JHuCTuJRx9IQmfcwPP/iguhw45x0qW.b.Pq7K','test125',to_timestamp('24/02/13 17:35:52.966000000','RR/MM/DD HH24:MI:SSXFF'),'test125@itwill.com','9e8aa410-ca40-414f-a920-0865d5b60769','default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (97,'dasdas','$2a$10$5B.Mpc33PNjfuFULedAtIuERnO9TUvWrXmprx6ePF8FJVaOKtiq6y','1234',to_timestamp('24/02/14 16:04:42.358000000','RR/MM/DD HH24:MI:SSXFF'),'asd@asd.com','31f35307-fc4c-4a78-bc3a-7fc30ec6e082','default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (98,'aa','$2a$10$I4dIsKGAh3L4uDF0kCbeL.oXkzLmgqO.FU.OXQ.qkR0IJZPsl3yJW','aa',to_timestamp('24/02/14 16:11:33.899000000','RR/MM/DD HH24:MI:SSXFF'),'aa@abc.com','798bde38-5adc-46f3-92ca-ab5109bda0f4','default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (99,'aaa','$2a$10$MGHtQlw9pXs0uiZpwao4veQL6NVqM8Co59qBg1YDaOWwv4BEqpB8a',null,to_timestamp('24/02/15 11:21:58.008000000','RR/MM/DD HH24:MI:SSXFF'),null,'0595457f-5f85-4f72-be4e-a0008291aa40',null,null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (101,'mkmk1','$2a$10$iKH4ZVZ/MJZWzReMajqbmO7T1RmMclmodmOnKdBjNGY3UH4Kksv7W','MKMK1',to_timestamp('24/02/15 16:13:53.134000000','RR/MM/DD HH24:MI:SSXFF'),'mkmk1@com.com','7cd79171-381b-4f43-b913-a5a414924482',null,null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (10,'a','$2a$10$J9xEKsdmO3fZuHyrdJV1iOcxq.k13wRZDyIAxtFL.v2icDAKc7z5C','창식이',to_timestamp('24/01/30 16:27:32.504000000','RR/MM/DD HH24:MI:SSXFF'),'user@itwill.com','ade062ef-a261-45d4-914a-1ae88dfddde8','default.img','안녕하세요',0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (65,'test126','$2a$10$HWSuhw5CsnV0h9WTkmlao.Kz9hdUZEbG5PiRdsD8ydbtB8S3QiFbW','test126',to_timestamp('24/02/13 17:46:56.951000000','RR/MM/DD HH24:MI:SSXFF'),'test126@gmail.com','f81d55bf-e9e4-4609-acf8-5c774f92e306','default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (100,'b','$2a$10$DSc2FZAdRA43BjJXBPeq7ey6X72aGFEyrZJD4oMUZ2AP8c01gLeaG',null,to_timestamp('24/02/15 11:23:22.574000000','RR/MM/DD HH24:MI:SSXFF'),null,'d6910222-3e89-42d6-ba50-bd2ec7519fe4',null,null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (102,'mk5','$2a$10$qzQ6xd9zwZsbI5fxSiqTAeLXIIQipmd9.PZU.ELfzxJ6JIi2oNaWu','안녕하세요',to_timestamp('24/02/15 16:15:04.120000000','RR/MM/DD HH24:MI:SSXFF'),'abc@abc.com','280da0b8-f81f-448c-a74f-dac526227d10',null,null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (103,'mkmk2','$2a$10$7G9fIqaWz3SVB333S06onurIQ.taxcrPPnQnvqvfLaZEMJ.mm/v3G','MKMK2',to_timestamp('24/02/16 13:31:20.016000000','RR/MM/DD HH24:MI:SSXFF'),'mkmk2@naver.com','ff0ab7ab-8c92-4585-abbd-0e05d06a81d7',null,null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (21,'mk2','$2a$10$0HnY4Vzy1AxCr87QaHspVO3LVcbWbfaME4BXSnVQA2/jbypI3NPT6','민규2',to_timestamp('24/01/31 09:52:23.067000000','RR/MM/DD HH24:MI:SSXFF'),'mk2@naver.com',null,'default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (22,'mk1','$2a$10$Qr25jkj8Np60eyh297ROTeoT4BUWPS3c614JMWxtpfnGgy4dH1FhW','mk1',to_timestamp('24/01/31 09:52:33.410000000','RR/MM/DD HH24:MI:SSXFF'),'mk1@naver.com',null,'default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (83,'msd','$2a$10$Iy387pEErm3x0fCCrX4KjOL0L9i924cV/TJmJyKSFwj4LRmKuWLD.','마석도',to_timestamp('24/02/14 14:18:08.004000000','RR/MM/DD HH24:MI:SSXFF'),'asd@asd.com','cd842fd6-83bb-4240-9153-16a4dbbb9901','default.img',null,0);
Insert into SCOTT.USER_ACCOUNTS (USER_ID,USER_NAME,USER_PASSWORD,USER_NICKNAME,JOIN_DATE,USER_EMAIL,USER_STREAMING_KEY,USER_PROFILE_IMAGE_URL,USER_SELF_INTRODUCTION,USER_EMAIL_VERIFIED) values (87,'mk4','$2a$10$jN/rOB6RimNewN5JzHptGeeXUkh1N7WQUbN6rcLa4nOOhXon733Qy','민규4',to_timestamp('24/02/14 15:32:38.841000000','RR/MM/DD HH24:MI:SSXFF'),'1234@na.com','462c12c2-7f46-4cc5-b7c5-bb8173ef756a','default.img',null,0);
REM INSERTING into SCOTT.USER_ROLES
SET DEFINE OFF;
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (5,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (6,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (7,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (8,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (23,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (66,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (68,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (69,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (70,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (88,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (84,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (85,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (86,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (9,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (61,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (63,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (64,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (97,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (98,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (99,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (101,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (10,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (65,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (100,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (102,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (103,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (21,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (22,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (83,'USER');
Insert into SCOTT.USER_ROLES (USER_ID,USER_ROLES) values (87,'USER');
REM INSERTING into SCOTT.VERIFICATION_TOKENS
SET DEFINE OFF;
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (21,'432f6ece-5fea-4b1f-b1f1-57a9636fb63a',10,to_date('24/02/17','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (8,'8dcea8cc-1fe3-4ce5-a243-8cdaf7aa5001',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (9,'69385de3-04cd-457b-bcbc-ff4de541a076',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (10,'a787fd9b-0617-4b86-b361-1e13f5ca1b34',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (11,'07ce6de1-ac74-449d-a279-b957c553337e',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (12,'72886246-7d61-4179-9774-315e7217aba1',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (13,'b410ddef-30b8-41d0-b54a-ac5713a543fd',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (14,'10e313e9-9989-4c6f-a967-0175236c9220',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (1,'185251b4-6f8b-4cf1-8577-961c5b0fd55f',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (2,'8b7ca021-d2b0-407d-87a3-b77d9446853f',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (3,'8abb07d2-4bed-49aa-b53f-05ea8cfefa85',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (4,'9407b5af-2415-419f-a20f-b46bb4c78561',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (5,'07d36f60-3548-42f9-af5d-be46b7b780f2',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (6,'ceb827b3-b5b4-4da6-93e2-6bfbb0252787',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (7,'76ea1ef0-769b-43c0-bf7c-1850de3d279d',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (15,'0ccfb1bd-dbff-4609-8345-a3c6f0d4f749',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (16,'bf571196-6ddc-4b39-9864-10c81bd0b6ac',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (17,'cfd70610-5eb0-41e5-aef4-8c6c693ab7c1',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (18,'945fe748-d545-4c66-8f1b-d1d0c08510d2',6,to_date('24/02/16','RR/MM/DD'));
Insert into SCOTT.VERIFICATION_TOKENS (VERIFI_TOKEN_ID,VERIFI_TOKEN_VALUE,VERIFI_TOKEN_USER_ACCOUNT,VERIFI_TOKEN_EXPIRY_DATE) values (19,'6fcba4bc-0146-45b5-940c-16dc83cd010a',6,to_date('24/02/16','RR/MM/DD'));
REM INSERTING into SCOTT.VIDEO
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index CATEGORY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."CATEGORY_PK" ON "SCOTT"."CATEGORY" ("CATEGORY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FOLLOW_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."FOLLOW_ID" ON "SCOTT"."FOLLOWS" ("FOLLOW_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008331
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C008331" ON "SCOTT"."VIDEO" ("VIDEO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008332
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C008332" ON "SCOTT"."CHAT" ("CHAT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008333
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C008333" ON "SCOTT"."CHANNELS" ("CHANNEL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008350
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C008350" ON "SCOTT"."USER_ACCOUNTS" ("USER_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 167 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008367
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C008367" ON "SCOTT"."VERIFICATION_TOKENS" ("VERIFI_TOKEN_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."USERS_PK" ON "SCOTT"."USER_ACCOUNTS" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CATEGORY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."CATEGORY_PK" ON "SCOTT"."CATEGORY" ("CATEGORY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008333
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C008333" ON "SCOTT"."CHANNELS" ("CHANNEL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008332
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C008332" ON "SCOTT"."CHAT" ("CHAT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FOLLOW_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."FOLLOW_ID" ON "SCOTT"."FOLLOWS" ("FOLLOW_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008350
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C008350" ON "SCOTT"."USER_ACCOUNTS" ("USER_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 167 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."USERS_PK" ON "SCOTT"."USER_ACCOUNTS" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008367
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C008367" ON "SCOTT"."VERIFICATION_TOKENS" ("VERIFI_TOKEN_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008331
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C008331" ON "SCOTT"."VIDEO" ("VIDEO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger CHANNELS_TRG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."CHANNELS_TRG" 
BEFORE INSERT ON CHANNELS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."CHANNELS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_CHANNEL_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."TRG_CHANNEL_ID" 
BEFORE INSERT ON channels
FOR EACH ROW
BEGIN
    :new.CHANNEL_ID := channel_id_seq.NEXTVAL;
END;
/
ALTER TRIGGER "SCOTT"."TRG_CHANNEL_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CHANNELS_TRG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."CHANNELS_TRG" 
BEFORE INSERT ON CHANNELS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SCOTT"."CHANNELS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_CHANNEL_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SCOTT"."TRG_CHANNEL_ID" 
BEFORE INSERT ON channels
FOR EACH ROW
BEGIN
    :new.CHANNEL_ID := channel_id_seq.NEXTVAL;
END;
/
ALTER TRIGGER "SCOTT"."TRG_CHANNEL_ID" ENABLE;
--------------------------------------------------------
--  Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "SCOTT"."CATEGORY" MODIFY ("CATEGORY_NAME" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."CATEGORY" MODIFY ("CATEGORY_ID" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."CATEGORY" ADD CONSTRAINT "CATEGORY_PK" PRIMARY KEY ("CATEGORY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CHANNELS
--------------------------------------------------------

  ALTER TABLE "SCOTT"."CHANNELS" ADD PRIMARY KEY ("CHANNEL_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SCOTT"."CHANNELS" MODIFY ("CHANNEL_USER_ACCOUNT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CHAT
--------------------------------------------------------

  ALTER TABLE "SCOTT"."CHAT" ADD PRIMARY KEY ("CHAT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FOLLOWS
--------------------------------------------------------

  ALTER TABLE "SCOTT"."FOLLOWS" MODIFY ("FOLLOW_ID" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."FOLLOWS" ADD CONSTRAINT "FOLLOW_ID" PRIMARY KEY ("FOLLOW_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USER_ACCOUNTS
--------------------------------------------------------

  ALTER TABLE "SCOTT"."USER_ACCOUNTS" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."USER_ACCOUNTS" ADD UNIQUE ("USER_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 167 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "SCOTT"."USER_ACCOUNTS" ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table VERIFICATION_TOKENS
--------------------------------------------------------

  ALTER TABLE "SCOTT"."VERIFICATION_TOKENS" MODIFY ("VERIFI_TOKEN_ID" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."VERIFICATION_TOKENS" MODIFY ("VERIFI_TOKEN_VALUE" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."VERIFICATION_TOKENS" MODIFY ("VERIFI_TOKEN_USER_ACCOUNT" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."VERIFICATION_TOKENS" MODIFY ("VERIFI_TOKEN_EXPIRY_DATE" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."VERIFICATION_TOKENS" ADD PRIMARY KEY ("VERIFI_TOKEN_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table VIDEO
--------------------------------------------------------

  ALTER TABLE "SCOTT"."VIDEO" ADD PRIMARY KEY ("VIDEO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FOLLOWS
--------------------------------------------------------

  ALTER TABLE "SCOTT"."FOLLOWS" ADD FOREIGN KEY ("FOLLOWER_USER_ID")
	  REFERENCES "SCOTT"."USER_ACCOUNTS" ("USER_ID") ENABLE;
  ALTER TABLE "SCOTT"."FOLLOWS" ADD FOREIGN KEY ("FOLLOWING_USER_ID")
	  REFERENCES "SCOTT"."USER_ACCOUNTS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table VERIFICATION_TOKENS
--------------------------------------------------------

  ALTER TABLE "SCOTT"."VERIFICATION_TOKENS" ADD CONSTRAINT "FK_VERIFI_TOKEN_USER_ACCOUNT" FOREIGN KEY ("VERIFI_TOKEN_USER_ACCOUNT")
	  REFERENCES "SCOTT"."USER_ACCOUNTS" ("USER_ID") ENABLE;
