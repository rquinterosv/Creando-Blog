Drop TABLE IF EXISTS post;
Drop TABLE IF EXISTS comentario;
Drop TABLE IF EXISTS usuario;

CREATE TABLE usuario (
    id INT,
    email VARCHAR(30),
    PRIMARY KEY (id)
);

CREATE TABLE post (
    id INT,
    usuario_id INT,
    titulo VARCHAR(100),
    fecha DATE,
     FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE comentario(
    id INT,
    usuario_id INT,
    post_id INT,
    texto VARCHAR(40),
    fecha DATE,
    FOREIGN KEY (post_id) REFERENCES usuario(id),
    FOREIGN KEY (post_id) REFERENCES post(usuario_id)
);

\copy usuario FROM 'usuarios.csv' csv header;
\copy post FROM 'post.csv' csv header;