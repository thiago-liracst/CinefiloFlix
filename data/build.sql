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
    duracao INT,
    nacionalidade TEXT,
    visualizacoes INT,
    produtora TEXT
    );

INSERT INTO filmes (id_filme, titulo, diretor, anoDeLancamento, genero, duracao, nacionalidade, visualizacoes, produtora)
VALUES (1, 'A volta de xablau', 'Irmãos Xablau', '2018', 'Aventura', 45, 'Brasil', 0, 'Youtube');
INSERT INTO filmes (id_filme, titulo, diretor, anoDeLancamento, genero, duracao, nacionalidade, visualizacoes, produtora)
VALUES (2, 'A volta de xablau', 'Irmãos Xablau', '2018', 'Aventura', 45, 'Brasil', 0, 'Youtube');
INSERT INTO filmes (id_filme, titulo, diretor, anoDeLancamento, genero, duracao, nacionalidade, visualizacoes, produtora)
VALUES (3, 'A volta de xablau', 'Irmãos Xablau', '2018', 'Aventura', 45, 'Brasil', 0, 'Youtube');

CREATE TABLE IF NOT EXISTS series (
    id_serie INT PRIMARY KEY,
    titulo TEXT,
    duracaoMediaEpisodio INT,
    genero TEXT,
    episodios INT,
    temporadas INT,
    episodiosTotais INT,
    nacionalidade TEXT,
    produtora TEXT
    );

INSERT INTO series (id_serie, titulo, duracaoMediaEpisodio, genero, nacionalidade, produtora)
VALUES (8, 'Peaky Blinders', 60, 'Ação', 'Reino Unido', 'Netflix');

CREATE TABLE IF NOT EXISTS estatisticasfilmes (
    id_estatistica_filme INT PRIMARY KEY,
    assistido INT,
    avaliacao INT,
    comentarios TEXT
    );

INSERT INTO estatisticasfilmes (id_estatistica_filme, assistido, avaliacao, comentarios)
VALUES (6, 0, 0, 'Sem palavras.');

CREATE TABLE IF NOT EXISTS estatisticasseries (
    id_estatistica_serie INT PRIMARY KEY,
    avaliacao INT,
    comentarios TEXT
    );

INSERT INTO estatisticasseries (id_estatistica_serie, avaliacao, comentarios)
VALUES (75, 0, 'Sem palavras.');