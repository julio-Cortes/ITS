INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (11, 'Si tengo la siguiente tabla: Pais(*nombre*, impuesto, costo_envio) ¿Cómo sería la creación de la siguiente tabla? Producto(*id*, nombre, precio, origen) donde origen es clave foránea de País.', 'Recordar que REFERENCE es para crear FOREIGN KEY',2, NULL,2,2);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Producto(id, nombre varchar(50) NOT NULL, precio INTEGER NOT NULL, origen varchar(50) NOT NULL REFERENCES Pais(nombre));',false,11);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Producto(id serial PRIMARY KEY, nombre varchar(50) NOT NULL, precio INTEGER NOT NULL, origen varchar(50) NOT NULL REFERENCES Pais(nombre));',true,11);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Producto(id serial PRIMARY KEY, nombre varchar(50) NOT NULL, precio INTEGER NOT NULL, origen varchar(50) NOT NULL);',false,11);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Producto(id serial PRIMARY KEY, nombre varchar(50) NOT NULL, precio INTEGER NOT NULL, origen varchar(50) NOT NULL REFERENCES Pais(*));',false,11);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (12, 'Se tiene el siguiente modelo: INGENIERO(*rut*, nombre, apellido) PROYECTO(*nombre*, rut_jefe) COOPERA(*proyecto*, *rut_ingeniero*, sueldo) donde:  PROYECTO(rut_jefe) es clave foránea de INGENIERO(rut) COOPERA(proyecto) es clave foránea de PROYECTO(nombre) COOPERA(rut_ingeniero) es clave foránea de INGENIERO(rut). ¿Cómo sería la creación de la tabla Coopera, considerando que las otras ya fueron creadas?', 'Una clave foránea es una columna o grupo de columnas de una tabla que contiene valores que coinciden con la clave primaria de otra tabla',2, NULL,3,2);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Coopera (
        proyecto varchar(30) REFERENCES Proyecto(nombre),
        rut_ingeniero varchar(10) REFERENCES Ingeniero(rut),
        sueldo integer,
        PRIMARY KEY(proyecto, rut_ingeniero)
     );',true,12);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Coopera (
        proyecto varchar(30),
        rut_ingeniero varchar(10) REFERENCES Ingeniero(rut),
        sueldo integer,
        PRIMARY KEY(proyecto, rut_ingeniero)
     );',false,12);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Coopera (
        proyecto varchar(30) REFERENCES Proyecto(nombre),
        rut_ingeniero varchar(10) REFERENCES Ingeniero(rut),
        sueldo integer
     );',false,12);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Coopera (
        proyecto varchar(30) REFERENCES Proyecto(nombre),
        rut_ingeniero varchar(10),
        sueldo integer,
        PRIMARY KEY(proyecto, rut_ingeniero)
     );',false,12);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (13, '¿En la siguiente tabla, a que corresponde "PK_Person"? 
CREATE TABLE Persons ( 
     ID int NOT NULL, 
     LastName varchar(255) NOT NULL, 
     FirstName varchar(255), 
     Age int, 
     CONSTRAINT PK_Person PRIMARY KEY (ID,LastName) 
);', 'Recordar que CONSTRAINT son reglas y restricciones predefinidas que se aplican en una sola columna o en varias columnas, con respecto a los valores permitidos en las columnas, para mantener la integridad, precisión y confiabilidad de los datos de esa columna.',2, NULL,2,2);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Está erróneo, quiere decir que hay 2 PRIMARY KEY y eso no puede suceder.',false,13);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Es una PRIMARY KEY que se compone de dos columnas.',true,13);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Junta ID y LastName para hacer una PRIMARY KEY, por ejemplo 1_Marfan (ID_LastName).',false,13);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Ninguna de las anteriores.',false,13);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (14, '¿Se puede crear una PRIMARY KEY constraint, luego de crear la tabla?', 'Una clave principal es una columna o un conjunto de columnas que identifica de forma única cada fila de una tabla. Se llama CONSTRAINT porque hace que el sistema restrinja los datos permitidos en estas columnas.',2, NULL,1,2);
INSERT INTO alternatives (text, correct, question_id) VALUES ('No, una vez que se crea la tabla las PRIMARY KEY no se pueden modificar.',false,14);
INSERT INTO alternatives (text, correct, question_id) VALUES ('No, ya que las PRIMARY KEY al ser lo más importante del elemento no se pueden modificar en ningún momento.',false,14);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Si, con ALTER TABLE se puede crear una PRIMARY KEY constraint.',true,14);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Si, con ALTER TABLE pero solo si es numérica.',false,14);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (15, 'Se quiere crear una tabla de Orders que tiene una FOREIGN KEY de la tabla Persons, ¿Cuál de las siguientes alternativas representaría lo anterior?', '',2, NULL,3,2);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Persons ( 
         OrderID int NOT NULL, 
         OrderNumber int NOT NULL, 
         PersonID int, 
         PRIMARY KEY (OrderID), 
         FOREIGN KEY (PersonID) REFERENCES Orders(PersonID) 
    );',false,15);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Orders ( 
         OrderID int NOT NULL, 
         OrderNumber int NOT NULL, 
         PersonID int, 
         PRIMARY KEY (OrderID), 
         FOREIGN KEY (PersonID) 
    );',false,15);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Orders ( 
         OrderID int NOT NULL, 
         OrderNumber int NOT NULL, 
         PersonID int, 
         PRIMARY KEY (OrderID), 
         FOREIGN KEY (PersonID) REFERENCES Persons(PersonID) 
    );',true,15);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Orders ( 
         OrderID int NOT NULL, 
         OrderNumber int NOT NULL, 
         PRIMARY KEY (OrderID), 
         FOREIGN KEY (PersonID) REFERENCES Persons(PersonID) 
    );',false,15);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (16, '¿La siguiente consulta de SQL representa correctamente la creación de una FOREIGN KEY constraint?     
CREATE TABLE Orders ( 
     OrderID int NOT NULL, 
     OrderNumber int NOT NULL, 
     PersonID int, 
     PRIMARY KEY (OrderID), 
     CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) 
     REFERENCES Persons(PersonID) 
);', 'FOREIGN KEY es una clave de base de datos que se utiliza para vincular dos tablas. La restricción de clave externa identifica las relaciones entre las tablas de la base de referencia a una columna o conjunto de columnas, en el Niño tabla que contiene la clave externa, a la columna de clave principal o conjunto de columnas, en el Padre mesa.',2, NULL,1,2);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Verdadero',true,16);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Falso',false,16);   


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (17, '¿Cuál de las siguientes alternativas reprensenta correctamente el crear una FOREIGN KEY constraint en la columna "PersonID" cuando la tabla "Persons" ya está creada?', 'Recordar que la sentencia ALTER TABLE sirve para modificar la estructura de una tabla que ya existe.',2, NULL,2,2);
INSERT INTO alternatives (text, correct, question_id) VALUES ('ALTER TABLE Orders ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);',true,17);
INSERT INTO alternatives (text, correct, question_id) VALUES ('ALTER TABLE Persons ADD FOREIGN KEY (PersonID) REFERENCES Orders(PersonID);',false,17);
INSERT INTO alternatives (text, correct, question_id) VALUES ('ALTER TABLE Orders ADD FOREIGN KEY (PersonID);',false,17);
INSERT INTO alternatives (text, correct, question_id) VALUES ('TABLE Orders ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);',false,17);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (18, '¿Se puede eliminar una FOREIGN KEY constraint después de crearla?', 'Recordar que el comando DROP permite eliminar definitivamente una tabla. Se elimina la tabla y su contenido.',2, NULL,1,2);
INSERT INTO alternatives (text, correct, question_id) VALUES ('No',false,18);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Si, con ALTER TABLE Orders DROP FOREIGN KEY FK_PersonOrder;',true,18);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Si, con TABLE Orders DROP FOREIGN KEY FK_PersonOrder;',false,18);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Si, con ALTER TABLE Orders FOREIGN KEY FK_PersonOrder; ',false,18);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (19, 'Se tiene el siguiente modelo: 
ALUMNO(*rut*, nombres, apellidos) 
CURSO(*sigla*, nombre) 
SECCION(*nrc*, curso, semestre, ayudante) 
INSCRIPCION(*nrc*, *rut*, nota) 
donde 
SECCION(ayudante) es clave foránea de ALUMNO(rut). 
¿Cuál de las siguientes consultas hace la creación de la tabla Inscripcion, considerando que las otras ya fueron creadas?', 'Recordar usar REFERENCE para FOREIGN KEY y siempre poner PRIMARY KEY',2, NULL,3,2);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Inscripcion ( 
       nrc integer, 
       rut varchar(10) REFERENCES Alumno(rut), 
       nota real, 
       PRIMARY KEY(nrc, rut) 
    );',false,19);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Inscripcion ( 
       nrc integer REFERENCES Seccion(nrc), 
       rut varchar(10), 
       nota real, 
       PRIMARY KEY(nrc, rut) 
    );',false,19);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Inscripcion ( 
       nrc integer REFERENCES Seccion(nrc), 
       rut varchar(10) REFERENCES Alumno(rut), 
       nota real 
    );',false,19);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Inscripcion ( 
       nrc integer REFERENCES Seccion(nrc), 
       rut varchar(10) REFERENCES Alumno(rut), 
       nota real, 
       PRIMARY KEY(nrc, rut) 
    );',true,19);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (20, '¿Para qué sirve el comando REFERENCES?', 'Recordar que REFERENCES tiene relación con las FOREIGN KEY',2, NULL,1,2);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Para referenciar a un campo de una tabla hija.',true,20);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Para crear las columnas.',false,20);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Para referenciarse a sí misma.',false,20);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Ninguna de las anteriores.',false,20);

INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (37, 'Ingrese la consulta de SQL para crear una PRIMARY KEY constraint en la columna "CustomerID" de la tabla Customers ya creada.', 'Recuerde que para modificar utilizamos ALTER',1, 'ALTER TABLE Customers ADD PRIMARY KEY (CustomerID);',1,2);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (38, 'Si tengo las siguientes tablas: 
Pais(*nombre*, impuesto, costo_envio) 
Producto(*id*, nombre, precio, origen) donde origen en clave foránea de País 
Cree la tabla Disponibilidad_2(producto, pais) donde producto clave foranea de Producto y pais clave foranea de Pais.', 'Recuerde poner PRIMARY KEY de 2 columnas',1, 'CREATE TABLE Disponibilidad_2(
producto integer references producto(ID),
pais varchar(50) references pais(nombre),
PRIMARY KEY(producto,pais));',2,2);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (39, 'Si tengo las siguientes tablas: 
Pais(*nombre*, impuesto, costo_envio) 
Producto(*id*, nombre, precio, origen) donde origen en clave foránea de País 
Disponibilidad(*producto*, *pais*) 
Cree la tabla Venta_2(*id*, fecha, destino, dirección) donde destino clave foranea de Pais y direccíón no nulo.', 'Recuerde poner PRIMARY KEY y FOREIGN KEY.',1, 'CREATE TABLE Venta_2 ( 
id integer PRIMARY KEY, 
fecha date, 
destino varchar(50) references Pais(nombre), 
direccion varchar(50) NOT NULL, 
);',3,2);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (40, 'Si tengo las siguientes tablas: 
Pais(*nombre*, impuesto, costo_envio) 
Producto(*id*, nombre, precio, origen) donde origen en clave foránea de País 
Disponibilidad(*producto*, *pais*) 
Venta(*id*, fecha, destino, dirección) donde destino clave foranea de Paisy direccíón no nulo 
Cree la tabla PRODUCTOVENTA_2(*venta*, *producto*, cantidad) donde venta clave foranea de Venta y producto clave foranea de Producto y cantidad no nulo.', 'Recuerde poner PRIMARY KEY y ambas FOREIGN KEY.',1, 'CREATE TABLE PRODUCTOVENTA_2(
venta integer references Venta(id), 
producto varchar(50) references Producto(nombre),  
Cantidad integer NOT NULL 
PRIMARY KEY (venta, producto) 
);',3,2);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (41, 'Cree la tabla Persons(PersonID, LastName, FirstName, Address, City) todos con un máximo de 255 carácteres.', 'Recuerde que para poner el límite de varchar es varchar(número máximo)',1,'CREATE TABLE Persons ( 
    PersonID int, 
    LastName varchar(255), 
    FirstName varchar(255), 
    Address varchar(255), 
    City varchar(255) 
);',1,3);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (42, 'Cree la tabla Persons(PersonID, LastName, FirstName, Address, City) todos con un máximo de 255 carácteres y que la city sea siempre "Sandnes".', 'Recuerde que para poner un valor fijo se debe usar el comando DEFAULT',1,'CREATE TABLE Persons ( 
    PersonID int, 
    LastName varchar(255), 
    FirstName varchar(255), 
    Address varchar(255), 
    City varchar(255) DEFAULT "Sandnes" 
);',2,3);