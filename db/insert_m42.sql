INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (21, 'Se tiene el siguiente modelo:  
INGENIERO(*rut*, nombre, apellido)  
PROYECTO(*nombre*, rut_jefe)  
COOPERA(*proyecto*, *rut_ingeniero*, sueldo)  
donde   
PROYECTO(rut_jefe) es clave foránea de INGENIERO(rut),   
COOPERA(proyecto) es clave foránea de PROYECTO(nombre) y   
COOPERA(rut_ingeniero) es clave foránea de INGENIERO(rut).  
Indique que consulta responde la siguiente pregunta: Nombre de los ingenieros que son jefes de un proyecto', 'WHERE se utiliza para especificar una condición al obtener los datos de una sola tabla o al unirse con varias tablas. Si se cumple la condición dada, solo devuelve un valor específico de la tabla.',2, NULL,3,3);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT i.nombre FROM Ingeniero i, Proyecto p, Coopera c WHERE c.rut_ingeniero=p.rut_jefe AND c.proyecto=p.nombre;',false,21);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT i.nombre FROM Ingeniero i, Proyecto p WHERE i.rut_jefe=i.rut;',false,21);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT i.nombre FROM Ingeniero i, Proyecto p WHERE p.rut_jefe=i.rut;',true,21);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT i.nombre FROM Ingeniero i, Proyecto p, Coopera c WHERE c.rut_ingeniero=p.rut_jefe;',false,21);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (22, 'Se tiene el siguiente modelo:  
INGENIERO(*rut*, nombre, apellido)  
PROYECTO(*nombre*, rut_jefe)  
COOPERA(*proyecto*, *rut_ingeniero*, sueldo)  
donde   
PROYECTO(rut_jefe) es clave foránea de INGENIERO(rut),   
COOPERA(proyecto) es clave foránea de PROYECTO(nombre) y   
COOPERA(rut_ingeniero) es clave foránea de INGENIERO(rut).  
Indique que consulta responde la siguiente pregunta: Nombre de los proyectos donde el jefe de proyecto tiene un sueldo inferior a 1000.', 'Debe utilizar la cláusula WHERE para filtrar los registros y obtener solo los registros necesarios.',2, NULL,2,3);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT proyecto FROM Proyecto, Coopera WHERE rut_jefe=rut_ingeniero  AND sueldo < 1000;',false,22);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT proyecto FROM Proyecto, Coopera WHERE rut_jefe=rut_ingeniero AND proyecto=nombre AND sueldo > 1000;',false,22);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT proyecto FROM Proyecto, Coopera WHERE rut_jefe=rut_ingeniero  AND sueldo > 1000;',false,22);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT proyecto FROM Proyecto, Coopera WHERE rut_jefe=rut_ingeniero AND proyecto=nombre AND sueldo < 1000;',true,22);



INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (23, 'Se tiene el siguiente modelo:  
CLIENTE(*rut*, nombres, apellidos)  
CANCHA(*id*, capacidad)  
RESERVA(*rut*, *cancha*, *fecha*, costo)  
EQUIPAMIENTO(*rut*, *cancha*, *fecha*, *equipo*)  
Indique que pregunta resuelve la siguiente consulta:  
SELECT ca.capacidad FROM Cancha ca, Reserva r WHERE r.cancha=ca.id AND r.rut="0_0"', 'El operador AND mostrará los resultados cuando se cumplan las 2 condiciones.',2, NULL,2,3);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Capacidad de las canchas que han sido reservadas por el cliente con rut 0_0',true,23);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Capacidad de las canchas que no han sido reservadas por el cliente con rut 0_0',false,23);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Ninguna de las anteriores',false,23);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Capacidad de las canchas que han sido reservadas por el cliente con rut 0_1',false,23);



INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (24, 'Se tiene el siguiente modelo:  
INGENIERO(*rut*, nombre, apellido)  
PROYECTO(*nombre*, rut_jefe)  
COOPERA(*proyecto*, *rut_ingeniero*, sueldo)  
donde   
PROYECTO(rut_jefe) es clave foránea de INGENIERO(rut),   
COOPERA(proyecto) es clave foránea de PROYECTO(nombre) y   
COOPERA(rut_ingeniero) es clave foránea de INGENIERO(rut).  
Indique que consulta responde la siguiente pregunta: Para cada proyecto su nombre y el sueldo del ingeniero jefe.', 'Debe utilizar el comando WHERE y después de este debe estar la condición.',2, NULL,3,3);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT c.proyecto, c.sueldo FROM Coopera c, Proyecto p WHERE c.proyecto=p.nombre;',false,24);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT c.proyecto, c.sueldo FROM Coopera c, Proyecto p WHERE c.proyecto=p.nombre AND c.rut_ingeniero=p.rut_jefe;',true,24);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT c.proyecto, c.sueldo FROM Coopera c, Proyecto p WHERE c.rut_ingeniero=p.rut_jefe;',false,24);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT c.proyecto, c.sueldo FROM Coopera c, Proyecto p WHERE c.proyecto=p.rut_jefe AND c.rut_ingeniero=p.rut_jefe;',false,24);



INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (25, 'Se tiene el siguiente modelo:  
ALUMNO(*rut*, nombres, apellidos)  
CURSO(*sigla*, nombre)  
SECCION(*nrc*, curso, semestre, ayudante)  
INSCRIPCION(*nrc*, *rut*, nota)  
donde  
SECCION(ayudante) es clave foránea de ALUMNO(rut)  
Escriba la consulta SQL que resuelve la siguiente pregunta: Para cada sección, su nrc, semestre y los nombres y apellidos de su ayudante.', 'Todo lo que se pide en la consulta debe estar representado en el SELECT',2, NULL,3,3);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT s.nrc, s.semestre, a.nombres, a.apellidos FROM Seccion s, Alumno a WHERE s.ayudante=a.rut;',true,25);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT s.nrc, s.semestre, a.nombres, a.apellidos FROM Seccion s, Alumno a;',false,25);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT s.nrc, s.semestre, a.apellidos FROM Seccion s WHERE s.ayudante=a.rut;',false,25);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT s.nrc, s.semestre, a.nombres FROM Seccion s, Alumno a WHERE s.ayudante!=a.rut;',false,25);



INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (26, 'Dado el siguiente esquema:  
Cliente (*id_cliente*, nombre_cliente, apellido)  
Carta (*id_producto*, nombre_producto, precio, tipo)  
Pedido (*id_cliente*, *id_producto*, *fecha*, cantidad)  
¿Si la tabla Cliente tiene 5 tuplas y la tabla Pedido tiene 10, cuántas tuplas tendrá la relación resultante?  
SELECT * FROM Cliente, Pedido', 'Al hacer SELECT * se selecciona todo y como no hay WHERE no hay condiciones',2, NULL,1,3);
INSERT INTO alternatives (text, correct, question_id) VALUES ('50 tuplas',true,26);
INSERT INTO alternatives (text, correct, question_id) VALUES ('5 tuplas',false,26);
INSERT INTO alternatives (text, correct, question_id) VALUES ('10 tuplas',false,26);
INSERT INTO alternatives (text, correct, question_id) VALUES ('100 tuplas',false,26);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (27, 'No es posible hacer un SELECT con reunión de una tabla con si misma, ya que no sería posible identificar a quien corresponde cada columna.', 'Esto significa unir a una tabla con ella misma',2, NULL,1,3);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Verdadero',false,27);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Falso',true,27);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (28, 'Se tiene el siguiente modelo:  
PRODUCTO(*id*, nombre, precio)  
CLIENTE(*rut*, nombre)  
VENTA(*fecha*, *cliente*)  
VENTAPRODUCTO(*fecha*, *cliente*, *producto*, cantidad)  
Escriba la consulta SQL que resuelve la siguiente pregunta:
Fecha y rut de cliente de las ventas que para todos los productos comprados pidieron una cantidad mayor a uno.', 'Los operadores "exists" y "not exists" se emplean para determinar si hay o no datos en una lista de valores.',2, NULL,3,3);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT v.fecha FROM Venta v WHERE NOT EXISTS (SELECT 1 FROM VentaProducto WHERE fecha=v.fecha AND cliente=v.cliente AND cantidad=1);',false,28);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT v.cliente FROM Venta v WHERE NOT EXISTS (SELECT 1 FROM VentaProducto WHERE fecha=v.fecha AND cliente=v.cliente AND cantidad=1);',false,28);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT v.fecha, v.cliente FROM Venta v WHERE EXISTS (SELECT 1 FROM VentaProducto WHERE fecha=v.fecha AND cliente=v.cliente AND cantidad=1);',false,28);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT v.fecha, v.cliente FROM Venta v WHERE NOT EXISTS (SELECT 1 FROM VentaProducto WHERE fecha=v.fecha AND cliente=v.cliente AND cantidad=1);',true,28);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (29, 'Se tiene el siguiente modelo:  
CLIENTE(*rut*, nombres, apellidos)  
CANCHA(*id*, capacidad)  
RESERVA(*rut*, *cancha*, *fecha*, costo)  
EQUIPAMIENTO(*rut*, *cancha*, *fecha*, *equipo*)  
Indique que pregunta resuelve la siguiente consulta:  
SELECT e.equipo FROM Equipamiento e, Cancha c WHERE e.cancha=c.id AND c.capacidad > 20 AND e.fecha="01-01-2010"', 'El operador AND mostrará los resultados cuando se cumplan las 2 condiciones, en caso de que hayan más, deben cumplirse todas.',2, NULL,2,3);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Equipamiento solicitado el 1 de enero del 2010 para canchas con capacidad mayor a 20.',true,29);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Equipamiento solicitado el 1 de enero del 2011 para canchas con capacidad mayor a 20.',false,29);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Equipamiento solicitado el 10 de enero del 2010 para canchas con capacidad mayor a 20.',false,29);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Equipamiento solicitado el 1 de enero del 2010 para canchas con capacidad mayor o igual a 20.',false,29);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (30, 'Se tiene el siguiente modelo:  
CLIENTE(*rut*, nombres, apellidos)  
CANCHA(*id*, capacidad)  
RESERVA(*rut*, *cancha*, *fecha*, costo)  
EQUIPAMIENTO(*rut*, *cancha*, *fecha*, *equipo*)  
Indique que pregunta resuelve la siguiente consulta:  
SELECT c.rut FROM Cliente c, Reserva r', 'Si no hay WHERE no hay condiciones que deban cumplirse',2, NULL,1,3);
INSERT INTO alternatives (text, correct, question_id) VALUES ('RUT de todos los clientes, apareciendo cada uno menos veces que tuplas en Reserva.',false,30);
INSERT INTO alternatives (text, correct, question_id) VALUES ('RUT de todos los clientes, apareciendo cada uno más veces que tuplas en Reserva.',false,30);
INSERT INTO alternatives (text, correct, question_id) VALUES ('RUT de todos los clientes, apareciendo cada uno la misma cantidad de veces que tuplas en Reserva.',true,30);
INSERT INTO alternatives (text, correct, question_id) VALUES ('RUT de algunos clientes, apareciendo cada uno la misma cantidad de veces que tuplas en Reserva.',false,30);