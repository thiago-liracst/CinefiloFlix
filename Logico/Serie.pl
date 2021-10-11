:- include('SerieDB.pl').
:- include('Arquivos.pl').

% Metodo responsavel por verificar se uma série está cadastrada.
eh_serie(Titulo, Result) :- serieExiste(Titulo, Result).

% Metodo que retorna o nome do título da série a partir do título.
get_titulo(Titulo, Result) :- getTitulo(Titulo, Result).

% Metodo que verifica se a série já está cadastrada, caso nao esteja segue para o novo cadastro.
add_serie(Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario,Result) :- serieExiste(Titulo, R),
    (R -> Result = "Erro: série já cadastrada!";
    adiciona_serie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario, Result)).

% Metodo responsavel por adicionar uma série no sistema.
adiciona_serie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario, Result) :- 
    addSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario),
    resumoSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario, Result).

% Método responsável pela busca de uma série pelo título
buscaSeriePeloTitulo(Titulo) :- 
    getSeries(Series),
    atom_string(Result, Titulo),
    getEntidadeById(Result, Series, Serie),
    toStringSerie(Serie).

% Método responsável pela busca de uma série pelo gênero
buscaSeriePeloGenero(Genero) :-
    getSeries(Series),
    procuraSeriePeloGenero(Genero, Series).

% Método responsável por exibir todas as séries de um determinado gênero
procuraSeriePeloGenero(Genero, []).
procuraSeriePeloGenero(Genero, [H|T]) :-
    elementByIndex(2, H, G),
    atom_string(G, Result),
    (Genero == Result -> toStringSerie(H), procuraSeriePeloGenero(Genero, T);
                    write(''), procuraSeriePeloGenero(Genero, T)).

% Método responsável pela busca de uma série pela produtora
buscaSeriePelaProdutora(Produtora) :-
    getSeries(Series),
    procuraSeriePelaProdutora(Produtora, Series).

% Método responsável por exibir todas as séries de uma determinada produtora
procuraSeriePelaProdutora(Produtora, []).
procuraSeriePelaProdutora(Produtora, [H|T]) :-
    elementByIndex(7, H, P),
    atom_string(P, Result),
    (Produtora == Result -> toStringSerie(H), procuraSeriePelaProdutora(Produtora, T);
                    write(''), procuraSeriePelaProdutora(Produtora, T)).


% Método responsável por listar todas as séries cadastradas
listaSeries() :- 
    getSeries(Result),
    exibeSeries(Result).

% Método responsável por exibir todas as séries
exibeSeries([]).
exibeSeries([H|T]) :- 
    toStringSerie(H),
    exibeSeries(T).

% Método responsável por listar as avaliações de todas as séries cadastradas
listaAvaliacoesSeries() :- 
    getSeries(Result),
    exibeAvaliacoesSeries(Result).

% Método responsável por exibir as avaliações de todas as séries
exibeAvaliacoesSeries([]).
exibeAvaliacoesSeries([H|T]) :- 
    toStringAvaliacaoSerie(H),
    exibeAvaliacoesSeries(T).

% Metodo responsavel por exibir o resumo dos dados de um filme.
resumoSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario, Result):- 
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

% Metodo responsavel por exibir a representação textual de uma série.
toStringSerie(Filme):- 
    elementByIndex(0, Filme, Titulo),
    elementByIndex(1, Filme, DuracaoMediaEpisodio),
    elementByIndex(2, Filme, Genero),
    elementByIndex(3, Filme, Episodios),
    elementByIndex(4, Filme, Temporadas),
    elementByIndex(5, Filme, EpisodiosTotais),
    elementByIndex(6, Filme, Assistido),
    elementByIndex(7, Filme, Produtora),
    elementByIndex(8, Filme, Avaliacao),
    elementByIndex(9, Filme, Comentario),
    write('Título: '), write(Titulo),
    write(' - Duração média por episódio: '), write(DuracaoMediaEpisodio),
    write(' - Gênero: '), write(Genero),
    write(' - Episódios: '), write(Episodios),
    write(' - Temporadas: '), write(Temporadas),
    write(' - Episódios totais: '), write(EpisodiosTotais),
    write(' - Assistido: '), write(Assistido),
    write(' - Produtora: '), write(Produtora),
    write(' - Avaliação: '), write(Avaliacao),
    write(' - Comentário: '), write(Comentario), nl.

% Metodo responsavel por exibir o texto referente à avaliação de uma série.
toStringAvaliacaoSerie(Filme):- 
    elementByIndex(0, Filme, Titulo),
    elementByIndex(8, Filme, Avaliacao),
    elementByIndex(9, Filme, Comentario),
    (Avaliacao == -1 -> write('');
    write('Título: '), write(Titulo),
    write(' - Avaliação: '), write(Avaliacao),
    write(' - Comentário: '), write(Comentario), nl).

% Metodo responsavel por atualizar dados de um filme
atualizaSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario, Result):-
    updateSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario),
    resumoSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario, Result).

% Metodo responsavel por concluir um episodio de uma serie
concluiEpisodio(Id) :- 
    writeln(Id),
    concluiEpisodioSerie(Id).

% Metodo responsavel por concluir uma temporada de uma serie
concluiTemporada(Titulo) :- 
    concluiTemporadaSerie(Titulo).

% Metodo responsavel por concluir uma serie
concluiSerie(Titulo, Avaliacao, Comentario) :- 
    conclui_Serie(Titulo, Avaliacao, Comentario).

cadastraSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario, Result):-
    add_serie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario,Result).