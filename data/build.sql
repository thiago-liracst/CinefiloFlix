DROP TABLE IF EXISTS filmes;

CREATE TABLE IF NOT EXISTS filmes (
    id_filme INT PRIMARY KEY,
    titulo TEXT,
    diretor TEXT,
    anoDeLancamento TEXT,
    genero TEXT,
    duracao TEXT,
    nacionalidade TEXT
    );

INSERT INTO filmes (id_filme,titulo,diretor,anoDeLancamento, genero, duracao, nacionalidade)
VALUES (1,'Teste', 'Teste', '2017','Terror', '120', 'Estados Unidos');

