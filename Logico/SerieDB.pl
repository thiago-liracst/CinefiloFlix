:-use_module(library(csv)).
:-include('Arquivos.pl').

% Adiciona uma  série no arquivo
addSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario) :-
    open('./dados/Series.csv', append, File),
    writeln(File, ( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario)),                 
    close(File).

% Verifica se a série existe, lê o arquivo csv e chama o metodo verificaNaLista que vai ver se o série está na lista
serieExiste( Titulo, Result):-
    lerCsvRowList('Series.csv', Series),
    verificaNaLista( Titulo, Series, Result).

% Retorna nome da série a partir do título
getTitulo( Titulo, Resposta):-
   lerCsvRowList('Series.csv', Series),
    getEntidadeById( Titulo, Series, Serie),
  elementByIndex(1, Serie, Resposta).

% Conclui episodio da serie
concluiEpisodioSerie(Titulo) :-
	lerCsvRowList(‘Series.csv’, ArraySeries),
	getEntidadeById(Titulo, ArraySeries, Serie),
	remover(Serie, ArraySeries, Series),
	incrementaEpisodiosTotaisSerie(Titulo),
	elementByIndex(3, Serie, Episodios),
	E is Episodios+1,
	removeind(3, Serie, EpisodioConcluido),
	concatenar(EpisodioConcluido, [E], SerieFinal),
	concatenar(Series, [SerieFinal], SeriesFinal),
	limparCsvSeries,
	escreverSeries(SeriesFinal).

% Conclui temporada da serie
concluiTemporadaSerie(Titulo) :-
	lerCsvRowList(‘Series.csv’, ArraySeries),
	getEntidadeById(Titulo, ArraySeries, Serie),
	remover(Serie, ArraySeries, Series),
	zeraEpisodiosSerie(Titulo),
	elementByIndex(4, Serie, Temporadas),
	T is Temporadas+1,
	removeind(4, Serie, TemporadaConcluida),
	concatenar(TemporadaConcluida, [E], SerieFinal),
	concatenar(Series, [SerieFinal], SeriesFinal),
	limparCsvSeries,
	escreverSeries(SeriesFinal).

% Zera episodios da serie
zeraEpisodiosSerie(Titulo) :-
	lerCsvRowList(‘Series.csv’, ArraySeries),
	getEntidadeById(Titulo, ArraySeries, Serie),
	remover(Serie, ArraySeries, Series),
	elementByIndex(3, Serie, Episodios),
	E is 0,
	removeind(3, Serie, EpisodiosZerados),
	concatenar(EpisodiosZerados, [E], SerieFinal),
	concatenar(Series, [SerieFinal], SeriesFinal),
	limparCsvSeries,
	escreverSeries(SeriesFinal).

% Incrementa episodios totais da serie
incrementaEpisodiosTotaisSerie(Titulo) :-
	lerCsvRowList(‘Series.csv’, ArraySeries),
	getEntidadeById(Titulo, ArraySeries, Serie),
	remover(Serie, ArraySeries, Series),
	elementByIndex(5, Serie, EpisodiosTotais),
	E is EpisodiosTotais+1,
	removeind(5, Serie, EpTotais),
	concatenar(EpTotais, [E], SerieFinal),
	concatenar(Series, [SerieFinal], SeriesFinal),
	limparCsvSeries,
	escreverSeries(SeriesFinal).

% Conclui serie
concluiSerie(Titulo, Avaliacao, Comentario) :- 
	lerCsvRowList(Series.csv’, ArraySeries),
	getEntidadeById(Titulo, ArraySeries, Serie),
	remover(Serie, ArraySeries, Series),
	darNotaASerie(Titulo, Avaliacao, Comentario),
	elementByIndex(6, Serie, Assistido),
	A is 1,
	removeind(6, Serie, SerieAssistida),
	concatenar(SerieAssistida, [A], SerieFinal),
	concatenar(Series, [SerieFinal], SeriesFinal),
	limparCsvSeries,
	escreverSeries(SeriesFinal).

%Metodo responsavel pela avaliacao de uma serie
darNotaASerie(Titulo, Avaliacao, Comentario) :- 
	lerCsvRowList(Series.csv’, ArraySeries),
	getEntidadeById(Titulo, ArraySeries, Serie),
	remover(Serie, ArraySeries, Series),
    comentarSerie(Titulo, Comentario),
	elementByIndex(8, Serie, avaliacao),
	A is Avaliacao,
	removeind(8, Serie, SerieAssistida),
	concatenar(SerieAssistida, [A], SerieFinal),
	concatenar(Series, [SerieFinal], SeriesFinal),
	limparCsvSeries,
	escreverSeries(SeriesFinal).

% Metodo responsavel pelo comentario de uma serie
comentarSerie(Titulo, Comentario) :- 
	lerCsvRowList(‘Series.csv’, ArraySeries),
	getEntidadeById(Titulo, ArraySeries, Serie),
	remover(Serie, ArraySeries, Series),
	elementByIndex(9, Serie, comentario),
	C is Comentario,
	removeind(9, Serie, SerieAssistida),
	concatenar(SerieAssistida, [C], SerieFinal),
	concatenar(Series, [SerieFinal], SeriesFinal),
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
escreverSeries([H|T]) :-
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
    updateSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario).