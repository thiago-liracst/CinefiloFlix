DROP TABLE IF EXISTS filmes;

CREATE TABLE IF NOT EXISTS filmes (
    id_filme INT PRIMARY KEY,
    titulo TEXT,
    diretor TEXT,
    dataLancamento DATE,
    genero TEXT
    );

INSERT INTO filmes (id_filme,titulo,diretor,dataLancamento, genero)
VALUES (1,'Teste', 'Teste', '2017-01-01','Terror');

