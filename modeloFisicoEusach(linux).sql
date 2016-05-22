/*==============================================================*/
/* dbms name:      mysql 5.0                                    */
/* created on:     16/05/2016 16:43:50                          */
/*==============================================================*/
/*esto es para los que no han creado la base de datos */
create database eusach;
use eusach;
 
/* esto se utiliza cuando ya tienes tablas creadas, osea los drop*/
drop table if exists comentario;
 
drop table if exists evento;
 
drop table if exists eventousuario;
 
drop table if exists lugar;
 
drop table if exists preferencias;
 
drop table if exists tipo;
 
drop table if exists tipoestado;
 
drop table if exists usuario;
 
drop table if exists usuarioseguidos;
 
/*==============================================================*/
/* table: comentario                                            */
/*==============================================================*/
create table comentario
(
   id_comentario        int not null auto_increment,
   id_usuario           int not null,
   id_evento            int not null,
   texto_comentario     text,
   fecha_comentario     datetime,
   primary key (id_comentario)
);
 
/*==============================================================*/
/* table: evento                                                */
/*==============================================================*/
create table evento
(
   id_evento            int not null auto_increment,
   id_lugar             int not null,
   id_tipo              int not null,
   id_usuario           int not null,
   titulo_evento        varchar(50),
   inicio_evento        datetime,
   fin_evento           datetime,
   descripcion_evento   text,
   primary key (id_evento)
);
 
/*==============================================================*/
/* table: eventousuario                                         */
/*==============================================================*/
create table eventousuario
(
   id_evento_usuario    int not null auto_increment,
   id_evento            int,
   id_usuario           int not null,
   primary key (id_evento_usuario)
);
 
/*==============================================================*/
/* table: lugar                                                 */
/*==============================================================*/
create table lugar
(
   id_lugar             int not null auto_increment,
   nombre_lugar         varchar(50),
   latitud         float,
   longitud         float,
   primary key (id_lugar)
);
 
/*==============================================================*/
/* table: preferencias                                          */
/*==============================================================*/
create table preferencias
(
   id_preferencia       int not null auto_increment,
   id_tipo              int not null,
   id_usuario           int not null,
   nombre_preferencia   varchar(50),
   primary key (id_preferencia)
);
 
/*==============================================================*/
/* table: tipo                                                  */
/*==============================================================*/
create table tipo
(
   id_tipo              int not null auto_increment,
   tipo_evento          varchar(50),
   descripcion          text,
   primary key (id_tipo)
);
 
/*==============================================================*/
/* table: tipoestado                                            */
/*==============================================================*/
create table tipoestado
(
   id_tipoestado        int not null auto_increment,
   nombre_estado        varchar(50),
   descripcion_estado   text,
   primary key (id_tipoestado)
);
 
/*==============================================================*/
/* table: usuario                                               */
/*==============================================================*/
create table usuario
(
   id_usuario           int not null auto_increment,
   id_tipoestado        int not null,
   nombre_usuario       varchar(50),
   apellido_usuario     varchar(50),
   correo_usuario       varchar(50),
   carrera_usuario      varchar(50),
   contrasenha_usuario  varchar(50),
   esadministrador_     bool,
   primary key (id_usuario)
);
 
/*==============================================================*/
/* table: usuarioseguidos                                       */
/*==============================================================*/
create table usuarioseguidos
(
   id_usuario           int not null,
   usu_id_usuario       int not null
);
 
alter table comentario add constraint fk_existe_para foreign key (id_evento)
      references evento (id_evento) on delete restrict on update restrict;
 
alter table comentario add constraint fk_puede_crear foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;
 
alter table evento add constraint fk_crea foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;
 
alter table evento add constraint fk_posee foreign key (id_lugar)
      references lugar (id_lugar) on delete restrict on update restrict;
 
alter table evento add constraint fk_se_compone foreign key (id_tipo)
      references tipo (id_tipo) on delete restrict on update restrict;
 
alter table eventousuario add constraint fk_asiste foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;
 
alter table eventousuario add constraint fk_tiene foreign key (id_evento)
      references evento (id_evento) on delete restrict on update restrict;
 
alter table preferencias add constraint fk_esta_en foreign key (id_tipo)
      references tipo (id_tipo) on delete restrict on update restrict;
 
alter table preferencias add constraint fk_mantiene foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;
 
alter table usuario add constraint fk_tiene_un foreign key (id_tipoestado)
      references tipoestado (id_tipoestado) on delete restrict on update restrict;
 
alter table usuarioseguidos add constraint fk_puede_seguir_a foreign key (id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;
 
alter table usuarioseguidos add constraint fk_seguido_por foreign key (usu_id_usuario)
      references usuario (id_usuario) on delete restrict on update restrict;