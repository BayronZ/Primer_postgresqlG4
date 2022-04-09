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