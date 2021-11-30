---MÓDULO 4 FUNCIONES DE AGREGACIÓN, GROUP BY Y HAVING:

--- Nivel fácil

INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (66, 'Se tiene el siguiente modelo:

  ALUMNO(*rut*, nombres, apellidos)
  CURSO(*sigla*, nombre)
  SECCION(*nrc*, curso, semestre, ayudante)
  INSCRIPCION(*nrc*, *rut*, nota)

  donde: 

  SECCION(ayudante) es clave foránea de ALUMNO(rut).
  Indique que pregunta responde la siguiente consulta:
  SELECT c.sigla, c.nombre, COUNT(*) FROM Seccion s, Curso c WHERE s.curso=c.sigla GROUP BY c.sigla', 'Recordar que la función COUNT () devuelve el número de filas que coinciden con un criterio especificado.', 2, NULL, 1,4);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Cantidad de secciones que se han realizado de cada curso'
, true ,66);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Cantidad de alumnos que han realizado cada curso'
, false ,66);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Cantidad de inscripciones que se han realizado de cada curso'
, false ,66);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Cantidad de cursos que han realizado alguna sección'
, false ,66);

INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (75, 'Si tengo la siguiente tabla:

  Pedidos(id, nombre, precio)

  ¿Qué me entregará la siguiente consulta "SELECT MIN(precio) FROM Pedidos"?', 'Recuerda que la función MIN() selecciona el valor mínimo de una columna.', 2, NULL, 1,4);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('El precio más bajo.'
, true ,75);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('El precio más alto.'
, false ,75);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('No existe.'
, false ,75);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Todos los precios.'
, false ,75);


INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (67, 'Se tiene el siguiente modelo:
 CHOFER(*id* nombre, apellido)
 RECORRIDO(*nombre*)
 BUS(*patente*)
 CAPACITACION(*chofer*, *recorrido*), donde chofer es clave foránea de Chofer(id) y recorrido clave foránea de Recorrido(nombre). 
 Además, los Choferes se capacitan en diferentes recorridos
 VIAJE(*id*, chofer, recorrido, bus, inicio, fin) donde chofer y recorrido son clave foránea de Capacitacion(chofer, recorrido) y bus claveforánea de Bus(patente). Además, un chofer no puede tomar un viaje si no esta capacitado en ese recorrido y el inicio y fin son timestams. 
  ¿La siguiente consulta muestra la patente de los buses cuyo tiempo total en viaje es el mayor?
  SELECT T.bus FROM (SELECT v.bus bus, SUM(v.fin - v.inicio) total
     FROM Viaje v GROUP BY v.bus) T WHERE 
        T.total = (SELECT MAX(T1.total)
           FROM (SELECT v.bus bus, SUM(v.fin - v.inicio) total
              WHERE Viaje v GROUP BY v.bus) T1);', 'Recuerda que la función MAX() selecciona el valor máximo de la columna dada y la función SUM() suma los valores de las distintas filas dada una condición.', 2, NULL, 1,4);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Verdadero'
, true ,67);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Falso'
, false ,67);

INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (68, 'Se tiene el siguiente modelo:

  PAIS(nombre, impuesto, costo_envio)
  PRODUCTO(id, nombre, precio, origen) donde origen es clave foranea de Pais
  DISPONIBILIDAD(producto , pais ) donde producto clave foranea de Producto y pais clave foranea de Pais
  VENTA(id, fecha, destino, dirección) donde destino clave foranea de Pais
  PRODUCTOVENTA(venta , producto , cantidad) donde venta clave foranea de Venta y producto clave foranea de Producto

  ¿Cuál de las siguientes consultas muestra el nombre del o los países que tienen más de 10, pero menos de 50 productos disponibles para el envío y esa cantidad?', 'Recordar que para comparar cantidades se utiliza > o <.', 2, NULL, 1,4);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT pais, COUNT (*) c FROM Disponibilidad GROUP BY pais HAVING c > 10 AND c < 50;'
, true ,68);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT pais c FROM Disponibilidad GROUP BY pais HAVING c > 10 AND c < 50;'
, false ,68);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT pais, COUNT (*) c FROM Disponibilidad GROUP BY pais WHERE c > 10 AND c < 50;'
, false ,68);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT pais, COUNT (*) c FROM Disponibilidad GROUP BY pais HAVING c < 10 AND c > 50;'
, false ,68);

--- Nivel medio

INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (69, 'Se tiene el siguiente modelo:

  PRODUCTO(*id*, nombre, precio)
  CLIENTE(*rut*, nombre)
  VENTA(*fecha*, *cliente*)
  VENTAPRODUCTO(*fecha*, *cliente*, *producto*, cantidad)

  Escriba la consulta SQL que resuelve la siguiente pregunta:

  Cantidad de ventas por día durante el año 2012', 'Recordar la funcion Extract (Year form variable_date)', 2, NULL, 2,4);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT fecha, COUNT(*) FROM Venta WHERE EXTRACT(YEAR FROM fecha)=2012 GROUP BY fecha;'
, true ,69);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT fecha FROM Venta WHERE EXTRACT(YEAR FROM fecha)=2012 GROUP BY fecha;'
, false ,69);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT fecha, COUNT(*) FROM Venta WHERE (YEAR FROM fecha)=2012 GROUP BY fecha;'
, false ,69);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT fecha, COUNT(*) FROM Venta WHERE EXTRACT(YEAR FROM fecha)=2012;'
, false ,69);

INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (70, 'Se tiene el siguiente modelo:

  PRODUCTO(*id*, nombre, precio)
  CLIENTE(*rut*, nombre)
  VENTA(*fecha*, *cliente*)
  VENTAPRODUCTO(*fecha*, *cliente*, *producto*, cantidad)

  Escriba la consulta SQL que resuelve la siguiente pregunta:
  Costo total de la venta realizada el "2016-04-01" para el cliente con rut "10-1" ', 'Recuerda que para ver si algo es igual a otra cosa se usa e comando =.', 2, NULL, 2,4);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT SUM(vp.cantidad*p.precio) FROM VentaProducto vp, Producto p WHERE vp.producto=p.id AND vp.fecha="2016-04-01" AND vp.cliente="10-1";'
, true ,70);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT SUM(vp.cantidad*p.precio) FROM VentaProducto vp, Producto p WHERE vp.producto=p.id AND vp.cliente="10-1";'
, false ,70);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT SUM(vp.cantidad*p.precio) FROM VentaProducto vp, Producto p WHERE vp.producto=p.id AND vp.fecha="2016-04-01";'
, false ,70);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT SUM(*) FROM VentaProducto vp, Producto p WHERE vp.producto=p.id AND vp.fecha="2016-04-01" AND vp.cliente="10-1";'
, false ,70);


INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (71, 'Se tiene el siguiente modelo:
 CHOFER(*id* nombre, apellido)
 RECORRIDO(*nombre*)
 BUS(*patente*)
 CAPACITACION(*chofer*, *recorrido*), donde chofer es clave foránea de Chofer(id) y recorrido clave foránea de Recorrido(nombre). 
 Además, los Choferes se capacitan en diferentes recorridos
 VIAJE(*id*, chofer, recorrido, bus, inicio, fin) donde chofer y recorrido son clave foránea de Capacitacion(chofer, recorrido) y bus claveforánea de Bus(patente). Además, un chofer no puede tomar un viaje si no esta capacitado en ese recorrido y el inicio y fin son timestams. 
  ¿La siguiente consulta muestra el nombre y apellido del chofer que ha realizado cada recorrido más veces?
  SELECT DISTINCT (v.recorrido) v.recorrido, c.nombre, c.apellido, COUNT (*) ca
        FROM Viaje v, Chofer c
              WHERE v.chofer = c.id
                        ORDER BY ca DESC;', 'Recuerda que si vas a usar algún elemento en la consulta, este siempre debe existir en alguna de las tablas.', 2, NULL, 2,4);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Falso'
, true ,71);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('Verdadero'
, false ,71);

--- Nivel difícil

INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (72, 'Se tiene el siguiente modelo:

  PAIS(nombre, impuesto, costo_envio)
  PRODUCTO(id, nombre, precio, origen) donde origen es clave foranea de Pais
  DISPONIBILIDAD(producto , pais ) donde producto clave foranea de Producto y pais clave foranea de Pais
  VENTA(id, fecha, destino, dirección) donde destino clave foranea de Pais
  PRODUCTOVENTA(venta , producto , cantidad) donde venta clave foranea de Venta y producto clave foranea de Producto

  ¿Cuál de las siguientes consultas muestra la cantidad de ventas con al menos un producto que no ha tenido que pagar impuesto dado que su origen es el mismo que el país de destino?
', 'Recuerda que para contar puedes usar COUNT() y para comparaciones puedes usar WHERE x=y', 2, NULL, 3,4);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT COUNT (*) FROM Venta v WHERE EXISTS(SELECT 1 FROM ProductoVenta pv, Producto p WHERE pv.venta = v.id AND pv.producto = p.id AND p.origen = v.destino );'
, true ,72);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT COUNT (*) FROM Venta v WHERE EXISTS(SELECT 1 FROM ProductoVenta pv, Producto p WHERE pv.venta = v.id AND pv.producto = p.id);'
, false ,72);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT SUM(*) FROM Venta v WHERE EXISTS(SELECT 1 FROM ProductoVenta pv, Producto p WHERE pv.venta = v.id AND pv.producto = p.id AND p.origen = v.destino );'
, false ,72);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT * FROM Venta v WHERE EXISTS(SELECT 1 FROM ProductoVenta pv, Producto p WHERE pv.venta = v.id AND pv.producto = p.id AND p.origen = v.destino );'
, false ,72);

INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (73, 'Se tiene el siguiente modelo:

  PAIS(nombre, impuesto, costo_envio)
  PRODUCTO(id, nombre, precio, origen) donde origen es clave foranea de Pais
  DISPONIBILIDAD(producto , pais ) donde producto clave foranea de Producto y pais clave foranea de Pais
  VENTA(id, fecha, destino, dirección) donde destino clave foranea de Pais
  PRODUCTOVENTA(venta , producto , cantidad) donde venta clave foranea de Venta y producto clave foranea de Producto

  ¿Cuál de las siguientes consultas muestra el promedio de pago total por venta según el día de la semana de la realización (i.e. promedio del costo de las ventas realizadas los lunes, los martes, etc)?', 'Recuerda que para calcular un promedio puedes usar la función AVG()', 2, NULL, 3,4);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT EXTRACT(DOW FROM t.fecha_hora) dia, AVG (t.total)
    FROM (SELECT v.id, v.fecha_hora, SUM (pv.cantidad * p.precio) + pa.costo_envio total
    FROM Venta v, ProductoVenta pv, Producto p , Pais pa
    WHERE p.id = pv.producto AND pv.venta = v.id AND v.destino = pa.nombre
    GROUP BY v.id, v.fecha_hora ) t GROUP BY dia;'
, true ,73);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT EXTRACT(DOW FROM t.fecha_hora) dia, AVG (t.total)
    FROM (SELECT v.id, v.fecha_hora, SUM (pv.cantidad * p.precio) + pa.costo_envio total
    FROM Venta v, ProductoVenta pv, Producto p , Pais pa
    WHERE p.id = pv.producto AND pv.venta = v.id AND v.destino = pa.nombre) t GROUP BY dia;'
, false ,73);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT EXTRACT(DOW FROM t.fecha_hora) dia, AVG (t.total)
    FROM (SELECT v.id, v.fecha_hora, SUM (pv.cantidad * p.precio) + pa.costo_envio total
    FROM Venta v, ProductoVenta pv, Producto p , Pais pa
    WHERE p.id = pv.producto AND pv.venta = v.id AND v.destino = pa.nombre
    GROUP BY v.id, v.fecha_hora ) t;'
, false ,73);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT EXTRACT(DOW FROM t.fecha_hora) dia
    FROM (SELECT v.id, v.fecha_hora, SUM (pv.cantidad * p.precio) + pa.costo_envio total
    FROM Venta v, ProductoVenta pv, Producto p , Pais pa
    WHERE p.id = pv.producto AND pv.venta = v.id AND v.destino = pa.nombre
    GROUP BY v.id, v.fecha_hora ) t GROUP BY dia;  '
, false ,73);

INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (74, 'Se tiene el siguiente modelo:
 CHOFER(*id* nombre, apellido)
 RECORRIDO(*nombre*)
 BUS(*patente*)
 CAPACITACION(*chofer*, *recorrido*), donde chofer es clave foránea de Chofer(id) y recorrido clave foránea de Recorrido(nombre). 
 Además, los Choferes se capacitan en diferentes recorridos
 VIAJE(*id*, chofer, recorrido, bus, inicio, fin) donde chofer y recorrido son clave foránea de Capacitacion(chofer, recorrido) y bus claveforánea de Bus(patente). Además, un chofer no puede tomar un viaje si no esta capacitado en ese recorrido y el inicio y fin son timestams. 
  ¿Cuál de las siguientes consultas muestra el nombre y apellido de los choferes que nunca han realizado un viaje en buses con patente comenzada en "ABC"?', 'Recuerda que el operador LIKE se usa en una cláusula WHERE para buscar un patrón específico en una columna.', 2, NULL, 3,4);

INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT c.nombre, c.apellido FROM Chofer c WHERE c.id NOT IN (SELECT v.chofer FROM Viaje v WHERE v.bus LIKE "ABC%");'
, true ,74);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT * FROM Chofer c WHERE c.id NOT IN (SELECT v.chofer FROM Viaje v WHERE v.bus LIKE "ABC%");'
, false ,74);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT c.nombre, c.apellido FROM Chofer c WHERE c.id NOT IN (SELECT v.chofer FROM Viaje v WHERE v.bus LIKE "%ABC");'
, false ,74);
INSERT INTO alternatives (text, correct, question_id) 
VALUES ('SELECT c.nombre, c.apellido FROM Chofer c WHERE c.id NOT IN (SELECT v.chofer FROM Viaje v WHERE v.bus LIKE "ABC");'
, false ,74);


--- Desarrollo

--Facil

INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (81, 'Se tiene el siguiente modelo:
 ORDERS(*OrderID*, CustomerID, OrderDate)
 Customers(*CustomerID*,CustomerName, ContactName, Country, Address, City,PostalCode ).
  Escriba una consulta SQL que seleccione a todos los clientes con un CustomerName que comiencen con "a".', 'Recuerda que el operador LIKE se usa en una cláusula WHERE para buscar un patrón específico en una columna.', 1, 'SELECT * FROM Customers
WHERE CustomerName LIKE "a%";', 1,4);


INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (76, 'Se tiene el siguiente modelo:
 ORDERS(*OrderID*, CustomerID, OrderDate)
 Customers(*CustomerID*,CustomerName, ContactName, Country, Address, City,PostalCode ).
  Escribe una consulta SQL que enumere el número de clientes en cada país.', 'Recuerda que puedes usar COUNT() para contar el total de un elemento en una columna y GROUP BY para agrupar los elementos.', 1, 'SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;', 1,4);


--Media
INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (77, 'Se tiene el siguiente modelo:
 ORDERS(*OrderID*, CustomerID, OrderDate)
 Customers(*CustomerID*,CustomerName, ContactName, Country, Address, City,PostalCode ).
  Escriba una consulta SQL que seleccione a todos los clientes con un CustomerName que en su segunda letra tengan una "r".', 'Recuerda que en el operador LIKE para ver una posición específica se usa el guión abajo.', 1, 'SELECT * FROM Customers
WHERE CustomerName LIKE "_r%";', 2,4);

INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (78, 'Se tiene el siguiente modelo:
 ORDERS(*OrderID*, CustomerID, OrderDate)
 Customers(*CustomerID*,CustomerName, ContactName, Country, Address, City,PostalCode ).
  Escribe una consulta SQL que enumere el número de clientes en cada país ordenados de mayor a menor.', 'Recuerda que puedes usar COUNT() para contar el total de un elemento en una columna y GROUP BY para agrupar los elementos.', 1, 'SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;', 2,4);

--Dificil
INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (79, 'Se tiene el siguiente modelo:
 ORDERS(*OrderID*, CustomerID, EmployeeID, OrderDate)
 Customers(*CustomerID*,CustomerName, ContactName, Country, Address, City,PostalCode ).
  Crea una consulta SQL que enumere el número de clientes en cada país. Incluya solo países con más de 5 clientes:', 'Recuerda que la cláusula HAVING se agregó a SQL porque la palabra clave WHERE no se puede usar con funciones agregadas.', 1, 'SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;', 3,4);


INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (80, 'Se tiene el siguiente modelo:
 ORDERS(*EmployeeID*, LastName, FirstName, BirthDate, Photo, Notes  )
 Employees(*CustomerID*,CustomerName, ContactName, Country, Address, City,PostalCode ).
  Crea una consulta que enumere los empleados que han registrado más de 10 pedidos.', 'Recuerda la función COUNT() que devuelve el número de filas que coincide con un criterio especificado y a palabra clave INNER JOIN  que selecciona registros que tienen valores coincidentes en ambas tablas.', 1, 'SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM (Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10;', 3,4);


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

INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (55, 'Si tengo 2 tablas T1(*a*,b,c) y T2(*d*,e,f) donde "f" en T2 es clave foránea hacia "a" en T1, y además "f" se define como NOT NULL. Seleccione la afirmación correcta.', 'Recordar que LEFT JOIN mantiene todas las filas de la tabla izquierda. Las filas de la tabla derecha se mostrarán si hay una coincidencia con las de la izquierda. Si existen valores en la tabla izquierda pero no en la tabla derecha, ésta mostrará null.
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
 Customers(*CustomerID*,CustomerName, ContactName, Country, Address, City,PostalCode ).
  Cree una consulta que que seleccionetodas las órdenes con la infromación de sus clientes. ', 'Recuerde que puede usar JOIN para unir dos tablas.', 1, 'SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;', 1,5);

---12- DESARROLLO facil
INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (61, 'Se tiene el siguiente modelo:
 ORDERS(*OrderID*, CustomerID, OrderDate)
 Customers(*CustomerID*,CustomerName, ContactName, Country, Address, City,PostalCode ).
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
 Customers(*CustomerID*,CustomerName, ContactName, Country, Address, City,PostalCode ).
  Cree una consulta que que seleccione todos los clientes y todas las ordenes. ', 'Recuerde que puede usar JOIN para unir dos tablas.', 1, 'SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;', 2,5);


---15- DESARROLLO dificil
INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (64, 'Se tiene el siguiente modelo:
 ORDERS(*OrderID*, CustomerID, OrderDate)
 Customers(*CustomerID*,CustomerName, ContactName, Country, Address, City,PostalCode ).
  Cree una consulta que que seleccione los clientes que son de la misma ciudad. ', 'Recuerde que puede usar SELF JOIN para unir una tabla con ella misma.', 1, 'SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;', 3,5);

---16- DESARROLLO dificil
INSERT INTO questions (id, question, hint, type, query,difficulty,module_id) VALUES (65, 'Se tiene el siguiente modelo:
 ORDERS(*OrderID*, CustomerID, OrderDate)
 Customers(*CustomerID*,CustomerName, ContactName, Country, Address, City,PostalCode ).
  Cree una consulta que que seleccione los cinco clientes que más compran. ', 'Recuerde que puede usar INNER JOIN para seleccionar los registros que tienen valores coincidentes en ambas tablas.', 1, 'SELECT c.CustomerName, count(*) from Customers c INNER JOIN Orders o on o.CustomerID = c.CustomerID GROUP BY c.CustomerName DESC LIMIT 5', 3,5);