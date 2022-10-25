--Tabla asistentes
create table asistentes(
       clave_asis int, 
       clave_serv2 int,
	   tipo_asistentes varchar(20) not null,
       nombre varchar(100) not null,
       tipo_documento varchar(20) null,
       num_documento varchar(20) null,
       direccion varchar(70) null,
       telefono varchar(20) null,
       email varchar(50) null,	
	   constraint pk_ca primary key(clave_asis)
	   constraint fk_cserv2 foreign key(clave_serv2) references servicios(clave_serv)
);

--Tabla servicios 
create table servicios(
       clave_serv int,
       nombre varchar(100) not null unique,
       precio_venta decimal(11,2) not null,
       descripcion varchar(256) null,
       estado bit default(1),
	   constraint pk_cs primary key(clave_serv)
);

--Tabla producto
create table producto(
	   clave_pro int,
 	   clave_serv1 int,
       nombre varchar(100) not null unique,
       precio_venta decimal(11,2) not null,
       descripcion varchar(256) null,
       estado bit default(1),
	   constraint pk_cp primary key(clave_pro),
	   constraint fk_cserv foreign key(clave_serv1) references servicios(clave_serv)
);

--Tabla usuario
create table usuario(
       clave_usua int,
       clave_serv3 int,
       nombre varchar(100) not null,
       tipo_documento varchar(20) null,
       num_documento varchar(20) null,
       direccion varchar(70) null,
       telefono varchar(20) null,
       email varchar(50) not null,
       password varbinary not null,
       estado bit default(1),
	   constraint pk_cu primary key(clave_usua),
	   constraint fk_cserv3 foreign key(clave_serv3) references servicios(clave_serv)
);

--Tabla cliente
create table cliente(
       clave_clie int,
	   clave_asis2 int,
       tipo_cliente varchar(20) not null,
       nombre varchar(100) not null,
       tipo_documento varchar(20) null,
       num_documento varchar(20) null,
       direccion varchar(70) null,
       telefono varchar(20) null,
       email varchar(50) null,
	 constraint pk_cc primary key(clave_clie)
	 constraint fk_fasis2 foreign key(clave_asis2) references asistentes(clave_asis)
);

--Tabla venta
create table venta(
       clave_vent int,
	   clave_clie1 int,
	   clave_usua1 int,
       tipo_comprobante varchar(20) not null,
       num_comprobante varchar (10) not null,
       fecha_hora datetime not null,
       cantidad integer not null,
       precio decimal(11,2) not null,
	   descuento decimal(11,2) not null,
       impuesto decimal (4,2) not null,
       total decimal (11,2) not null,
       estado varchar(20) not null,
	   constraint pk_cv primary key(clave_vent),
	   constraint fk_cusua1 foreign key(clave_usua1) references usuario(clave_usua)
	   constraint fk_clie1 foreign key(clave_clie1) references cliente(clave_clie)
);
