/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     16/05/2016 16:43:50                          */
/*==============================================================*/
create database eusach;
use database eusach;

/* esto se utiliza cuando ya tienes tablas creadas, osea los DROP*/
drop table if exists COMENTARIO;

drop table if exists EVENTO;

drop table if exists EVENTOUSUARIO;

drop table if exists LUGAR;

drop table if exists PREFERENCIAS;

drop table if exists TIPO;

drop table if exists TIPOESTADO;

drop table if exists USUARIO;

drop table if exists USUARIOSEGUIDOS;

/*==============================================================*/
/* Table: COMENTARIO                                            */
/*==============================================================*/
create table COMENTARIO
(
   ID_COMENTARIO        int not null auto_increment,
   ID_USUARIO           int not null,
   ID_EVENTO            int not null,
   TEXTO_COMENTARIO     text,
   FECHA_COMENTARIO     datetime,
   primary key (ID_COMENTARIO)
);

/*==============================================================*/
/* Table: EVENTO                                                */
/*==============================================================*/
create table EVENTO
(
   ID_EVENTO            int not null auto_increment,
   ID_LUGAR             int not null,
   ID_TIPO              int not null,
   ID_USUARIO           int not null,
   TITULO_EVENTO        varchar(50),
   INICIO_EVENTO        time,
   FIN_EVENTO           time,
   FECHA_EVENTO         date,
   DESCRIPCION_EVENTO   text,
   primary key (ID_EVENTO)
);

/*==============================================================*/
/* Table: EVENTOUSUARIO                                         */
/*==============================================================*/
create table EVENTOUSUARIO
(
   ID_EVENTO_USUARIO    int not null auto_increment,
   ID_EVENTO            int,
   ID_USUARIO           int not null,
   primary key (ID_EVENTO_USUARIO)
);

/*==============================================================*/
/* Table: LUGAR                                                 */
/*==============================================================*/
create table LUGAR
(
   ID_LUGAR             int not null auto_increment,
   NOMBRE_LUGAR         varchar(50),
   COORDENADA_X         float,
   COORDENADA_Y         float,
   primary key (ID_LUGAR)
);

/*==============================================================*/
/* Table: PREFERENCIAS                                          */
/*==============================================================*/
create table PREFERENCIAS
(
   ID_PREFERENCIA       int not null auto_increment,
   ID_TIPO              int not null,
   ID_USUARIO           int not null,
   NOMBRE_PREFERENCIA   varchar(50),
   primary key (ID_PREFERENCIA)
);

/*==============================================================*/
/* Table: TIPO                                                  */
/*==============================================================*/
create table TIPO
(
   ID_TIPO              int not null auto_increment,
   TIPO_EVENTO          varchar(50),
   DESCRIPCION          text,
   primary key (ID_TIPO)
);

/*==============================================================*/
/* Table: TIPOESTADO                                            */
/*==============================================================*/
create table TIPOESTADO
(
   ID_TIPOESTADO        int not null auto_increment,
   NOMBRE_ESTADO        varchar(50),
   DESCRIPCION_ESTADO   text,
   primary key (ID_TIPOESTADO)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   ID_USUARIO           int not null auto_increment,
   ID_TIPOESTADO        int not null,
   NOMBRE_USUARIO       varchar(50),
   APELLIDO_USUARIO     varchar(50),
   CORREO_USUARIO       varchar(50),
   CARRERA_USUARIO      varchar(50),
   CONTRASENHA_USUARIO  varchar(50),
   ESADMINISTRADOR_     bool,
   primary key (ID_USUARIO)
);

/*==============================================================*/
/* Table: USUARIOSEGUIDOS                                       */
/*==============================================================*/
create table USUARIOSEGUIDOS
(
   ID_USUARIO           int not null,
   USU_ID_USUARIO       int not null
);

alter table COMENTARIO add constraint FK_EXISTE_PARA foreign key (ID_EVENTO)
      references EVENTO (ID_EVENTO) on delete restrict on update restrict;

alter table COMENTARIO add constraint FK_PUEDE_CREAR foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

alter table EVENTO add constraint FK_CREA foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

alter table EVENTO add constraint FK_POSEE foreign key (ID_LUGAR)
      references LUGAR (ID_LUGAR) on delete restrict on update restrict;

alter table EVENTO add constraint FK_SE_COMPONE foreign key (ID_TIPO)
      references TIPO (ID_TIPO) on delete restrict on update restrict;

alter table EVENTOUSUARIO add constraint FK_ASISTE foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

alter table EVENTOUSUARIO add constraint FK_TIENE foreign key (ID_EVENTO)
      references EVENTO (ID_EVENTO) on delete restrict on update restrict;

alter table PREFERENCIAS add constraint FK_ESTA_EN foreign key (ID_TIPO)
      references TIPO (ID_TIPO) on delete restrict on update restrict;

alter table PREFERENCIAS add constraint FK_MANTIENE foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

alter table USUARIO add constraint FK_TIENE_UN foreign key (ID_TIPOESTADO)
      references TIPOESTADO (ID_TIPOESTADO) on delete restrict on update restrict;

alter table USUARIOSEGUIDOS add constraint FK_PUEDE_SEGUIR_A foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

alter table USUARIOSEGUIDOS add constraint FK_SEGUIDO_POR foreign key (USU_ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

