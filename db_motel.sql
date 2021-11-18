/*==============================================================*/
/* Table: COMISION                                              */
/*==============================================================*/
create table COMISION (
   COD_COMISION         INT4                 not null,
   COD_PAGO             INT4                 not null,
   constraint PK_COMISION primary key (COD_COMISION)
);

/*==============================================================*/
/* Index: COMISION_PK                                           */
/*==============================================================*/
create unique index COMISION_PK on COMISION (
COD_COMISION
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on COMISION (
COD_PAGO
);

/*==============================================================*/
/* Table: CONVENIO                                              */
/*==============================================================*/
create table CONVENIO (
   COD_CONVENIO         INT4                 not null,
   CODIGO_CLIENTE       INT4                 not null,
   COD_EMPRESA          INT4                 not null,
   constraint PK_CONVENIO primary key (COD_CONVENIO)
);

/*==============================================================*/
/* Index: CONVENIO_PK                                           */
/*==============================================================*/
create unique index CONVENIO_PK on CONVENIO (
COD_CONVENIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on CONVENIO (
CODIGO_CLIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on CONVENIO (
COD_EMPRESA
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   COD_EMPLEADO         INT4                 not null,
   NOMBRE               TEXT                 null,
   APELLIDO             TEXT                 null,
   GENERO               TEXT                 null,
   FECHA_NACIMIENTO     DATE                 null,
   DOMICILIO            TEXT                 null,
   TELEFONO             INT4                 null,
   constraint PK_EMPLEADO primary key (COD_EMPLEADO)
);

/*==============================================================*/
/* Index: EMPLEADO_PK                                           */
/*==============================================================*/
create unique index EMPLEADO_PK on EMPLEADO (
COD_EMPLEADO
);

/*==============================================================*/
/* Table: EMPRESA_CONVENIO                                      */
/*==============================================================*/
create table EMPRESA_CONVENIO (
   COD_EMPRESA          INT4                 not null,
   NOMBRE_EMPRESA       TEXT                 null,
   DESCRIPCION          TEXT                 null,
   constraint PK_EMPRESA_CONVENIO primary key (COD_EMPRESA)
);

/*==============================================================*/
/* Index: EMPRESA_CONVENIO_PK                                   */
/*==============================================================*/
create unique index EMPRESA_CONVENIO_PK on EMPRESA_CONVENIO (
COD_EMPRESA
);

/*==============================================================*/
/* Table: ESTANDIA                                              */
/*==============================================================*/
create table ESTANDIA (
   COD_ESTANDIA         INT4                 not null,
   CODIGO_CLIENTE       INT4                 null,
   COD_EMPLEADO         INT4                 not null,
   COD_PAGO             INT4                 not null,
   NUMERO_HABITACION    INT4                 null,
   OBSERVACION          TEXT                 null,
   FECHA_ESTADIA        DATE                 null,
   HORA_ENTRADA         TIME                 null,
   HORA_SALIDA          TIME                 null,
   constraint PK_ESTANDIA primary key (COD_ESTANDIA)
);

/*==============================================================*/
/* Index: ESTANDIA_PK                                           */
/*==============================================================*/
create unique index ESTANDIA_PK on ESTANDIA (
COD_ESTANDIA
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on ESTANDIA (
CODIGO_CLIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on ESTANDIA (
COD_EMPLEADO
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on ESTANDIA (
COD_PAGO
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on ESTANDIA (
NUMERO_HABITACION
);

/*==============================================================*/
/* Table: HABITACION                                            */
/*==============================================================*/
create table HABITACION (
   NUMERO_HABITACION    INT4                 not null,
   TIPO_HABITACION      TEXT                 null,
   COSTO                REAL           null,
   CAPACIDAD            INT4              null,
   constraint PK_HABITACION primary key (NUMERO_HABITACION)
);

/*==============================================================*/
/* Index: HABITACION_PK                                         */
/*==============================================================*/
create unique index HABITACION_PK on HABITACION (
NUMERO_HABITACION
);

/*==============================================================*/
/* Table: MANTENIMIENTO                                         */
/*==============================================================*/
create table MANTENIMIENTO (
   COD_MANTENIMIENTO    INT4                 not null,
   NUMERO_HABITACION    INT4                 not null,
   CODIGO_HABITACION    INT4                 null,
   TIPO_MANTENIMIENTO   TEXT                 null,
   constraint PK_MANTENIMIENTO primary key (COD_MANTENIMIENTO)
);

/*==============================================================*/
/* Index: MANTENIMIENTO_PK                                      */
/*==============================================================*/
create unique index MANTENIMIENTO_PK on MANTENIMIENTO (
COD_MANTENIMIENTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on MANTENIMIENTO (
NUMERO_HABITACION
);

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
create table PAGO (
   COD_PAGO             INT4                 not null,
   CODIGO_CLIENTE       INT4                 not null,
   COD_EMPLEADO         INT4                 not null,
   VALOR_PAGO           REAL           null,
   RECARGO_TAXI         REAL           null,
   constraint PK_PAGO primary key (COD_PAGO)
);

/*==============================================================*/
/* Index: PAGO_PK                                               */
/*==============================================================*/
create unique index PAGO_PK on PAGO (
COD_PAGO
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on PAGO (
CODIGO_CLIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on PAGO (
COD_EMPLEADO
);

/*==============================================================*/
/* Table: REGISTRO_CLIENTE                                      */
/*==============================================================*/
create table REGISTRO_CLIENTE (
   CODIGO_CLIENTE       INT4                 not null,
   CEDULA               VARCHAR(10)          null,
   NOMBRE               TEXT                 null,
   APELLIDO             TEXT                 null,
   DIRECCION            TEXT                 null,
   FECHA_NACIMIENTO     DATE                 null,
   CORREO               VARCHAR(50)          null,
   constraint PK_REGISTRO_CLIENTE primary key (CODIGO_CLIENTE)
);

/*==============================================================*/
/* Index: REGISTRO_CLIENTE_PK                                   */
/*==============================================================*/
create unique index REGISTRO_CLIENTE_PK on REGISTRO_CLIENTE (
CODIGO_CLIENTE
);

/*==============================================================*/
/* Table: TAXISTA_COMISION                                      */
/*==============================================================*/
create table TAXISTA_COMISION (
   COD_TAXISTE          INT4                 not null,
   COD_COMISION         INT4                 not null,
   NOMBRE               TEXT                 null,
   constraint PK_TAXISTA_COMISION primary key (COD_TAXISTE)
);

/*==============================================================*/
/* Index: TAXISTA_COMISION_PK                                   */
/*==============================================================*/
create unique index TAXISTA_COMISION_PK on TAXISTA_COMISION (
COD_TAXISTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on TAXISTA_COMISION (
COD_COMISION
);

alter table COMISION
   add constraint FK_COMISION_RELATIONS_PAGO foreign key (COD_PAGO)
      references PAGO (COD_PAGO)
      on delete restrict on update restrict;

alter table CONVENIO
   add constraint FK_CONVENIO_RELATIONS_REGISTRO foreign key (CODIGO_CLIENTE)
      references REGISTRO_CLIENTE (CODIGO_CLIENTE)
      on delete restrict on update restrict;

alter table CONVENIO
   add constraint FK_CONVENIO_RELATIONS_EMPRESA_ foreign key (COD_EMPRESA)
      references EMPRESA_CONVENIO (COD_EMPRESA)
      on delete restrict on update restrict;

alter table ESTANDIA
   add constraint FK_ESTANDIA_RELATIONS_REGISTRO foreign key (CODIGO_CLIENTE)
      references REGISTRO_CLIENTE (CODIGO_CLIENTE)
      on delete restrict on update restrict;

alter table ESTANDIA
   add constraint FK_ESTANDIA_RELATIONS_EMPLEADO foreign key (COD_EMPLEADO)
      references EMPLEADO (COD_EMPLEADO)
      on delete restrict on update restrict;

alter table ESTANDIA
   add constraint FK_ESTANDIA_RELATIONS_PAGO foreign key (COD_PAGO)
      references PAGO (COD_PAGO)
      on delete restrict on update restrict;

alter table ESTANDIA
   add constraint FK_ESTANDIA_RELATIONS_HABITACI foreign key (NUMERO_HABITACION)
      references HABITACION (NUMERO_HABITACION)
      on delete restrict on update restrict;

alter table MANTENIMIENTO
   add constraint FK_MANTENIM_RELATIONS_HABITACI foreign key (NUMERO_HABITACION)
      references HABITACION (NUMERO_HABITACION)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_RELATIONS_REGISTRO foreign key (CODIGO_CLIENTE)
      references REGISTRO_CLIENTE (CODIGO_CLIENTE)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_RELATIONS_EMPLEADO foreign key (COD_EMPLEADO)
      references EMPLEADO (COD_EMPLEADO)
      on delete restrict on update restrict;

alter table TAXISTA_COMISION
   add constraint FK_TAXISTA__RELATIONS_COMISION foreign key (COD_COMISION)
      references COMISION (COD_COMISION)
      on delete restrict on update restrict;

--Ingreso de datos

/*==============================================================*/
/* Table: REGISTRO_CLIENTE                                      */
/*==============================================================*/
INSERT INTO REGISTRO_CLIENTE VALUES
( 1, '1308547569', 'Gustavo', 'Marquez', 'La Pradera', '12/03/1980', 'gusmar@gmail.com'),
( 2, '1308547569', 'John', 'Blasco', '20 de mayo', '10/05/1982', 'johnblas@gmail.com'),
( 3, '1308547569', 'Joaquin', 'Antunez', 'Tarqui', '13/04/1984', 'joaantu@gmail.com'),
( 4, '1308547569', 'Saida', 'Padilla', '9 de octubre', '13/06/1981', 'saipad@gmail.com'),
( 5, '1308547569', 'Unax', 'Abril', 'Maria Auxiliadora 1', '14/07/1983', 'unaxabril@gmail.com'),
( 6, '1308547569', 'Aitor', 'Machado', 'Maria Auxiliadora 2', '15/08/1985', 'aimach@gmail.com');

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
INSERT INTO EMPLEADO VALUES
( 101, ' Manuel', 'Campo', 'Masculino', '12/03/1980', 'Urbirrios', '0952145236'),
( 102, 'Avelino', 'Holgado', 'Masculino', '10/05/1982', 'San Mateo', '0952145236'),
( 103, 'Victor', 'Agudo', 'Masculino', '13/04/1984', 'Los Esteros', '0952145236'),
( 104, 'Mirian', 'Paredes', 'Femenino', '13/06/1981', '20 de mayo', '0952145236'),
( 105, 'Maria', 'Fraile', 'Femenino', '14/07/1983', 'Los Geranios', '0952145236'),
( 106, 'Alicia', 'Moreira', 'Femenino', '15/08/1985', 'Tarqui', '0952145236');

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
INSERT INTO PAGO VALUES
( 1001, 1, 101, 650.5, 90.5),
( 1002, 6, 101, 950.75, 30.55),
( 1003, 5, 102, 700.25, 20.65),
( 1004, 4, 102, 600, 29.84),
( 1005, 3, 103, 625, 28.78),
( 1006, 2, 103, 994.10, 56.25),
( 1007, 1, 104, 1025.30, 87.32),
( 1008, 2, 104, 740.4, 88.62),
( 1009, 3, 105, 430.6, 92.72),
( 1010, 4, 105, 620.7, 91.4),
( 1011, 5, 106, 850.8, 93.3),
( 1012, 6, 106, 520.9, 94.2);

/*==============================================================*/
/* Table: COMISION                                              */
/*==============================================================*/
INSERT INTO COMISION VALUES
( 110, 1001),
( 111, 1001),
( 112, 1001),
( 113, 1002),
( 114, 1002),
( 115, 1003),
( 116, 1003),
( 117, 1004),
( 118, 1004),
( 119, 1005),
( 120, 1006),
( 121, 1012),
( 122, 1012),
( 123, 1011),
( 124, 1010),
( 125, 1010),
( 126, 1012),
( 127, 1009),
( 128, 1009),
( 129, 1008),
( 130, 1007);

/*==============================================================*/
/* Table: TAXISTA_COMISION                                      */
/*==============================================================*/
INSERT INTO TAXISTA_COMISION VALUES
( 1010, 110, 'Helen'),
( 1011, 111, 'Patricio'),
( 1012, 112, 'Juan'),
( 1013, 113, 'Lucas'),
( 1014, 110, 'Helen'),
( 1015, 111, 'Helen'),
( 1016, 118, 'Lucas'),
( 1017, 119, 'Helen'),
( 1018, 118, 'Juan'),
( 1019, 121, 'Patricio'),
( 1020, 120, 'Paul'),
( 1021, 120, 'Patricio'),
( 1022, 115, 'Patricio'),
( 1023, 118, 'Lucas'),
( 1024, 118, 'Juan'),
( 1025, 115, 'Juan');

/*==============================================================*/
/* Table: HABITACION                                            */
/*==============================================================*/
INSERT INTO HABITACION VALUES
( 201, 'Basico', 450.25, 3), --No Habitacion: 1-5
( 202, 'Premium', 900.5, 5), --No Habitacion: 6-10
( 203, 'Con muebleria exotica', 750.75, 2), --No Habitacion: 11-15
( 204, 'Con Jacuzzi', 525.64, 4), --No Habitacion: 16-20
( 205, 'Con juguetes sexuales', 800.35, 2); --No Habitacion: 21-25

/*==============================================================*/
/* Table: MANTENIMIENTO                                         */
/*==============================================================*/
INSERT INTO MANTENIMIENTO VALUES
( 301, 201, 5, 'Limpieza'),
( 302, 201, 2, 'Instrumentos Electricos'),
( 303, 202, 7, 'Hidraulicos'),
( 304, 202, 10, 'Muebleria'),
( 305, 203, 12, 'Limpieza'),
( 306, 203, 15, 'Muebleria');

/*==============================================================*/
/* Table: EMPRESA_CONVENIO                                      */
/*==============================================================*/
INSERT INTO EMPRESA_CONVENIO VALUES
( 501, 'Quinteros', 'Tiene convenio por motivo de transportistas'),
( 502, 'Martinez', 'Tiene convenio por motivo de transportistas'),
( 503, 'Gonzalez', 'Tiene convenio por motivo de transportistas');

/*==============================================================*/
/* Table: CONVENIO                                              */
/*==============================================================*/
INSERT INTO CONVENIO VALUES
( 401, 1, 501),
( 402, 2, 501),
( 403, 3, 501),
( 404, 4, 502),
( 405, 5, 503),
( 406, 6, 503),
( 407, 6, 502),
( 408, 2, 501),
( 409, 4, 501),
( 410, 5, 502),
( 411, 5, 502),
( 412, 6, 502);

/*==============================================================*/
/* Table: ESTANDIA                                              */
/*==============================================================*/
INSERT INTO ESTANDIA VALUES
( 9001, 1, 105, 1012, 204, 'Buen estado', '16/05/2019', '08:00:00', '12:00:00'),
( 9002, 1, 104, 1010, 205, 'Regular estado', '12/10/2020', '09:00:00', '13:00:00'),
( 9003, 1, 103, 1009, 201, 'Mal estado', '06/11/2019', '10:00:00', '14:00:00'),
( 9004, 1, 102, 1009, 201, 'Buen estado', '19/09/2019', '11:00:00', '15:00:00'),
( 9005, 1, 101, 1008, 202, 'Buen estado', '21/03/2019', '12:00:00', '16:00:00'),
( 9006, 1, 101, 1005, 202, 'Mal estado', '22/02/2020', '13:00:00', '17:00:00'),
( 9007, 1, 101, 1006, 202, 'Mal estado', '29/01/2020', '14:00:00', '18:00:00'),
( 9008, 2, 101, 1005, 203, 'Regular estado', '30/06/2018', '15:00:00', '19:00:00'),
( 9009, 2, 102, 1012, 203, 'Regular estado', '05/07/2018', '16:00:00', '20:00:00'),
( 9010, 2, 102, 1011, 203, 'Regular estado', '07/08/2021', '17:00:00', '21:00:00'),
( 9011, 2, 103, 1001, 202, 'Mal estado', '08/12/2021', '18:00:00', '22:00:00'),
( 9012, 3, 103, 1002, 204, 'Buen estado', '09/10/2020', '19:00:00', '23:00:00'),
( 9013, 3, 104, 1002, 205, 'Buen estado', '10/05/2018', '20:00:00', '24:00:00'),
( 9014, 3, 104, 1003, 204, 'Buen estado', '11/06/2019', '21:00:00', '23:00:00'),
( 9015, 3, 103, 1009, 205, 'Buen estado', '12/08/2019', '20:00:00', '24:00:00'),
( 9016, 4, 102, 1008, 205, 'Buen estado', '13/07/2020', '19:00:00', '23:00:00'),
( 9017, 4, 103, 1010, 202, 'Mal estado', '14/09/2020', '18:00:00', '22:00:00'),
( 9018, 4, 102, 1010, 203, 'Regular estado', '15/04/2021', '16:00:00', '21:00:00'),
( 9019, 5, 101, 1006, 204, 'Buen estado', '16/02/2019', '15:00:00', '20:00:00'),
( 9020, 5, 104, 1003, 202, 'Buen estado', '17/01/2021', '14:00:00', '19:00:00'),
( 9021, 5, 103, 1008, 201, 'Regular estado', '18/07/2018', '13:00:00', '18:00:00');
