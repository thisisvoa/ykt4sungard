--==============================================================
-- DBMS name:      IBM DB2 UDB 8.x Common Server
-- Created on:     2007-06-25 17:17:22
--==============================================================


alter table YKT_CK.DEPARTMENT
   drop primary key;

alter table YKT_CK.T_ATTSERIAL
   drop primary key;

alter table YKT_CK.T_ATTSERIAL_RECORD
   drop primary key;

alter table YKT_CK.T_CHECKATT_INFO
   drop primary key;

alter table YKT_CK.T_CHECKATT_REPORT
   drop primary key;

alter table YKT_CK.T_CLERKDEV_MAPPING
   drop primary key;

alter table YKT_CK.T_CLERKINFO
   drop primary key;

alter table YKT_CK.T_DEPT_WORKCONFINFO
   drop primary key;

alter table YKT_CK.T_LEAVEINFO
   drop primary key;

alter table YKT_CK.T_OPER_LIMIT
   drop primary key;

alter table YKT_CK.T_REPORTLEAVE
   drop primary key;

alter table YKT_CK.T_WORKCONFINFO
   drop primary key;

alter table YKT_CK.T_WORKTIMEINTO
   drop primary key;

drop table YKT_CK.DEPARTMENT;

drop table YKT_CK.T_ATTSERIAL;

drop table YKT_CK.T_ATTSERIAL_RECORD;

drop table YKT_CK.T_CHECKATT_INFO;

drop table YKT_CK.T_CHECKATT_REPORT;

drop table YKT_CK.T_CLERKDEV_MAPPING;

drop table YKT_CK.T_CLERKINFO;

drop table YKT_CK.T_DEPT_WORKCONFINFO;

drop table YKT_CK.T_LEAVEINFO;

drop table YKT_CK.T_OPER_LIMIT;

drop table YKT_CK.T_REPORTLEAVE;

drop table YKT_CK.T_WORKCONFINFO;

drop table YKT_CK.T_WORKTIMEINTO;

drop sequence "Sequence_1";

create sequence "Sequence_1"
increment by 1
start with 1;

--==============================================================
-- Table: DEPARTMENT
--==============================================================
create table YKT_CK.DEPARTMENT
(
   DEPT_ID              VARCHAR(32)            not null,
   DEPT_NAME            VARCHAR(300),
   DEPT_PARENTID        VARCHAR(32)
);

alter table YKT_CK.DEPARTMENT
   add constraint P_DEPARTMENT_KEY primary key (DEPT_ID);

--==============================================================
-- Table: T_ATTSERIAL
--==============================================================
create table YKT_CK.T_ATTSERIAL
(
   SERIAL_ID            INTEGER                not null,
   DEVICE_ID            INTEGER                not null,
   CUST_ID              INTEGER,
   CARD_ID              INTEGER,
   PHY_ID               VARCHAR(20),
   SHOW_CARDNO          VARCHAR(20),
   ATT_DATE             VARCHAR(8),
   ATT_TIME             VARCHAR(6),
   TX_MARK              INTEGER,
   STATUS               CHAR(1)
);

comment on table YKT_CK.T_ATTSERIAL is
'考勤流水表';

comment on column YKT_CK.T_ATTSERIAL.SERIAL_ID is
'流水号';

comment on column YKT_CK.T_ATTSERIAL.DEVICE_ID is
'设备编号';

comment on column YKT_CK.T_ATTSERIAL.CUST_ID is
'客户号';

comment on column YKT_CK.T_ATTSERIAL.CARD_ID is
'卡号';

comment on column YKT_CK.T_ATTSERIAL.PHY_ID is
'物理卡号';

comment on column YKT_CK.T_ATTSERIAL.SHOW_CARDNO is
'显示卡号';

comment on column YKT_CK.T_ATTSERIAL.ATT_DATE is
'打卡日期';

comment on column YKT_CK.T_ATTSERIAL.ATT_TIME is
'打卡时间';

comment on column YKT_CK.T_ATTSERIAL.TX_MARK is
'交易标记';

comment on column YKT_CK.T_ATTSERIAL.STATUS is
'状态';

alter table YKT_CK.T_ATTSERIAL
   add constraint "P_Key_1" primary key (SERIAL_ID, DEVICE_ID);

--==============================================================
-- Table: T_ATTSERIAL_RECORD
--==============================================================
create table YKT_CK.T_ATTSERIAL_RECORD
(
   SERIAL_ID            INTEGER                not null generated by default as identity,
   CUST_ID              INTEGER,
   CARD_ID              INTEGER,
   PHY_ID               VARCHAR(20),
   SHOW_CARDNO          VARCHAR(20),
   ATT_DATE             VARCHAR(8),
   ATT_TIME             VARCHAR(6),
   OPER_ID              VARCHAR(32),
   OPER_DATE            VARCHAR(8),
   OPER_TIME            VARCHAR(6),
   REMARK               VARCHAR(30)
);

comment on table YKT_CK.T_ATTSERIAL_RECORD is
'考勤流水表';

comment on column YKT_CK.T_ATTSERIAL_RECORD.SERIAL_ID is
'流水号';

comment on column YKT_CK.T_ATTSERIAL_RECORD.CUST_ID is
'客户号';

comment on column YKT_CK.T_ATTSERIAL_RECORD.CARD_ID is
'卡号';

comment on column YKT_CK.T_ATTSERIAL_RECORD.PHY_ID is
'物理卡号';

comment on column YKT_CK.T_ATTSERIAL_RECORD.SHOW_CARDNO is
'显示卡号';

comment on column YKT_CK.T_ATTSERIAL_RECORD.ATT_DATE is
'打卡日期';

comment on column YKT_CK.T_ATTSERIAL_RECORD.ATT_TIME is
'打卡时间';

comment on column YKT_CK.T_ATTSERIAL_RECORD.OPER_ID is
'操作员编号';

comment on column YKT_CK.T_ATTSERIAL_RECORD.OPER_DATE is
'操作日期';

comment on column YKT_CK.T_ATTSERIAL_RECORD.OPER_TIME is
'操作时间';

comment on column YKT_CK.T_ATTSERIAL_RECORD.REMARK is
'备注信息';

alter table YKT_CK.T_ATTSERIAL_RECORD
   add constraint "P_Key_1" primary key (SERIAL_ID);

--==============================================================
-- Table: T_CHECKATT_INFO
--==============================================================
create table YKT_CK.T_CHECKATT_INFO
(
   CUST_ID              INTEGER                not null,
   CHECK_DATE           VARCHAR(8)             not null,
   DEPT_ID              VARCHAR(32),
   IFOFFICE             CHAR,
   FACT_ONTIME          VARCHAR(6),
   FACT_OFFTIME         VARCHAR(6),
   FACT_ONTIME1         VARCHAR(6),
   FACT_OFFTIME1        VARCHAR(6),
   FACT_ONTIME2         VARCHAR(6),
   FACT_OFFTIME2        VARCHAR(6),
   FACT_ONTIME3         VARCHAR(6),
   FACT_OFFTIME3        VARCHAR(6),
   FACT_ONTIME4         VARCHAR(6),
   FACT_OFFTIME4        VARCHAR(6)
);

comment on table YKT_CK.T_CHECKATT_INFO is
'考勤人员出席情况表';

comment on column YKT_CK.T_CHECKATT_INFO.CUST_ID is
'客户号';

comment on column YKT_CK.T_CHECKATT_INFO.CHECK_DATE is
'日期';

comment on column YKT_CK.T_CHECKATT_INFO.DEPT_ID is
'部门编号';

comment on column YKT_CK.T_CHECKATT_INFO.IFOFFICE is
'是否坐班';

comment on column YKT_CK.T_CHECKATT_INFO.FACT_ONTIME is
'非坐班上班时间';

comment on column YKT_CK.T_CHECKATT_INFO.FACT_OFFTIME is
'非坐班下班时间';

comment on column YKT_CK.T_CHECKATT_INFO.FACT_ONTIME1 is
'实际上班时间一';

comment on column YKT_CK.T_CHECKATT_INFO.FACT_OFFTIME1 is
'实际下边时间一';

comment on column YKT_CK.T_CHECKATT_INFO.FACT_ONTIME2 is
'实际上班时间二';

comment on column YKT_CK.T_CHECKATT_INFO.FACT_OFFTIME2 is
'实际下班时间二';

comment on column YKT_CK.T_CHECKATT_INFO.FACT_ONTIME3 is
'实际上班时间三';

comment on column YKT_CK.T_CHECKATT_INFO.FACT_OFFTIME3 is
'实际下班时间三';

comment on column YKT_CK.T_CHECKATT_INFO.FACT_ONTIME4 is
'实际上班时间四';

comment on column YKT_CK.T_CHECKATT_INFO.FACT_OFFTIME4 is
'实际下班时间四';

alter table YKT_CK.T_CHECKATT_INFO
   add constraint "P_Key_1" primary key (CUST_ID, CHECK_DATE);

--==============================================================
-- Table: T_CHECKATT_REPORT
--==============================================================
create table YKT_CK.T_CHECKATT_REPORT
(
   CUST_ID              INTEGER                not null,
   CHECK_DATE           VARCHAR(8)             not null,
   DEPT_ID              VARCHAR(32),
   IFOFFICE             CHAR,
   WORKTIME_VALUE       INTEGER,
   FACT_VALUE           INTEGER,
   HAND_TIMES           INTEGER,
   OVERTIME_VALUE       INTEGER,
   TWOREST_VALUE        INTEGER,
   HOLIDAY_VALUE        INTEGER,
   DELAY_VALUE          INTEGER,
   LEAVE_EARLY          INTEGER,
   LEAVE_VALUE          INTEGER,
   LEAVE_TYPE           CHARACTER(1),
   LEAVE_TIME           INTEGER,
   EXT1                 INTEGER,
   EXT2                 INTEGER,
   EXT3                 INTEGER,
   EXT4                 INTEGER,
   EXT5                 INTEGER
);

comment on table YKT_CK.T_CHECKATT_REPORT is
'考勤人员出席情况统计表';

comment on column YKT_CK.T_CHECKATT_REPORT.CUST_ID is
'客户号';

comment on column YKT_CK.T_CHECKATT_REPORT.CHECK_DATE is
'日期';

comment on column YKT_CK.T_CHECKATT_REPORT.DEPT_ID is
'部门编号';

comment on column YKT_CK.T_CHECKATT_REPORT.IFOFFICE is
'是否坐班';

comment on column YKT_CK.T_CHECKATT_REPORT.WORKTIME_VALUE is
'应出工时（分钟）';

comment on column YKT_CK.T_CHECKATT_REPORT.FACT_VALUE is
'实出工时（分钟）';

comment on column YKT_CK.T_CHECKATT_REPORT.HAND_TIMES is
'手工打卡次数';

comment on column YKT_CK.T_CHECKATT_REPORT.OVERTIME_VALUE is
'加班时间（分钟）';

comment on column YKT_CK.T_CHECKATT_REPORT.TWOREST_VALUE is
'双休加班时间（分钟）';

comment on column YKT_CK.T_CHECKATT_REPORT.HOLIDAY_VALUE is
'节假加班时间（分钟）';

comment on column YKT_CK.T_CHECKATT_REPORT.DELAY_VALUE is
'迟到时间（分钟）';

comment on column YKT_CK.T_CHECKATT_REPORT.LEAVE_EARLY is
'早退时间（分钟）';

comment on column YKT_CK.T_CHECKATT_REPORT.LEAVE_VALUE is
'缺席时间（分钟）';

comment on column YKT_CK.T_CHECKATT_REPORT.LEAVE_TYPE is
'假期类型';

comment on column YKT_CK.T_CHECKATT_REPORT.LEAVE_TIME is
'假期时间（分钟）';

comment on column YKT_CK.T_CHECKATT_REPORT.EXT1 is
'扩展字段1';

comment on column YKT_CK.T_CHECKATT_REPORT.EXT2 is
'扩展字段2';

comment on column YKT_CK.T_CHECKATT_REPORT.EXT3 is
'扩展字段3';

comment on column YKT_CK.T_CHECKATT_REPORT.EXT4 is
'扩展字段4';

comment on column YKT_CK.T_CHECKATT_REPORT.EXT5 is
'扩展字段5';

alter table YKT_CK.T_CHECKATT_REPORT
   add constraint "P_Key_1" primary key (CUST_ID, CHECK_DATE);

--==============================================================
-- Table: T_CLERKDEV_MAPPING
--==============================================================
create table YKT_CK.T_CLERKDEV_MAPPING
(
   CUST_ID              INTEGER                not null,
   DEVICE_ID            INTEGER                not null
);

comment on table YKT_CK.T_CLERKDEV_MAPPING is
'考勤人员和设备对应表';

comment on column YKT_CK.T_CLERKDEV_MAPPING.CUST_ID is
'客户号';

comment on column YKT_CK.T_CLERKDEV_MAPPING.DEVICE_ID is
'设备编号';

alter table YKT_CK.T_CLERKDEV_MAPPING
   add constraint "P_Key_1" primary key (CUST_ID, DEVICE_ID);

--==============================================================
-- Table: T_CLERKINFO
--==============================================================
create table YKT_CK.T_CLERKINFO
(
   CUST_ID              INTEGER                not null,
   DEPT_ID              VARCHAR(32),
   IFOFFICE             CHAR(1),
   AHEAD_OVERTIME       CHAR(1)                default '0',
   DELAY_OVERTIME       CHAR(1)                default '0',
   OVERTIME_VALUE       INTEGER                default 60,
   TWOREST_OVERTIME     CHAR(1)                default '0',
   HOLIDAY_OVERTIME     CHAR(1)                default '0'
);

comment on table YKT_CK.T_CLERKINFO is
'考勤人员信息表';

comment on column YKT_CK.T_CLERKINFO.CUST_ID is
'客户号';

comment on column YKT_CK.T_CLERKINFO.DEPT_ID is
'所属部门ID';

comment on column YKT_CK.T_CLERKINFO.IFOFFICE is
'是否坐班';

comment on column YKT_CK.T_CLERKINFO.AHEAD_OVERTIME is
'提前上班是否算加班';

comment on column YKT_CK.T_CLERKINFO.DELAY_OVERTIME is
'推迟下班是否算加班';

comment on column YKT_CK.T_CLERKINFO.OVERTIME_VALUE is
'加班时间计算方法（15，30,60等）';

comment on column YKT_CK.T_CLERKINFO.TWOREST_OVERTIME is
'周六周日打卡是否算加班';

comment on column YKT_CK.T_CLERKINFO.HOLIDAY_OVERTIME is
'节假日打卡是否算加班';

alter table YKT_CK.T_CLERKINFO
   add constraint "P_Key_1" primary key (CUST_ID);

--==============================================================
-- Table: T_DEPT_WORKCONFINFO
--==============================================================
create table YKT_CK.T_DEPT_WORKCONFINFO
(
   DEPT_ID              VARCHAR(32)            not null,
   BEGINDATE            VARCHAR(8)             not null,
   WORKINFO_ID          VARCHAR(32),
   WORKTIME_ID          VARCHAR(32),
   IFWORK               CHAR(1)                default '1'
);

comment on table YKT_CK.T_DEPT_WORKCONFINFO is
'部门考勤制度表';

comment on column YKT_CK.T_DEPT_WORKCONFINFO.DEPT_ID is
'部门编号';

comment on column YKT_CK.T_DEPT_WORKCONFINFO.BEGINDATE is
'生效日期';

comment on column YKT_CK.T_DEPT_WORKCONFINFO.WORKINFO_ID is
'考勤制度编号';

comment on column YKT_CK.T_DEPT_WORKCONFINFO.WORKTIME_ID is
'工作时间编号';

comment on column YKT_CK.T_DEPT_WORKCONFINFO.IFWORK is
'是否上班';

alter table YKT_CK.T_DEPT_WORKCONFINFO
   add constraint "P_Key_1" primary key (DEPT_ID, BEGINDATE);

--==============================================================
-- Table: T_LEAVEINFO
--==============================================================
create table YKT_CK.T_LEAVEINFO
(
   LEAVE_ID             VARCHAR(32)            not null,
   CUST_ID              INTEGER                not null,
   LEAVE_TYPEID         CHAR(1),
   LEAVE_INFO           VARCHAR(300),
   VALIDITY             CHAR(1),
   STARTDATE            VARCHAR(8),
   ENDDATE              VARCHAR(8),
   STARTTIME            VARCHAR(6),
   ENDTIME              VARCHAR(6),
   OPER_ID              VARCHAR(32),
   OPER_DATE            VARCHAR(8),
   OPER_TIME            VARCHAR(6),
   REMARK               VARCHAR(300)
);

comment on table YKT_CK.T_LEAVEINFO is
'请假信息';

comment on column YKT_CK.T_LEAVEINFO.LEAVE_ID is
'请假信息ID';

comment on column YKT_CK.T_LEAVEINFO.CUST_ID is
'客户号';

comment on column YKT_CK.T_LEAVEINFO.LEAVE_TYPEID is
'请假类型';

comment on column YKT_CK.T_LEAVEINFO.LEAVE_INFO is
'请假原因';

comment on column YKT_CK.T_LEAVEINFO.VALIDITY is
'是否有效';

comment on column YKT_CK.T_LEAVEINFO.STARTDATE is
'请假开始日期';

comment on column YKT_CK.T_LEAVEINFO.ENDDATE is
'请假结束日期';

comment on column YKT_CK.T_LEAVEINFO.STARTTIME is
'请假开始时间';

comment on column YKT_CK.T_LEAVEINFO.ENDTIME is
'请假结束时间';

comment on column YKT_CK.T_LEAVEINFO.OPER_ID is
'操作人员编号';

comment on column YKT_CK.T_LEAVEINFO.OPER_DATE is
'操作日期';

comment on column YKT_CK.T_LEAVEINFO.OPER_TIME is
'操作时间';

comment on column YKT_CK.T_LEAVEINFO.REMARK is
'备注信息';

alter table YKT_CK.T_LEAVEINFO
   add constraint P_LE_KEY primary key (LEAVE_ID);

--==============================================================
-- Table: T_OPER_LIMIT
--==============================================================
create table YKT_CK.T_OPER_LIMIT
(
   OPER_ID              VARCHAR(32)            not null,
   DEPT_ID              VARCHAR(32)            not null
);

comment on table YKT_CK.T_OPER_LIMIT is
'操作员权限表';

comment on column YKT_CK.T_OPER_LIMIT.OPER_ID is
'操作员编号';

comment on column YKT_CK.T_OPER_LIMIT.DEPT_ID is
'部门编号';

alter table YKT_CK.T_OPER_LIMIT
   add constraint "P_Key_1" primary key (OPER_ID, DEPT_ID);

--==============================================================
-- Table: T_REPORTLEAVE
--==============================================================
create table YKT_CK.T_REPORTLEAVE
(
   ID                   VARCHAR(32)            not null,
   REPROT_DATE          CHAR(8),
   REPORT_TIME          CHAR(6),
   CUST_ID              INTEGER,
   DEPT_ID              VARCHAR(32),
   LEAVE_ID             CHAR(2),
   LEAVE_INFO           VARCHAR(300),
   LEAVE_BEGINDATE      CHAR(8),
   LEAVE_BEGINTIME      CHAR(6),
   LEAVE_ENDDATE        CHAR(8),
   LEAVE_ENDTIME        CHAR(6),
   IFCHECK              CHAR,
   CHECK_DATE           CHAR(8),
   CHECK_TIME           CHAR(6),
   CHECK_ID             VARCHAR(32),
   IFAGREE              CHAR,
   COMMENTS             VARCHAR(300)
);

comment on table YKT_CK.T_REPORTLEAVE is
'请假申请表';

comment on column YKT_CK.T_REPORTLEAVE.ID is
'编号';

comment on column YKT_CK.T_REPORTLEAVE.REPROT_DATE is
'请假日期';

comment on column YKT_CK.T_REPORTLEAVE.REPORT_TIME is
'请假时间';

comment on column YKT_CK.T_REPORTLEAVE.CUST_ID is
'请假人客户号';

comment on column YKT_CK.T_REPORTLEAVE.DEPT_ID is
'请假人部门号';

comment on column YKT_CK.T_REPORTLEAVE.LEAVE_ID is
'请假类别';

comment on column YKT_CK.T_REPORTLEAVE.LEAVE_INFO is
'请假原因';

comment on column YKT_CK.T_REPORTLEAVE.LEAVE_BEGINDATE is
'请假开始日期';

comment on column YKT_CK.T_REPORTLEAVE.LEAVE_BEGINTIME is
'请假开始时间';

comment on column YKT_CK.T_REPORTLEAVE.LEAVE_ENDDATE is
'请假结束日期';

comment on column YKT_CK.T_REPORTLEAVE.LEAVE_ENDTIME is
'请假结束时间';

comment on column YKT_CK.T_REPORTLEAVE.IFCHECK is
'是否审批';

comment on column YKT_CK.T_REPORTLEAVE.CHECK_DATE is
'审批日期';

comment on column YKT_CK.T_REPORTLEAVE.CHECK_TIME is
'审批时间';

comment on column YKT_CK.T_REPORTLEAVE.CHECK_ID is
'审批人客户号';

comment on column YKT_CK.T_REPORTLEAVE.IFAGREE is
'是否同意请假';

comment on column YKT_CK.T_REPORTLEAVE.COMMENTS is
'审批备注';

alter table YKT_CK.T_REPORTLEAVE
   add constraint "P_Key_1" primary key (ID);

--==============================================================
-- Table: T_WORKCONFINFO
--==============================================================
create table YKT_CK.T_WORKCONFINFO
(
   WORKCONF_ID          VARCHAR(32)            not null,
   WORKCONF_NAME        VARCHAR(60),
   OVERDUE_TIME         INTEGER,
   LEAVEEARLY_TIME      INTEGER,
   OVER_TIME            INTEGER,
   DELAY_TIME           INTEGER,
   CHECK_TIME           INTEGER,
   DEPT_ID              VARCHAR(32)
);

comment on table YKT_CK.T_WORKCONFINFO is
'考勤制度表';

comment on column YKT_CK.T_WORKCONFINFO.WORKCONF_ID is
'考勤制度ID';

comment on column YKT_CK.T_WORKCONFINFO.WORKCONF_NAME is
'考勤制度名称';

comment on column YKT_CK.T_WORKCONFINFO.OVERDUE_TIME is
'允许迟到的时间';

comment on column YKT_CK.T_WORKCONFINFO.LEAVEEARLY_TIME is
'允许早退的时间';

comment on column YKT_CK.T_WORKCONFINFO.OVER_TIME is
'上班提前打卡不允许超过时间';

comment on column YKT_CK.T_WORKCONFINFO.DELAY_TIME is
'下班打卡允许滞后时间';

comment on column YKT_CK.T_WORKCONFINFO.CHECK_TIME is
'校正时间（分钟）（例：上班打卡后，下班没有打卡，则认为多少分钟后已经下班，如果为零则认为他到下班时间打的卡）';

comment on column YKT_CK.T_WORKCONFINFO.DEPT_ID is
'添加人所在部门编号';

alter table YKT_CK.T_WORKCONFINFO
   add constraint P_C_KEY primary key (WORKCONF_ID);

--==============================================================
-- Table: T_WORKTIMEINTO
--==============================================================
create table YKT_CK.T_WORKTIMEINTO
(
   WORKTIME_ID          VARCHAR(32)            not null,
   WORKTIME_NAME        VARCHAR(120),
   ONTIME1              VARCHAR(6),
   OFFTIME1             VARCHAR(6),
   ONTIME2              VARCHAR(6),
   OFFTIME2             VARCHAR(6),
   ONTIME3              VARCHAR(6),
   OFFTIME3             VARCHAR(6),
   ONTIME4              VARCHAR(6),
   OFFTIME4             VARCHAR(6),
   DEPT_ID              VARCHAR(32)
);

comment on table YKT_CK.T_WORKTIMEINTO is
'工作时间表';

comment on column YKT_CK.T_WORKTIMEINTO.WORKTIME_ID is
'工作时间编号';

comment on column YKT_CK.T_WORKTIMEINTO.WORKTIME_NAME is
'工作时间名称';

comment on column YKT_CK.T_WORKTIMEINTO.ONTIME1 is
'上班时间一';

comment on column YKT_CK.T_WORKTIMEINTO.OFFTIME1 is
'下边时间一';

comment on column YKT_CK.T_WORKTIMEINTO.ONTIME2 is
'上班时间二';

comment on column YKT_CK.T_WORKTIMEINTO.OFFTIME2 is
'下班时间二';

comment on column YKT_CK.T_WORKTIMEINTO.ONTIME3 is
'上班时间三';

comment on column YKT_CK.T_WORKTIMEINTO.OFFTIME3 is
'下班时间三';

comment on column YKT_CK.T_WORKTIMEINTO.ONTIME4 is
'上班时间四';

comment on column YKT_CK.T_WORKTIMEINTO.OFFTIME4 is
'下班时间四';

comment on column YKT_CK.T_WORKTIMEINTO.DEPT_ID is
'添加人所在部门编号';

alter table YKT_CK.T_WORKTIMEINTO
   add constraint "P_Key_1" primary key (WORKTIME_ID);

