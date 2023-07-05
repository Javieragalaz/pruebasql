-- 1 Revisa el tipo de relación y crea el modelo correspondiente. Respeta las claves primarias, foráneas y tipos de datos.

CREATE TABLE movies (
"id" INTEGER,
"name" VARCHAR,
"year" INTEGER,
	PRIMARY KEY ("id")
);

CREATE TABLE tags (
"id" INTEGER,
"tag" VARCHAR,
	PRIMARY KEY ("id")
);

CREATE TABLE moviestags (
"movie_id" INTEGER,
"tag_id" INTEGER,
	FOREIGN KEY (movie_id)
		REFERENCES movies(id),
	FOREIGN KEY (tag_id)
		REFERENCES tags(id))

-- 2. Inserta 5 películas y 5 tags; la primera película debe tener 3 tags asociados, la segunda película debe tener 2 tags asociados.

INSERT INTO movies (id, name, year) VALUES (1, 'laland', 2016);
INSERT INTO movies (id, name, year) VALUES (2, 'avatar', 2009);
INSERT INTO movies (id, name, year) VALUES (3, 'the whale', 2022);
INSERT INTO movies (id, name, year) VALUES (4, 'navalny', 2022);
INSERT INTO movies (id, name, year) VALUES (5, 'the theory of everything', 2014);

SELECT * FROM movies;

INSERT INTO tags (id, tag) VALUES (1, 'romantica');
INSERT INTO tags (id, tag) VALUES (2, 'musical');
INSERT INTO tags (id, tag) VALUES (3, 'comedia');
INSERT INTO tags (id, tag) VALUES (4, 'fantasia');
INSERT INTO tags (id, tag) VALUES (5, 'aventura');

SELECT * FROM tags;

INSERT INTO moviestags (movie_id, tag_id) VALUES (1,1);
INSERT INTO moviestags (movie_id, tag_id) VALUES (1,2);
INSERT INTO moviestags (movie_id, tag_id) VALUES (1,3);
INSERT INTO moviestags (movie_id, tag_id) VALUES (2,4);
INSERT INTO moviestags (movie_id, tag_id) VALUES (2,5);

SELECT * FROM moviestags;

-- 3. Cuenta la cantidad de tags que tiene cada película. Si una película no tiene tags debe mostrar 0.

SELECT movies.name, COUNT (moviestags.movie_id) AS tags_number FROM movies
	LEFT JOIN moviestags
	ON movies.id = moviestags.movie_id
GROUP BY movies.id, movies.name
ORDER BY movies.id

-- 4. Crea las tablas correspondientes respetando los nombres, tipos, claves primarias y  foráneas y tipos de datos.


CREATE TABLE preguntas (
id INTEGER,
pregunta VARCHAR (255),
respuesta_correcta VARCHAR,
PRIMARY KEY (id)
);

CREATE TABLE usuarios (
id INTEGER,
nombre VARCHAR (255),
edad INTEGER,
	PRIMARY KEY (id)
);

CREATE TABLE respuestas (
id INTEGER,
respuesta VARCHAR (255),
usuario_id INTEGER,
pregunta_id INTEGER,
	PRIMARY KEY (id),
	FOREIGN KEY (usuario_id)
	REFERENCES usuarios (id),
	FOREIGN KEY (pregunta_id)
	REFERENCES preguntas (id)
);

-- 5. Agrega 5 usuarios y 5 preguntas.
INSERT INTO preguntas (id, pregunta, respuesta_correcta) VALUES (1, '¿quien escribio el poema xx?', 'pablo neruda');
INSERT INTO preguntas (id, pregunta, respuesta_correcta) VALUES (2, '¿quien escribio elegia?', 'miguel hernandez');
INSERT INTO preguntas (id, pregunta, respuesta_correcta) VALUES (3, '¿quien escribio gacela de la terrible presencia?', 'federico garcia lorca');
INSERT INTO preguntas (id, pregunta, respuesta_correcta) VALUES (4, '¿quien escribio si el hombre pudiera decir?', 'luis cernuda');
INSERT INTO preguntas (id, pregunta, respuesta_correcta) VALUES (5, '¿quien escribio copias a la muerte de su padre?', 'jorge manrique');

SELECT * FROM preguntas;

INSERT INTO usuarios (id, nombre, edad) VALUES (1, 'carolina', 21);
INSERT INTO usuarios (id, nombre, edad) VALUES (2, 'pedro', 22);
INSERT INTO usuarios (id, nombre, edad) VALUES (3, 'sofia', 23);
INSERT INTO usuarios (id, nombre, edad) VALUES (4, 'daniel', 24);
INSERT INTO usuarios (id, nombre, edad) VALUES (5, 'margarita', 25);

SELECT * FROM usuarios;

	-- a. La primera pregunta debe ser respondida correctamente dos veces, por dos usuarios diferentes.

		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (1,'pablo neruda', 1, 1);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (2,'pablo neruda', 2, 1);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (3,'miguel hernandez', 3, 1);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (4,'federico garcia lorca', 4, 1);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (5,'gabriela mistral', 5, 1);

	-- b. La segunda pregunta debe estar contestada correctamente sólo por un usuario.
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (6,'pablo neruda', 1, 2);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (7,'pablo neruda', 2, 2);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (8,'miguel hernandez', 3, 2);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (9,'federico garcia lorca', 4, 2);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (10,'gabriela mistral', 5, 2);
		
	-- c. Las otras tres preguntas deben tener respuestas incorrectas.
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (11,'pablo neruda', 1, 3);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (12,'pablo neruda', 2, 3);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (13,'miguel hernandez', 3, 3);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (14,'pablo neruda', 4, 3);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (15,'gabriela mistral', 5, 3);

		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (16,'pablo neruda', 1, 4);	
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (17,'pablo neruda', 2, 4);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (18,'miguel hernandez', 3, 4);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (19,'federico garcia lorca', 4, 4);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (20,'gabriela mistral', 5, 1);

		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (21,'pablo neruda', 1, 5);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (22,'pablo neruda', 2, 5);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (23,'miguel hernandez', 3, 5);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (24,'federico garcia lorca', 4, 5);
		INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES (25,'gabriela mistral', 5, 5);

SELECT * FROM respuestas;

-- 6. Cuenta la cantidad de respuestas correctas totales por usuario (independiente de la pregunta).

SELECT usuarios.nombre, COUNT (respuestascorrectas.respuesta_correcta) AS respuestas_correctas FROM (
	--SUBCONSULTA
	SELECT * FROM respuestas
		INNER JOIN preguntas
		ON respuestas.pregunta_id = preguntas.id
		WHERE respuestas.respuesta = preguntas.respuesta_correcta) respuestascorrectas
RIGHT JOIN usuarios
ON usuarios.id = respuestascorrectas.usuario_id
GROUP BY usuarios.nombre
ORDER BY respuestas_correctas DESC;

-- 7. Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios respondieron correctamente.

SELECT preguntarespondida.id , preguntarespondida.pregunta, COUNT (respuestascorrectas.respuesta_correcta) respuestas_correctas FROM (
	--SUBCONSULTA (RESPUESTASCORRECTAS)
	SELECT respuestas.id , respuestas.respuesta, respuestas.usuario_id, respuestas.pregunta_id, preguntas.pregunta, preguntas.respuesta_correcta
	FROM respuestas
		INNER JOIN preguntas
		ON respuestas.pregunta_id = preguntas.id
		WHERE respuestas.respuesta = preguntas.respuesta_correcta) respuestascorrectas
RIGHT JOIN preguntas preguntarespondida
ON preguntarespondida.id = respuestascorrectas.pregunta_id
GROUP BY preguntarespondida.id , preguntarespondida.pregunta
ORDER BY preguntarespondida.id;

-- 8. Implementa un borrado en cascada de las respuestas al borrar un usuario. Prueba la implementación borrando el primer usuario.

ALTER TABLE respuestas
DROP CONSTRAINT respuestas_usuario_id_fkey,
ADD FOREIGN KEY (usuario_id)
	REFERENCES usuarios(id)
ON DELETE CASCADE;

DELETE FROM usuarios WHERE id = 1;

SELECT * FROM usuarios;

-- 9. Crea una restricción que impida insertar usuarios menores de 18 años en la base de datos.

ALTER TABLE usuarios
ADD CONSTRAINT edad
CHECK (edad >= 18);

INSERT INTO usuarios (VALUES (6, 'Carlos', 17));

SELECT * FROM usuarios;

--10. Altera la tabla existente de usuarios agregando el campo email. Debe tener la restricción de ser único. 
ALTER TABLE usuarios ADD COLUMN email VARCHAR (25);
ALTER TABLE usuarios
ADD CONSTRAINT email
UNIQUE (email);

UPDATE usuarios SET email = 'usuario@adl.com' WHERE id = 2;
UPDATE usuarios SET email = 'usuario@adl.com' WHERE id = 3;




