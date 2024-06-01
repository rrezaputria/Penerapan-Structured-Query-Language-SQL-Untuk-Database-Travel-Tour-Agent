/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     16/10/2023 15:59:40                          */
/*==============================================================*/


drop table if exists ADMIN_TRAVEL_TOUR;

drop table if exists BUKTI_TRAVEL_TOUR;

drop table if exists DAERAH_HOTEL_TRAVEL_TOUR;

drop table if exists HOTEL_TRAVEL_TOUR;

drop table if exists PAKET_TRAVEL_TOUR;

drop table if exists PESAN_TRAVEL_TOUR;

drop table if exists USER_TRAVEL_TOUR;

/*==============================================================*/
/* Table: ADMIN_TRAVEL_TOUR                                     */
/*==============================================================*/
create table ADMIN_TRAVEL_TOUR
(
   ID_ADMIN             varchar(10) not null,
   PASS_ADMIN           varchar(10),
   NAMA_ADMIN           varchar(30),
   STATUS_ADMIN         varchar(15),
   primary key (ID_ADMIN)
);

/*==============================================================*/
/* Table: BUKTI_TRAVEL_TOUR                                     */
/*==============================================================*/
create table BUKTI_TRAVEL_TOUR
(
   ID_BUKTI             varchar(10) not null,
   ID_ADMIN             varchar(10),
   ID_USER              varchar(10),
   FILE_BUKTI           varchar(10),
   primary key (ID_BUKTI)
);

/*==============================================================*/
/* Table: DAERAH_HOTEL_TRAVEL_TOUR                              */
/*==============================================================*/
create table DAERAH_HOTEL_TRAVEL_TOUR
(
   ID_DAERAH            varchar(10) not null,
   NAMA_DAERAH          varchar(20),
   primary key (ID_DAERAH)
);

/*==============================================================*/
/* Table: HOTEL_TRAVEL_TOUR                                     */
/*==============================================================*/
create table HOTEL_TRAVEL_TOUR
(
   ID_HOTEL             varchar(10) not null,
   ID_DAERAH            varchar(10),
   NAMA_HOTEL           varchar(10),
   BINTANG_HOTEL        int,
   HARGA_HOTEL          varchar(30),
   primary key (ID_HOTEL)
);

/*==============================================================*/
/* Table: PAKET_TRAVEL_TOUR                                     */
/*==============================================================*/
create table PAKET_TRAVEL_TOUR
(
   ID_PAKET             varchar(10) not null,
   ID_PESAN             varchar(10),
   NAMA_PAKET           varchar(15),
   HARGA_PAKET          varchar(20),
   KETERANGAN_PAKET     varchar(50),
   primary key (ID_PAKET)
);

/*==============================================================*/
/* Table: PESAN_TRAVEL_TOUR                                     */
/*==============================================================*/
create table PESAN_TRAVEL_TOUR
(
   ID_PESAN             varchar(10) not null,
   ID_HOTEL             varchar(10),
   ID_PAKET             varchar(10),
   ID_BUKTI             varchar(10),
   STATUS_PESAN         varchar(10),
   TANGGAL_PESAN        date,
   TANGGAL_TOUR_PESAN   date,
   primary key (ID_PESAN)
);

/*==============================================================*/
/* Table: USER_TRAVEL_TOUR                                      */
/*==============================================================*/
create table USER_TRAVEL_TOUR
(
   ID_USER              varchar(10) not null,
   PASS_USER            varchar(10),
   NAMA_USER            varchar(30),
   NO_TELP_USER         varchar(15),
   primary key (ID_USER)
);

alter table BUKTI_TRAVEL_TOUR add constraint FK_MENCETAK foreign key (ID_ADMIN)
      references ADMIN_TRAVEL_TOUR (ID_ADMIN) on delete restrict on update restrict;

alter table BUKTI_TRAVEL_TOUR add constraint FK_MENGUNDUH foreign key (ID_USER)
      references USER_TRAVEL_TOUR (ID_USER) on delete restrict on update restrict;

alter table HOTEL_TRAVEL_TOUR add constraint FK_BERADA foreign key (ID_DAERAH)
      references DAERAH_HOTEL_TRAVEL_TOUR (ID_DAERAH) on delete restrict on update restrict;

alter table PAKET_TRAVEL_TOUR add constraint FK_MEMILIH2 foreign key (ID_PESAN)
      references PESAN_TRAVEL_TOUR (ID_PESAN) on delete restrict on update restrict;

alter table PESAN_TRAVEL_TOUR add constraint FK_BERISI foreign key (ID_BUKTI)
      references BUKTI_TRAVEL_TOUR (ID_BUKTI) on delete restrict on update restrict;

alter table PESAN_TRAVEL_TOUR add constraint FK_MEMILIH foreign key (ID_PAKET)
      references PAKET_TRAVEL_TOUR (ID_PAKET) on delete restrict on update restrict;

alter table PESAN_TRAVEL_TOUR add constraint FK_MEMILIKI foreign key (ID_HOTEL)
      references HOTEL_TRAVEL_TOUR (ID_HOTEL) on delete restrict on update restrict;

