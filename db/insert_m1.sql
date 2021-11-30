INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (1, 'Como sería la creación de la tabla: Pais(*nombre*, impuesto, costo-envio)', 'Recordar que primero se utiliza CREATE TABLE', 2, NULL,1,1);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE Pais (nombre varchar(20) primary key, impuesto float, costo_envio float);',false,1);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Pais (nombre varchar(20), impuesto float, costo-envio float);',false,1);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Pais (nombre varchar(20) primary key, impuesto float, costo-envio float);',true,1);
INSERT INTO alternatives (text, correct, question_id) VALUES ('CREATE TABLE Pais (nombre primary key, impuesto, costo-envio);',false,1);

INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (2, 'Si tenemos la siguiente tabla: Producto(id, nombre, precio, origen) ¿Como sería el insert para un "producto Chocolate de Estados Unidos que vale $1.000"?', 'Recordar que es necesario dar los nombres de las columnas', 2, NULL,2,1);
INSERT INTO alternatives (text, correct, question_id) VALUES ('INSERT INTO Producto (id, nombre, precio, origen) VALUES (1, "Cholocate", 1000, "Estados Unidos");',true,2);
INSERT INTO alternatives (text, correct, question_id) VALUES ('INSERT Producto (id, nombre, precio, origen) VALUES (1, "Cholocate", 1000, "Estados Unidos");',false,2);
INSERT INTO alternatives (text, correct, question_id) VALUES ('INSERT INTO Producto (id, nombre, precio, origen) = (1, "Cholocate", 1000, "Estados Unidos");',false,2);
INSERT INTO alternatives (text, correct, question_id) VALUES ('INSERT INTO Producto (1, "Cholocate", 1000, "Estados Unidos");',false,2);

INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (3, '¿Cuál de los siguientes comandos debiera utilizar si quiero cambiar el tipo de dato de una columna?', 'Recordar que la traducción del inglés es literal lo que se hace', 2, NULL,1,1);
INSERT INTO alternatives (text, correct, question_id) VALUES ('DROP',false,3);
INSERT INTO alternatives (text, correct, question_id) VALUES ('TRUNCATE',false,3);
INSERT INTO alternatives (text, correct, question_id) VALUES ('ALTER',true,3);
INSERT INTO alternatives (text, correct, question_id) VALUES ('DELETE',false,3);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (4, 'Si tenemos la siguiente tabla: Pais(*nombre*, impuesto, costo-envio) ¿Cómo sería la eliminación de todos los países que tienen impuestos sobre el 0.5?', 'Recordar que se debe ingresar la tabla a la cual quiero eliminar un valor', 2, NULL,1,1);
INSERT INTO alternatives (text, correct, question_id) VALUES ('DELETE FROM Pais WHERE impuesto >= 0.5;',false,4);
INSERT INTO alternatives (text, correct, question_id) VALUES ('DELETE FROM Pais WHERE Pais.impuesto > 0.5;',true,4);
INSERT INTO alternatives (text, correct, question_id) VALUES ('DELETE * WHERE Pais.impuesto > 0.5;',false,4);
INSERT INTO alternatives (text, correct, question_id) VALUES ('DELETE FROM Pais WHERE Pais.impuesto >= 0.5;',false,4);

INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (5, 'Una empresa tiene empleados los cuales formaron un sindicato que tiene una directiva de 5 miembros que se eligen cada 2 años. Indique el modelo que mejor representa la situación:', 'Recordar que las variables en negritas son PK', 2, NULL,2,1);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Empresa(*nombre*) Sindicato(*id*, nombre-empresa), Empleado(*rut*, nombre-empresa, id-sindicato)',false,5);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Empleado(*rut*), Sindicato(*id*, año_inicio), Directiva(*rut-empleado*, *id-sindicato*',true,5);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Empleado(*rut*, es-directivo, año-sindicato)',false,5);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Ninguna de las anteriores',false,5);

INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (6, 'Si tenemos la siguiente tabla: Pais(*nombre*, impuesto, costo-envio) ¿Cómo sería la actualización del impuesto a 0.3 de todos los países que tienen impuestos sobre el 0.5?', 'Recordar que se utiliza el comando SET después de la tabla', 2, NULL,2,1);
INSERT INTO alternatives (text, correct, question_id) VALUES ('UPDATE Pais SET impuesto = 0.3 WHERE impuesto > 0.5;)',true,6);
INSERT INTO alternatives (text, correct, question_id) VALUES ('UPDATE * SET impuesto = 0.3 WHERE impuesto > 0.5;',false,6);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SET impuesto = 0.3 WHERE impuesto > 0.5;',false,6);
INSERT INTO alternatives (text, correct, question_id) VALUES ('UPDATE Pais SET impuesto = 0.3;',false,6);

INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (7, '¿Cómo se seleccionaría todos los elementos de la tabla llamada "Comida"?', 'Recordar que * selecciona todos los elementos',2, NULL,3,1);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT ALL FROM Comida;',false,7);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT Comida;',false,7);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT ALL ELEMENTS FROM Comida;',false,7);
INSERT INTO alternatives (text, correct, question_id) VALUES ('SELECT * FROM Comida;',true,7);

INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (8, 'El orden de los resultados de una consulta siempre se mantiene para la misma consulta, mientras no haya cambios en las tuplas de las tablas involucradas.', 'Recordar que las consultas solo cambian si cambian ni se agregan nuevos elementos',2, NULL,2,1);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Verdadero',false,8);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Falso',true,8);


INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (9, 'Sea R una relación, entonces F(R) contendrá todas las tuplas de R, pero considerando solamente un conjunto de atributos recibidos. ¿Qué operador es F?', 'El símbolo de la respuesta es Π',2, NULL,3,1);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Selección',false,9);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Reunión',false,9);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Reunión Natural',false,9);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Proyección',true,9);

INSERT INTO questions (id, question, hint, type, query, difficulty, module_id) VALUES (10, 'Para agregar una tupla en una tabla que posee una columna de tipo serial, puedo no poner el valor para esa columna.', 'Serial significa autoincremento',2, NULL,1,1);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Verdadero',true,10);
INSERT INTO alternatives (text, correct, question_id) VALUES ('Falso',false,10);