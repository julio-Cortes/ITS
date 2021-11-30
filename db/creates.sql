CREATE table orders(
    OrderID SERIAL PRIMARY KEY ,
    CustomerID integer,
    EmployeeID integer,
    OrderDate date

);
CREATE TABLE Customers(
    CustomerID SERIAL PRIMARY KEY ,
    CustomerName varchar(500),
    ContactName varchar(500),
    Country varchar(500),
    Address varchar(500),
    City varchar(500),
    PostalCode varchar(500)
);

CREATE TABLE CHOFER (
    id serial PRIMARY KEY ,
    nombre varchar(50),
    apellido varchar(50)
);

CREATE TABLE RECORRIDO(
    nombre varchar(100)
);
CREATE TABLE BUS(
    patente varchar(100)
);
CREATE TABLE CAPACITACION(
    chofer integer,
    recorrido varchar(100),
    foreign key (chofer)
        references CHOFER(id),
    foreign key (recorrido)
        references RECORRIDO(nombre)
);
CREATE TABLE VIAJE(
    id serial PRIMARY KEY ,
    chofer integer,
    recorrido varchar(100),
    bus varchar(100),
    inicio timestamp,
    fin timestamp,
    foreign key (chofer)
        references CHOFER(id),
    foreign key (recorrido)
        references RECORRIDO(nombre),
    foreign key (bus)
        references BUS(patente)
);


CREATE TABLE PAIS(
    nombre varchar(300),
    impuesto float8,
    costo_envio float8
);

CREATE TABLE PRODUCTO(
    id integer,
    nombre varchar(300),
    precio float8,
    origen varchar(300),
    foreign key(origen)
        references PAIS(nombre)

);

CREATE TABLE  DISPONIBILIDAD(
    producto integer,
    pais varchar(300),
    foreign key (producto)
                            references PRODUCTO(id),
    foreign key (pais)
                            references PAIS(nombre)
);

CREATE TABLE VENTA(
    id integer,
    fecha date,
    destino varchar(300),
    direccion varchar(300),
    foreign key (destino)
                  references PAIS(nombre)

);

CREATE TABLE PRODUCTOVENTA(
    venta integer,
    producto integer,
    cantidad integer,
    foreign key (venta)
                          references VENTA(id),
                          foreign key (producto)
                          references PRODUCTO(id)
);

INSERT INTO Pais(nombre, impuesto, costo_envio) values ('Estados Unidos', 0.2, 1000);
INSERT INTO Pais(nombre, impuesto, costo_envio) values ('Bélgica', 0.2, 1000);
INSERT INTO Pais(nombre, impuesto, costo_envio) values ('Chile', 0.2, 1000);
INSERT INTO Producto(id, nombre, precio, origen) values (1, 'Chocolate',
1000,'Estados Unidos' );
INSERT INTO Producto(id, nombre, precio, origen) values (2, 'Helado', 2000,
'Bélgica');
INSERT INTO Venta(id, destino, direccion ) values (3,'Chile','San Carlos de Apoquindo 2200');
INSERT INTO ProductoVenta(venta, producto, cantidad ) values (3, 1, 5 );

INSERT INTO Chofer(id, nombre, apellido) values (1, 'Maria', 'Marfan');
INSERT INTO Chofer(id, nombre, apellido) values (2, 'Pepe', 'Binder');
INSERT INTO Recorrido( nombre) values ('Los Trapenses');
INSERT INTO Bus(patente) values ('VD345E');
INSERT INTO Capacitacion(chofer, recorrido) values (1,'Los Trapenses');
INSERT INTO Viaje (id, chofer, recorrido, bus, inicio, fin) values (1, 1, 'Los Trapenses',  'VD345E', '2008-01-01 00:00:01', '2008-01-01 10:00:01');