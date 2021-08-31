--Insere usuário default
INSERT INTO user (id_user, nome, idade, sexo, generoFavorito, filmeFavorito, serieFavorita)
VALUES (1, 'User', '', '', '', '', '');

--Insere filmes
INSERT INTO filmes (id_filme, titulo, diretor, anoDeLancamento, genero, duracao, assistido, visualizacoes, produtora)
VALUES (1, 'Viúva Negra', 'Cate Shortland', '2021', 'Ação', 133, 0, 0, 'Marvel Studios');

INSERT INTO filmes (id_filme, titulo, diretor, anoDeLancamento, genero, duracao, assistido, visualizacoes, produtora)
VALUES (2, 'Nós', 'Jordan Peele', '2019', 'Terror', 116, 0, 0, 'Blumhouse Productions');

INSERT INTO filmes (id_filme, titulo, diretor, anoDeLancamento, genero, duracao, assistido, visualizacoes, produtora)
VALUES (3, 'Enquanto estivermos juntos', 'Andrew Erwin & Jon Erwin', '2020', 'Drama', 115, 0, 0, 'Kingdom Story Company');

INSERT INTO filmes (id_filme, titulo, diretor, anoDeLancamento, genero, duracao, assistido, visualizacoes, produtora)
VALUES (4, '2 Hearts', 'Lance Hool', '2020', 'Romance', 95, 0, 0, 'Silver Lion Films');

INSERT INTO filmes (id_filme, titulo, diretor, anoDeLancamento, genero, duracao, assistido, visualizacoes, produtora)
VALUES (5, 'O chamado da floresta', 'Chris Sanders', '2020', 'Aventura', 100, 0, 0, '20th Century Studios');

INSERT INTO filmes (id_filme, titulo, diretor, anoDeLancamento, genero, duracao, assistido, visualizacoes, produtora)
VALUES (6, 'Interestelar', 'Christopher Nolan', '2014', 'Ficção Científica', 169, 0, 0, 'Legendary Pictures');

--Insere Séries
INSERT INTO series (id_serie, titulo, duracaoMediaEpisodio, genero, episodios, temporadas, episodiosTotais, assistido, produtora)
VALUES (1, 'Peaky Blinders', 60, 'Ação', 0, 0, 0, 0, 'Netflix');

INSERT INTO series (id_serie, titulo, duracaoMediaEpisodio, genero, episodios, temporadas, episodiosTotais, assistido, produtora)
VALUES (2, 'Marianne', 36, 'Terror', 0, 0, 0, 0, 'Netflix');

INSERT INTO series (id_serie, titulo, duracaoMediaEpisodio, genero, episodios, temporadas, episodiosTotais, assistido, produtora)
VALUES (3, 'For Life', 43, 'Drama', 0, 0, 0, 0, 'ABC');

INSERT INTO series (id_serie, titulo, duracaoMediaEpisodio, genero, episodios, temporadas, episodiosTotais, assistido, produtora)
VALUES (4, 'Amor Moderno', 30, 'Romance', 0, 0, 0, 0, 'Amazon Studios');

INSERT INTO series (id_serie, titulo, duracaoMediaEpisodio, genero, episodios, temporadas, episodiosTotais, assistido, produtora)
VALUES (5, 'Sweet Tooth', 37, 'Aventura', 0, 0, 0, 0, 'Netflix');

INSERT INTO series (id_serie, titulo, duracaoMediaEpisodio, genero, episodios, temporadas, episodiosTotais, assistido, produtora)
VALUES (6, 'Westword', 57, 'Ficção Científica', 0, 0, 0, 0, 'HBO Max');
