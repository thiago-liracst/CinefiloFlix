DROP TABLE IF EXISTS filmes;

CREATE TABLE IF NOT EXISTS filmes (
    id_filme INT PRIMARY KEY,
    titulo TEXT,
    diretor TEXT,
    dataLancamento DATE,
    genero TEXT,
    duracao TEXT,
    elenco TEXT,
    nacionalidade TEXT
    );

INSERT INTO filmes (id_filme,titulo,diretor,dataLancamento, genero, duracao, elenco, nacionalidade)
VALUES (1,'Teste', 'Teste', '2017-01-01','Terror', '120', 'Angelina Jolie, Juliana Paes',
'Estados Unidos');

