DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS filmes;
DROP TABLE IF EXISTS series;
DROP TABLE IF EXISTS estatisticasfilmes;
DROP TABLE IF EXISTS estatisticasseries;

CREATE TABLE IF NOT EXISTS user (
    id_user INT PRIMARY KEY,
    nome TEXT,
    idade TEXT,
    sexo TEXT,
    generoFavorito TEXT,
    filmeFavorito TEXT,
    serieFavorita TEXT
);

CREATE TABLE IF NOT EXISTS filmes (
    id_filme INT PRIMARY KEY,
    titulo TEXT,
    diretor TEXT,
    anoDeLancamento TEXT,
    genero TEXT,
    duracao INT,
    assistido INT,
    visualizacoes INT,
    produtora TEXT
);

CREATE TABLE IF NOT EXISTS series (
    id_serie INT PRIMARY KEY,
    titulo TEXT,
    duracaoMediaEpisodio INT,
    genero TEXT,
    episodios INT,
    temporadas INT,
    episodiosTotais INT,
    assistido INT,
    produtora TEXT
);

CREATE TABLE IF NOT EXISTS estatisticasfilmes (
    id_estatistica_filme INT PRIMARY KEY,
    avaliacao INT,
    comentarios TEXT
);

CREATE TABLE IF NOT EXISTS estatisticasseries (
    id_estatistica_serie INT PRIMARY KEY,
    avaliacao INT,
    comentarios TEXT
);
