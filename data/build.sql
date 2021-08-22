DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS filmes;

CREATE TABLE IF NOT EXISTS user (
    id_user INT PRIMARY KEY,
    nome TEXT,
    idade TEXT,
    sexo TEXT,
    generoFavorito TEXT,
    filmeFavorito TEXT,
    serieFavorita TEXT
    );

INSERT INTO user (id_user, nome, idade, sexo, generoFavorito, filmeFavorito, serieFavorita)
VALUES (1, 'User', '', '', '', '', '');

CREATE TABLE IF NOT EXISTS filmes (
    id_filme INT PRIMARY KEY,
    titulo TEXT,
    diretor TEXT,
    anoDeLancamento TEXT,
    genero TEXT,
    duracao TEXT,
    nacionalidade TEXT
    );
