:-use_module(library(csv)).
:-include('Arquivos.pl').

% Adiciona uma  série no arquivo
addSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario) :-
    open('./dados/Series.csv', append, File),
    writeln(File, ( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario)),                 
    close(File).

% Verifica se a série existe, lê o arquivo csv e chama o metodo verificaNaLista que vai ver se o série está na lista
serieExiste(Titulo, Result):-
	atom_string(Titulo1, Titulo),
    lerCsvRowList('Series.csv', Series),
    verificaNaLista( Titulo1, Series, Result).

% Retorna nome da série a partir do título
getTitulo( Titulo, Resposta):-
   lerCsvRowList('Series.csv', Series),
    getEntidadeById( Titulo, Series, Serie),
  elementByIndex(1, Serie, Resposta).

% Conclui episodio da serie
concluiEpisodioSerie(Titulo) :-
	lerCsvRowList('Series.csv', ArraySeries),
	atom_string(Titulo1,Titulo),
	getEntidadeById(Titulo1, ArraySeries, Serie),
	nth0(3,Serie,Episodios),
	nth0(5,Serie,EpisodiosTotais),
	E is Episodios + 1,
	ET is EpisodiosTotais + 1,
	selectchk(Episodios, Serie, Serie1),
	nth0(3, Serie2, E, Serie1),
	selectchk(EpisodiosTotais, Serie2, Serie3),
	nth0(5, Serie4, ET, Serie3),
	selectchk(Serie, ArraySeries, Serie4, SeriesFinal),
	
	limparCsvSeries,
	escreverSeries(SeriesFinal).

% Conclui temporada da serie
concluiTemporadaSerie(Titulo) :- lerCsvRowList('Series.csv',ArraySeries),
	atom_string(Titulo1, Titulo),
	getEntidadeById(Titulo1,ArraySeries,Serie),
	nth0(3,Serie,Episodios),
	nth0(4,Serie,Temporadas),
	T is Temporadas + 1,
	selectchk(Episodios, Serie, Serie1),
	nth0(3, Serie2, 0, Serie1),
	selectchk(Temporadas, Serie2, Serie3),
	nth0(4, Serie4, T, Serie3),
	selectchk(Serie, ArraySeries, Serie4, SeriesFinal),
	limparCsvSeries,
	escreverSeries(SeriesFinal).





% Conclui serie
conclui_Serie(Titulo, Avaliacao, Comentario) :- 
	lerCsvRowList('Series.csv', ArraySeries),
	atom_string(Titulo1, Titulo),
	getEntidadeById(Titulo1, ArraySeries, Serie),
	nth0(6, Serie, Assistido1),
	nth0(8, Serie, Avaliacao1),
	nth0(9,Serie, Comentario1),

	selectchk(Assistido1, Serie, Serie1),
	writeln(Serie1),
	nth0(6, Serie2, "true", Serie1),
	writeln(Serie2),
	selectchk(Avaliacao1, Serie2, Serie3),
	writeln(Serie3),
	nth0(8, Serie4, Avaliacao, Serie3),
	writeln(Serie4),
	selectchk(Comentario1, Serie4, Serie5),
	writeln(Serie5),
	nth0(9, Serie6, Comentario, Serie5),
	selectchk(Serie, ArraySeries, Serie6, SeriesFinal),

	limparCsvSeries,
	escreverSeries(SeriesFinal).




updateSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario):-
    open('./dados/Series.csv', write, File),
    write(File, ''),
    close(File),
    addSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario).

% Remove todas as series do csv
limparCsvSeries :-
    open('./dados/Series.csv', write, File),
    write(File, ''),
    close(File).

% Escreve no csv todas as series do array passado como parâmetro
escreverSeries([]).
escreverSeries([Filme|T]) :-
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
    addSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario),
	escreverSeries(T).

getSeries(Result) :- 
		lerCsvRowList('Series.csv', Result).