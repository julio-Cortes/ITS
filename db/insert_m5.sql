
---MÓDULO 5 JOINS EN SQL:

---1- ALTERNATIVA --> Media

INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (51, '
  Se tiene el siguiente modelo:

  ALUMNO(*rut*, nombres, apellidos)
  CURSO(*sigla*, nombre)
  SECCION(*nrc*, curso, semestre, ayudante)
  INSCRIPCION(*nrc*, *rut*, nota)
  donde: 

  SECCION(ayudante) es clave foránea de ALUMNO(rut).

  Indique que pregunta responde la siguiente consulta:

  Cantidad de ayudantías realizadas por cada alumno, incluyendolos a todos.', 'Recordar que LEFT JOIN devuelve todos los registros de la tabla izquierda y los registros coincidentes de la tabla derecha.', 2, NULL, 2,5);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT rut, COUNT(*) FROM Alumno LEFT JOIN Seccion ON ayudante=rut GROUP BY rut;'
, true ,51);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT rut FROM Alumno LEFT JOIN Seccion ON ayudante=rut GROUP BY rut;'
, false ,51);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT rut, COUNT(*) FROM Alumno JOIN Seccion WHERE ayudante=rut GROUP BY rut;'
,false,51);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT rut FROM Alumno JOIN Seccion WHERE ayudante=rut GROUP BY rut;'
,false,51);



---2- ALTERNATIVA --> Dificil

INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (50, 'Se tiene el siguiente modelo:
  CHOFER(*id* nombre, apellido)
  RECORRIDO(*nombre*)
  BUS(*patente*)
  CAPACITACION(*chofer*, *recorrido), donde chofer es clave foránea de Chofer(id) y recorrido clave foránea de Recorrido(nombre). 
  Además, los Choferes se capacitan en diferentes recorridos
  VIAJE(*id*, chofer, recorrido, bus, inicio, fin) donde chofer y recorrido son clave foránea de Capacitacion(chofer, recorrido) y bus claveforánea de Bus(patente).
  Además, un chofer no puede tomar un viaje si no esta capacitado en ese recorrido.
  ¿Cuál de las siguientes consultas muestra para cada recorrido su nombre y la cantidad de choferes capacitados para realizarlo, incluyendo los recorridos sin choferes capacitados.? ', 'Recordar que LEFT JOIN devuelve todos los registros de la tabla izquierda y los registros coincidentes de la tabla derecha.', 2, NULL, 3,5);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT r.nombre , COUNT (*) FROM Recorrido r LEFT JOIN Capacitacion c ON c.recorrido = r.nombre GROUP BY r.nombre;'
,true,50);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT r.nombre FROM Recorrido r LEFT JOIN Capacitacion c ON c.recorrido = r.nombre GROUP BY r.nombre;'
,false,50);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT r.nombre , COUNT (*) FROM Recorrido r LEFT JOIN Capacitacion c ON c.recorrido = r.nombre;'
,false,50);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT r.nombre , COUNT (*) FROM Recorrido r LEFT JOIN Capacitacion c GROUP BY r.nombre;'
,false,50);


---3- ALTERNATIVA --> Facil
INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (52, 'Indique si la siguiente afirmación es verdadera o falsa: 
  SELECT * FROM T1,T2 WHERE T1.a=T2.a en cualquier caso es equivalente a SELECT * FROM T1 JOIN T2 ON T1.a=T2.a', 'Recordar que una cláusula JOIN se usa para combinar filas de dos o más tablas, según una columna relacionada entre ellas..', 2, NULL, 1,5);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Verdadero'
,true,52);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Falso'
,false,52);



---4- ALTERNATIVA --> Dificil
INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (53, 'Si tengo 2 tablas T1(*a*,b,c) y T2(*d*,e,a), donde T1 tiene 5 tuplas, y el resultado de SELECT * FROM T1 NATURAL JOIN T2 son 4 tuplas. 
   Indique si la siguiente afirmación es verdadera o falsa: 
   No es posible determinar cuantas tuplas en T2 no tienen representación en T1.', 'Recordar que Con NATURAL JOIN se relacionan dos tablas con los nombres de las columnas que tienen en común.', 2, NULL, 3,5);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Falso',false,53);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Verdadero',true,53);


---5- ALTERNATIVA --> Media
INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (54, 'Si tengo 2 tablas T1(*a*,b,c) y T2(*d*,e,a),y al hacer SELECT * FROM T1 NATURAL JOIN T2 obtengo 10 tuplas, y con SELECT * FROM T1 NATURAL LEFT JOIN T2 obtengo 12 tuplas.
   ¿Qué valor entrega la consulta SELECT COUNT(d) FROM T1 NATURAL LEFT JOIN T2?', 'Recordar que Con NATURAL JOIN se relacionan dos tablas con los nombres de las columnas que tienen en común.', 2, NULL, 2,5);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('10',true,54);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('5',false,54);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('7',false,54);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('9',false,54);



---6- ALTERNATIVA --> Media

INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (55, 'Si tengo 2 tablas T1(*a*,b,c) y T2(*d*,e,f) donde 'f' en T2 es clave foránea hacia 'a' en T1, y además 'f' se define como NOT NULL. Seleccione la afirmación correcta.', 'Recordar que LEFT JOIN mantiene todas las filas de la tabla izquierda. Las filas de la tabla derecha se mostrarán si hay una coincidencia con las de la izquierda. Si existen valores en la tabla izquierda pero no en la tabla derecha, ésta mostrará null.
   En cambio, con RIGHT JOIN se mantienen todas las filas de la tabla derecha. Las filas de la tabla izquierda se mostrarán si hay una coincidencia con las de la derecha. Si existen valores en la tabla derecha pero no en la tabla izquierda, ésta se mostrará null.', 2, NULL, 2,5);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Siempre T1 JOIN T2 ON a=f será equivalente a T1 LEFT JOIN T2 ON a=f'
,false,55);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Siempre T1 LEFT JOIN T2 ON a=f será equivalente a T1 RIGHT JOIN T2 ON a=f'
,false,55);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT * FROM T1,T2 WHERE T1.a=T2.a en cualquier caso es equivalente a SELECT * FROM T1 NATURAL JOIN T2'
,false,55);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Siempre T1 JOIN T2 ON a=f será equivalente a T1 RIGHT JOIN T2 ON a=f'
,true,55);

---7- ALTERNATIVA --> Dificil
INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (56, 'Se tienen dos tablas: T1(*a*, b,c) y T2(*d*, a, b) con los siguientes datos:
   *a* *b* *c*
   9 4 4
   3 3 2
   5 4 8
   7 1 4
   *d* *a* *b*
   9 9 4
   3 5 4
   5 9 4
   6 7 1
   1 7 1
   2 null null
     ¿Cuántas columnas y tuplas tendrá el resultado de la siguiente consulta? SELECT * FROM T1 RIGHT JOIN T2 ON T1.b>T2.a;', 'Recordar que LEFT JOIN devuelve todos los registros de la tabla derecha y los registros coincidentes de la tabla izquierda.', 2, NULL, 3,5);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('5 columnas y 9 tuplas'
,false,56);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('6 columnas y 6 tuplas'
,true,56);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('3 columnas y 3 tuplas'
,false,56);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Ninguna de las anteriores'
,false,56);



---8- ALTERNATIVA --> Dificil
INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (57, 'Se tienen dos tablas: T1(*a*, b,c) y T2(*d*, a, b) con los siguientes datos:
   *a* *b* *c*
   9 4 4
   3 3 2
   5 4 8
   7 1 4
   *d* *a* *b*
   9 9 4
   3 5 4
   5 9 4
   6 7 1
   1 7 1
   2 null null
     ¿Cuántas columnas y tuplas tendrá el resultado de la siguiente consulta? SELECT * FROM T1 LEFT JOIN T2 USING(b);', 'Recordar que LEFT JOIN devuelve todos los registros de la tabla derecha y los registros coincidentes de la tabla izquierda.', 2, NULL, 3,5);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('5 columnas y 9 tuplas'
,true,57);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('6 columnas y 6 tuplas'
,false,57);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('3 columnas y 3 tuplas'
,false,57);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Ninguna de las anteriores'
,false,57);



---9- ALTERNATIVA --> Facil
INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (58, 'Si tengo una tabla de Clientes(ClienteId, Nombre, Contacto, País) y otra de Pedidos(PedidoId, ClienteId, Fecha).
  Seleccione las partes que faltan en la cláusula JOIN para unir las dos tablas Pedidos y Clientes, utilizando el campo ClienteID en ambas tablas como la relación entre las dos tablas.
  SELECT * FROM Orders LEFT JOIN Customers *x*=*y*;', 'Recordar que LEFT JOIN devuelve todos los registros de la tabla izquierda y los registros coincidentes de la tabla derecha.', 2, NULL, 1,5);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('x= ON Clientes.ClienteId ; y= Pedidos.ClienteId'
,true,58);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('x= ON Clientes.Nombre ; y= Pedidos.ClienteId'
,false,58);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('x= Clientes.ClienteId ; y= Pedidos.ClienteId'
,false,58);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('x= Clientes.Nombre ; y= Pedidos.ClienteId'
,false,58);



---10- ALTERNATIVA --> Facil

INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (59, 'Si tengo una tabla de Clientes(ClienteId, Nombre, Contacto, País) y otra de Pedidos(PedidoId, ClienteId, Fecha).
  Seleccione las partes que faltan en la cláusula JOIN para unir las dos tablas Pedidos y Clientes, utilizando el campo ClienteID en ambas tablas como la relación entre las dos tablas.
  SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders *x*=*y*
ORDER BY Customers.CustomerName;', 'Recordar que La palabra clave FULL OUTER JOIN devuelve todos los registros cuando hay una coincidencia en los registros de la tabla izquierda o derecha.', 2, NULL, 1,5);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('x= ON Pedidos.PedidoId; y= Clientes.ClienteId'
,false,59);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('x= ON Clientes.Nombre ; y= Pedidos.ClienteId'
,false,59);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('x= ON Clientes.ClienteId ; y= Pedidos.ClienteId'
,true,59);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('x= Clientes.Nombre ; y= Pedidos.ClienteId'
,false,59);




---11- DESARROLLO facil

INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (60, 'Se tiene el siguiente modelo:
  ORDERS(*OrderID*, CustomerID, OrderDate)
  Customers(*CustomerID*,CustomerName, ContactName, Country, Address, City,PostalCode,Country ).
   Cree una consulta que que seleccionetodas las órdenes con la infromación de sus clientes. ', 'Recuerde que puede usar JOIN para unir dos tablas.', 1, 'SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;', 1,5);

---12- DESARROLLO facil
INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (61, 'Se tiene el siguiente modelo:
  ORDERS(*OrderID*, CustomerID, OrderDate)
  Customers(*CustomerID*,CustomerName, ContactName, Country, Address, City,PostalCode,Country ).
   Cree una consulta que que seleccione registros que tienen valores coincidentes en ambas tabla. ', 'Recuerde que puede usar JOIN para unir dos tablas.', 1, 'SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;', 1,5);

---13- DESARROLLO media 
INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (62, 'Se tiene el siguiente modelo:
  CHOFER(*id* nombre, apellido)
  RECORRIDO(*nombre*)
  BUS(*patente*)
  CAPACITACION(*chofer*, *recorrido*), donde chofer es clave foránea de Chofer(id) y recorrido clave foránea de Recorrido(nombre). 
  Además, los Choferes se capacitan en diferentes recorridos
  VIAJE(*id*, chofer, recorrido, bus, inicio, fin) donde chofer y recorrido son clave foránea de Capacitacion(chofer, recorrido) y bus claveforánea de Bus(patente). Además, un chofer no puede tomar un viaje si no esta capacitado en ese recorrido y el inicio y fin son timestams. 
   Cree una consulta que para cada recorrido con su nombre y la cantidad de choferes capacitados para realizarlo, incluyendo los recorridos sin choferes capacitados.', 'Recuerde que puede usar COUNT(*) para contar el número de choferes y JOIN para unir dos tablas.', 1, 'SELECT r.nombre , COUNT (*)
FROM Recorrido r LEFT JOIN Capacitacion c ON c.recorrido = r.nombre
GROUP BY r.nombre;', 2,5);

---14- DESARROLLO media
INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (63, 'Se tiene el siguiente modelo:
  ORDERS(*OrderID*, CustomerID, OrderDate)
  Customers(*CustomerID*,CustomerName, ContactName, Country, Address, City,PostalCode,Country ).
   Cree una consulta que que seleccione todos los clientes y todas las ordenes. ', 'Recuerde que puede usar JOIN para unir dos tablas.', 1, 'SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;', 2,5);


---15- DESARROLLO dificil
INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (64, 'Se tiene el siguiente modelo:
  ORDERS(*OrderID*, CustomerID, OrderDate)
  Customers(*CustomerID*,CustomerName, ContactName, Country, Address, City,PostalCode,Country ).
   Cree una consulta que que seleccione los clientes que son de la misma ciudad. ', 'Recuerde que puede usar SELF JOIN para unir una tabla con ella misma.', 1, 'SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;', 3,5);

---16- DESARROLLO dificil
INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (65, 'Se tiene el siguiente modelo:
  ORDERS(*OrderID*, CustomerID, OrderDate)
  Customers(*CustomerID*,CustomerName, ContactName, Country, Address, City,PostalCode,Country ).
   Cree una consulta que que seleccione los cinco clientes que más compran. ', 'Recuerde que puede usar INNER JOIN para seleccionar los registros que tienen valores coincidentes en ambas tablas.', 1, 'SELECT c.CustomerName, count(*) from Customers c INNER JOIN Orders o on o.CustomerID = c.CustomerID GROUP BY c.CustomerName DESC LIMIT 5', 3,5);