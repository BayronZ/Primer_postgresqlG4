-- La academia está trabajando en mejorar su plataforma de estudio y planea crear un espacio
-- que sirva como una red social entre estudiantes y docentes, por lo que necesita almacenar
-- en una base de datos los post y comentarios que se generen.
-- ● Parte 1: Creación, inserciones, modificaciones y eliminaciones en la tabla “Posts”.
-- ● Parte 2: Creación e inserciones en la tabla “comentarios”.

-- Parte 1
-- 1. Crear una base de datos con nombre “Posts”. (1 Punto)
\c mrcoco
DROP DATABASE posts;
CREATE DATABASE posts;
\c posts
-- 2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,


-- contenido y descripción. (1 Punto)

CREATE TABLE post(
    id SERIAL,
    userName VARCHAR(30),
    craetedAt DATE,
    content VARCHAR,
    descripcion VARCHAR,
    PRIMARY KEY (id) 
);
\dt
-- 3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos". (0.6 Puntos)
INSERT INTO post(userName, craetedAt, content, descripcion)
VALUES('PAMELA', '08-04-2022', 'Porqué los gatos van a dominar el mundo', 'Nadie lo sabe');
INSERT INTO post(userName, craetedAt, content, descripcion)
VALUES('PAMELA', '08-04-2022', 'Ahora si que nos chingamos', 'Los gatos dominaron el mundo');
INSERT INTO post(userName, craetedAt, content, descripcion)
VALUES('CARLOS', '10-04-2022', 'Como el catnip favorece la inteligencia de los gatos', 'Mi gato me habla');
-- Seleccionamos todo lo de la tabla post para que muestre resultado en pantalla 
SELECT * FROM post;
-- 4. Modificar la tabla post, agregando la columna título. (1 Punto)
ALTER TABLE post ADD title VARCHAR(100);
SELECT * FROM post;

-- 5. Agregar título a las publicaciones ya ingresadas. (1 Punto)
UPDATE post SET title = 'Gatonakis' WHERE id = 1;
UPDATE post SET title = 'Gatoneitors' WHERE id = 2;
UPDATE post SET title = 'War of cats' WHERE id = 3;
SELECT * FROM post;
-- 6. Insertar 2 post para el usuario "Pedro". (0.4 Puntos)
INSERT INTO post (userName, craetedAt, content, descripcion, title)
VALUES('PEDRO', '2022-08-04','La civilización de los neogatos', 'Historia de la conquista', 'La civilización gatuna');
INSERT INTO post (userName, craetedAt, content, descripcion, title)
VALUES('PEDRO', '2022-08-04','La civilización de los neogatos', 'Historia de la conquista', 'La tecnología gatuna');
SELECT * FROM post;
-- 7. Eliminar el post de Carlos. (1 Punto)
DELETE FROM post WHERE userName = 'CARLOS';
SELECT * FROM post;
-- 8. Ingresar un nuevo post para el usuario "Carlos". (0.6 Puntos)
INSERT INTO post (userName, craetedAt, content, descripcion, title)
VALUES('Carlos', '2022-04-08', 'asdf', 'ghjk', 'qwerty');
SELECT * FROM post;

-- Parte 2
-- 1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de
-- creación y contenido, que se relacione con la tabla posts. (1 Punto)
CREATE TABLE comentarios(
    id SERIAL,
    post_id INT,
    craetedAt DATE,
    content VARCHAR,
    FOREIGN KEY (post_id) REFERENCES post (id)
);
\dt
-- 2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos". (0.4 Puntos)
INSERT INTO comentarios(post_id, craetedAt, content)
VALUES(1, '2021-05-10 15:16:13','Los shinobis solo comen manzanas');
INSERT INTO comentarios(post_id, craetedAt, content)
VALUES(1, '2021-05-11 10:00:24', 'A nadie le gustan las manzanas');
INSERT INTO comentarios(post_id, craetedAt, content)
VALUES(6, '2021-05-11 09:00:00', 'no y tu manzana');
INSERT INTO comentarios(post_id, craetedAt, content)
VALUES(6, '2021-05-12 12:00:00', 'dejate de hablar como melon');
INSERT INTO comentarios(post_id, craetedAt, content)
VALUES(6, '2021-05-12 13:00:00', 'dejate de hablar como sandia');
INSERT INTO comentarios(post_id, craetedAt,content)
VALUES(6, '2021-05-12 14:00:00', 'dejate de hablar como higo');
SELECT * FROM comentarios;

-- 3. Crear un nuevo post para "Margarita". (1 Punto)
INSERT INTO post(userName, craetedAt,content, descripcion, title)
VALUES('MARGARITA', '2021-05-12 14:00:00', 'dejate de hablar como palta', 'cuesco', 'rayuela');
SELECT * FROM post;
-- 4. Ingresar 5 comentarios para el post de Margarita. (1 Punto)
INSERT INTO comentarios(post_id, craetedAt, content)
VALUES(7, '2021-05-10 15:16:13','eat corn');
INSERT INTO comentarios(post_id, craetedAt, content)
VALUES(7, '2021-05-11 10:00:24', 'eat apple');
INSERT INTO comentarios(post_id, craetedAt, content)
VALUES(7, '2021-05-11 09:00:00', 'eat pear');
INSERT INTO comentarios(post_id, craetedAt, content)
VALUES(7, '2021-05-12 12:00:00', 'eat watermelon');
INSERT INTO comentarios(post_id, craetedAt, content)
VALUES(7, '2021-05-12 13:00:00', 'eat lamb');
SELECT * from comentarios;


