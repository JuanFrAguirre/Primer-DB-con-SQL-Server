



--create database TheTastyCake

--use thetastycake

create table localidades
(
  id_localidad int identity,
  localidad varchar(50),
  constraint PK_localidades primary key (id_localidad)
)

create table barrios
(
  id_barrio int identity,
  barrio varchar(50),
  id_localidad int,
  constraint PK_barrios primary key (id_barrio),
  constraint FK_Barrios_Localidades foreign key (id_localidad)
references localidades (id_localidad)
)

create table clientes
(
  id_cliente int identity,
  nombre VARCHAR(50),
  apellido varchar(50),
  telefono bigint,
  email VARCHAR(50),
  domicilio VARCHAR(50),
  id_barrio int,
  constraint pk_clientes primary key (id_cliente),
  constraint fk_clientes_barrios foreign key (id_barrio) references barrios (id_barrio)
)

create table tamanos
(
  id_tamano int identity,
  tamano varchar(50),
  constraint pk_tamanos primary key (id_tamano)
)

create table variedades
(
  id_variedad int identity,
  variedad varchar(50),
  constraint pk_variedades primary key (id_variedad)
)

create table tortas
(
  id_torta int identity,
  nombre varchar(50),
  precio money,
  id_variedad int,
  id_tamano int,
  constraint pk_tirtas primary key (id_torta),
  constraint fk_tortas_tamanos foreign key (id_tamano) references tamanos (id_tamano),
  constraint fk_tortas_variedades foreign key (id_variedad) references variedades (id_variedad)
)

create table pedidos
(
  id_pedido int identity,
  fecha_pedido datetime,
  id_cliente int,
  constraint pk_pedidos primary key (id_pedido),
  constraint fk_pedidos_clientes foreign key (id_cliente) references clientes (id_cliente)
)

create table horarios_entrega
(
  id_horario int identity,
  horario varchar(10),
  constraint pk_horario primary key (id_horario)
)

create table detalle_pedidos
(
  id_detalle int IDENTITY,
  id_pedido int,
  id_torta int,
  total money,
  domicilio_entrega varchar(150),
  fecha_entrega date,
  id_horario int,
  constraint pk_detalle primary key (id_detalle),
  constraint fk_detalle_pedidos foreign key (id_pedido) references pedidos (id_pedido),
  constraint fk_detalle_tortas foreign key (id_torta) references tortas (id_torta),
  constraint fk_detalle_horarios foreign key (id_horario) references horarios_entrega (id_horario)
)








