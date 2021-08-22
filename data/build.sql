DROP TABLE IF EXISTS filmes;

CREATE TABLE IF NOT EXISTS filmes (
    id_filme INT PRIMARY KEY,
    titulo TEXT,
    diretor TEXT,
    anoDeLancamento TEXT,
    genero TEXT,
    duracao INT,
    nacionalidade TEXT,
    produtora TEXT,
    assistido BOOLEAN,
    visualizacoes INT,
    avaliacao INT,
    comentario TEXT

    );

INSERT INTO filmes (id_filme,titulo,diretor,anoDeLancamento, genero, duracao, nacionalidade, produtora, assistido, visualizacoes, avaliacao, comentario)
VALUES (1,'Teste', 'Teste', '2017','Terror', 120, 'Estados Unidos', 'Marvel Studios', 0, 0, 3, 'Achei regular')

