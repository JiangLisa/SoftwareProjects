/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2021/10/20 18:35:05                          */
/*==============================================================*/


drop table if exists comment;

drop table if exists fault_type;

drop table if exists member;

drop table if exists notice;

drop table if exists operate_log;

drop table if exists order_form;

drop table if exists privilege;

drop table if exists product;

drop table if exists product_type;

drop table if exists relation;

drop table if exists repair_form;

drop table if exists repairment;

drop table if exists report_form;

drop table if exists role;

drop table if exists user;

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   comment_id           int not null auto_increment,
   comment_content      varchar(200),
   version              varchar(3),
   create_time          datetime,
   modified_time        datetime,
   primary key (comment_id)
);

/*==============================================================*/
/* Table: fault_type                                            */
/*==============================================================*/
create table fault_type
(
   fault_id             int not null,
   fault_name           varchar(20),
   version              varchar(3),
   create_time          datetime,
   primary key (fault_id)
);

/*==============================================================*/
/* Table: member                                                */
/*==============================================================*/
create table member
(
   member_id            int(11) not null,
   version              varchar(3),
   create_time          datetime,
   modified_time        datetime,
   primary key (member_id)
);

/*==============================================================*/
/* Table: notice                                                */
/*==============================================================*/
create table notice
(
   notice_id            int not null auto_increment,
   use_id               int(11),
   notice_titile        varchar(50),
   notice_content       varchar(100),
   notice_image         binary(255),
   notice_time          datetime,
   version              varchar(3),
   create_time          datetime,
   modified_time        datetime,
   primary key (notice_id)
);

/*==============================================================*/
/* Table: operate_log                                           */
/*==============================================================*/
create table operate_log
(
   id                   int not null,
   use_id               int(11),
   ip                   varchar(20),
   action               longtext,
   version              varchar(3),
   create_time          datetime,
   modified_time        datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: order_form                                            */
/*==============================================================*/
create table order_form
(
   id                   int(12) not null auto_increment,
   use_id               int(11),
   fault_id             int,
   address              varchar(100),
   fault_expresstion    varchar(200),
   reserve_time         datetime,
   deal_money           int(10),
   contact_name         varchar(10),
   contact_phone        int(11),
   order_time           datetime,
   is_receive           boolean,
   receive_time         datetime,
   actual_money         int(10),
   status               varchar(3),
   reviewer             varchar(5),
   review_time          varchar(8),
   reason               varchar(100),
   version              varchar(3),
   create_time          datetime,
   modified_time        datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: privilege                                             */
/*==============================================================*/
create table privilege
(
   pri_id               int not null,
   pri_name             varchar(20),
   primary key (pri_id)
);

/*==============================================================*/
/* Table: product                                               */
/*==============================================================*/
create table product
(
   id                   int not null auto_increment,
   use_id               int(11),
   protype_id           int,
   product_id           int(12),
   product_name         varchar(20),
   inventory            int,
   unit                 varchar(5),
   单价                   int(7),
   version              varchar(3),
   create_time          datetime,
   modified_time        datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: product_type                                          */
/*==============================================================*/
create table product_type
(
   protype_id           int not null,
   protype_name         varchar(20),
   version              varchar(3),
   create_time          datetime,
   primary key (protype_id)
);

/*==============================================================*/
/* Table: relation                                              */
/*==============================================================*/
create table relation
(
   relation_id          int not null auto_increment,
   id                   int,
   pri_id               int,
   primary key (relation_id)
);

/*==============================================================*/
/* Table: repair_form                                           */
/*==============================================================*/
create table repair_form
(
   维修单id                int(12) not null,
   repairment_id        int(11),
   fault_id             int,
   address              varchar(100),
   fault_expresstion    varbinary(200),
   reserve_time         datetime,
   deal_money           int(10),
   contact_name         varchar(10),
   contact_phone        int(11),
   order_time           datetime,
   receive_time         datetime,
   actual_money         int(10),
   repair_status        varchar(3),
   version              varchar(3),
   create_time          datetime,
   modified_time        datetime,
   primary key (维修单id)
);

/*==============================================================*/
/* Table: repairment                                            */
/*==============================================================*/
create table repairment
(
   repairment_id        int(11) not null,
   name                 varchar(10),
   repair_phone         int(11),
   repair_type          varchar(50),
   version              varchar(3),
   create_time          datetime,
   modified_time        datetime,
   primary key (repairment_id)
);

/*==============================================================*/
/* Table: report_form                                           */
/*==============================================================*/
create table report_form
(
   报修单id                int(12) not null,
   com_id               int,
   member_id            int(11),
   fault_id             int,
   address              varchar(100),
   fault_expresstion    varchar(200),
   reserve_time         datetime,
   deal_money           int(10),
   contact_name         varchar(10),
   contact_phone        int(11),
   order_time           datetime,
   repair_status        varchar(3),
   version              varchar(3),
   create_time          datetime,
   modified_time        datetime,
   primary key (报修单id)
);

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   id                   int not null auto_increment,
   role_name            varchar(5) not null,
   version              varchar(3),
   create_time          datetime,
   modified_time        datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   use_id               int(11) not null,
   rol_id               int,
   name                 varchar(10) not null,
   password             varchar(20) not null,
   image                binary(255),
   sex                  int,
   status               boolean not null,
   version              varchar(3),
   create_time          datetime,
   modified_time        datetime,
   primary key (use_id)
);

alter table member add constraint FK_user_member foreign key (member_id)
      references user (use_id) on delete set null on update cascade;

alter table notice add constraint FK_user_notice foreign key (use_id)
      references user (use_id) on delete set null on update cascade;

alter table operate_log add constraint FK_user_operate foreign key (use_id)
      references user (use_id) on delete set null on update cascade;

alter table order_form add constraint FK_order_fault foreign key (fault_id)
      references fault_type (fault_id) on delete set null on update cascade;

alter table order_form add constraint FK_user_order foreign key (use_id)
      references user (use_id) on delete set null on update cascade;

alter table product add constraint FK_protype_product foreign key (protype_id)
      references product_type (protype_id) on delete set null on update cascade;

alter table product add constraint FK_user_product foreign key (use_id)
      references user (use_id) on delete set null on update cascade;

alter table relation add constraint FK_Reference_15 foreign key (id)
      references role (id) on delete restrict on update restrict;

alter table relation add constraint FK_Reference_16 foreign key (pri_id)
      references privilege (pri_id) on delete restrict on update restrict;

alter table repair_form add constraint FK_fault_repair foreign key (fault_id)
      references fault_type (fault_id) on delete set null on update cascade;

alter table repair_form add constraint FK_repairment_repair foreign key (repairment_id)
      references repairment (repairment_id) on delete set null on update cascade;

alter table repairment add constraint FK_user_repairment foreign key (repairment_id)
      references user (use_id) on delete set null on update cascade;

alter table report_form add constraint FK_fault_report foreign key (fault_id)
      references fault_type (fault_id) on delete set null on update cascade;

alter table report_form add constraint FK_member_report foreign key (member_id)
      references member (member_id) on delete set null on update cascade;

alter table report_form add constraint FK_report_comment foreign key (com_id)
      references comment (comment_id) on delete set null on update cascade;

alter table user add constraint FK_role_user foreign key (rol_id)
      references role (id) on delete set null on update cascade;

