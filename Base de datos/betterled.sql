create database betterled;

-- Tabla servicios 
create table Servicios(
	serviciosID int primary key,
	nombre varchar(100) not null unique,
	precio_venta decimal(11,2) not null
);


-- Tabla venta
create table Ventas(
	ventaID int primary key,
	serviciosID int not null,
	total decimal (11,2) not null,
	detalle_ventaID int not null,
	FOREIGN KEY (serviciosID) REFERENCES Servicios(serviciosID)
);


-- Tabla Detalle_Venta
create table Detalle_venta(
	detalle_ventaID int primary key,
	ventaID int not null,
	precio decimal (11,2) not null,
	fecha_hora datetime not null,
	serviciosID int not null,
	FOREIGN KEY (ventaID) REFERENCES Ventas(ventaID)
);


-- Tabla usuario
create table Usuarios(
	usuarioID int primary key,
	detalle_ventaID integer not null,
	nombres varchar(100) not null,
	apellidos varchar(100) not null,
	num_documento varchar(20) null,
	dir_u varchar(70) null,
	tel_u varchar(20) null,
	email varchar(50) not null,
	password_u varbinary(8) not null,
	FOREIGN KEY (detalle_ventaID) REFERENCES Detalle_venta(detalle_ventaID)
)

-- El CRUD no me sale el inner join pero en la base de datos si.

-- select nombre,precio_venta
-- from servicios inner join ventas on servicios.precio_venta=ventas.total;