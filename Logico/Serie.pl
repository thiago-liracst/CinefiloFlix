:- include('SerieDB.pl').

% Metodo responsavel por verificar se uma série está cadastrada.
eh_serie(Titulo, Result) :- serieExiste(Titulo, Result).

% Metodo que retorna o nome do título da série a partir do título.
get_titulo(Titulo, Result) :- getTitulo(Titulo, Result).

% Metodo que verifica se a série já está cadastrada, caso nao esteja segue para o novo cadastro.
add_serie(Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario) :- serieExiste(Titulo, R),
    (R -> Result = "Erro: série já cadastrada!";
    adiciona_serie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario, Result)).

% Metodo responsavel por adicionar uma série no sistema.
adiciona_serie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario, Result) :- 
    addSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario),
    resumoSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario, Result).

% Metodo responsavel por exibir o resumo dos dados de um filme.
resumoSerie(  Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario, Result):- 
    string_concat('Título: ', Titulo, T),
    string_concat('\nDuração média por episódio: ', DuracaoMediaEpisodio, D),
    string_concat('\nGênero: ', Genero, G),
    string_concat('\nEpisódios: ', Episodios, EP),
    string_concat('\nTemporadas: ', Temporadas, TE),
    string_concat('\nEpisódios totais: ', EpisodiosTotais, EPT),
    string_concat('\nAssistido: ', Assistido, AS),
    string_concat('\nProdutora: ', Produtora, P),
    string_concat('\nAvaliação: ', Avaliacao, AV),
    string_concat('\nComentário: ', Comentario, C),
    string_concat('Série cadastrada com sucesso!\n', T, R1),
    string_concat(R1, D, R2),
    string_concat(R2, G, R3),
    string_concat(R3, EP, R4),
    string_concat(R4, TE, R5),
    string_concat(R5, EPT, R6),
    string_concat(R6, AS, R7),
    string_concat(R7, P, R8),
    string_concat(R8, AV, R9),
    string_concat(R9, C, Result).

% Metodo responsavel por atualizar dados de um filme
atualizaSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario, Result):-
    updateSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario),
    resumoSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario, Result).

cadastraSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario, Result):-
    add_serie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario).