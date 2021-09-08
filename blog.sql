-- Pregunta 1 y 2
Drop TABLE IF EXISTS post;
Drop TABLE IF EXISTS comentario;
Drop TABLE IF EXISTS usuario;

CREATE TABLE usuario (
    id INT,
    email VARCHAR(30),
    PRIMARY KEY (id)
);

CREATE TABLE post (
    id INT PRIMARY KEY,
    usuario_id INT,
    titulo VARCHAR(100),
    fecha DATE,
    --Primary Key
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE comentario (
    id INT PRIMARY KEY,
    usuario_id INT,
    post_id INT,
    texto VARCHAR(40),
    fecha DATE,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (post_id) REFERENCES post(id)
);

-- Pregunta 3
\copy usuario FROM 'usuarios.csv' csv header;
\copy post FROM 'post.csv' csv header;
\copy comentario FROM 'comentarios.csv' csv header;

--Pregunta 4
SELECT email, usuario_id, titulo FROM usuario INNER JOIN post ON usuario_id = usuario.id WHERE usuario_id = 5;

--Pregunta 5 
SELECT email, post_id, texto 
FROM usuario 
INNER JOIN post 
ON usuario_id = usuario.id
INNER JOIN comentario 
ON post_id = usuario.id
WHERE post_id <> 6;

-- Pregunta 6
SELECT *
FROM usuario 
LEFT JOIN post 
ON usuario_id = usuario.id
WHERE usuario_id IS NULL;

--Pregunta 7

SELECT titulo, texto
FROM post 
LEFT JOIN comentario
ON post_id = post.usuario_id;

SELECT email, titulo, texto
FROM usuario
LEFT JOIN post
ON usuario_id = usuario.id 
LEFT JOIN comentario
ON post_id = post.usuario_id;

-- Pregunta 8

SELECT * 
FROM usuario
LEFT JOIN post 
ON usuario_id = usuario.id
WHERE fecha > '2020-01-06' AND fecha < '2020-06-30';