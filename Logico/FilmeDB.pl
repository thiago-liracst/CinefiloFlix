:-use_module(library(csv)).
:-include('Arquivos.pl').

% Adiciona um filme no arquivo
addFilme( Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario) :-
    open('./dados/Filmes.csv', append, File),
    writeln(File, (Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario)),                 
    close(File).

% Verifica se o filme existe, lê o arquivo csv e chama o metodo verificaNaLista que vai ver se o filme está na lista
filmeExiste( Titulo, Result):-
    lerCsvRowList('Filmes.csv', Filmes),
    verificaNaLista( Titulo, Filmes, Result).

% Retorna nome do filme a partir do título
getTitulo( Titulo, Resposta):-
   lerCsvRowList('Filmes.csv', Filmes),
    getEntidadeById( Titulo, Filmes, Filme),
  elementByIndex(1, Filme, Resposta).

concluiFilme(Titulo, Avaliacao, Comentario) :- 
	lerCsvRowList('Filmes.csv', ArrayFilmes),
	getEntidadeById(Titulo, ArrayFilmes, Filme),
	remover(Filme, ArrayFilmes, Filmes),
    visualizaFilme(Titulo),
	darNotaAoFilme(Titulo, Avaliacao, Comentario),
	elementByIndex(5, Filme, Assistido),
	A is 1,
	removeind(5, Filme, FilmeAssistido),
	concatenar(FilmeAssistido, [A], FilmeFinal),
	concatenar(Filmes, [FilmeFinal], FilmesFinal),
	limparCsvFilmes,
	escreverFilmes(FilmesFinal).

% Metodo responsavel por registrar a visualizacao de um filme
visualizaFilme(Titulo) :- 
	lerCsvRowList('Filmes.csv', ArrayFilmes),
	getEntidadeById(Titulo, ArrayFilmes, Filme),
	remover(Filme, ArrayFilmes, Filmes),
	elementByIndex(6, Filme, Assistido),
	V is Visualizacoes+1,
	removeind(6, Filme, FilmeAssistido),
	concatenar(FilmeAssistido, [V], FilmeFinal),
	concatenar(Filmes, [FilmeFinal], FilmesFinal),
	limparCsvFilmes,
	escreverFilmes(FilmesFinal).

% Metodo responsavel pela avaliacao de um filme
darNotaAoFilme(Titulo, Avaliacao, Comentario) :- 
	lerCsvRowList('Filmes.csv', ArrayFilmes),
	getEntidadeById(Titulo, ArrayFilmes, Filme),
	remover(Filme, ArrayFilmes, Filmes),
    comentarFilme(Titulo, Comentario),
	elementByIndex(8, Filme, Avaliacao),
	A is Avaliacao,
	removeind(8, Filme, FilmeAssistido),
	concatenar(FilmeAssistido, [A], FilmeFinal),
    concatenar(Filmes, [FilmeFinal], FilmesFinal),
	limparCsvFilmes,
	escreverFilmes(FilmesFinal).

%Metodo responsavel pelo comentario de um filme
comentarFilme(Titulo, Comentario) :- 
	lerCsvRowList('Filmes.csv', ArrayFilmes),
	getEntidadeById(Titulo, ArrayFilmes, Filme),
	remover(Filme, ArrayFilmes, Filmes),
	elementByIndex(9, Filme, comentario),
	C is Comentario,
	removeind(9, Filme, FilmeAssistido),
	concatenar(FilmeAssistido, [C], FilmeFinal),
	concatenar(Filmes, [FilmeFinal], FilmesFinal),
	limparCsvFilmes,
	escreverFilmes(FilmesFinal).

  

updateFilme( Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario):-
    open('./dados/Filmes.csv', write, File),
    write(File, ''),
    close(File),
    addFilme( Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario).


% Remove todos os filmes do csv
limparCsvFilmes :-
    open('./dados/Filmes.csv', write, File),
    write(File, ''),
    close(File).

% Escreve no csv todos os filmes do array passado como parâmetro
escreverFilmes([]).
escreverFilmes([H|T]) :-
    elementByIndex(0, Filme, Titulo),
    elementByIndex(1, Filme, Diretor),
    elementByIndex(2, Filme, AnoDeLancamento),
    elementByIndex(3, Filme, Genero),
    elementByIndex(4, Filme, Duracao),
    elementByIndex(5, Filme, Assistido),
    elementByIndex(6, Filme, Visualizacoes),
    elementByIndex(7, Filme, Produtora),
    elementByIndex(8, Filme, Avaliacao),
    elementByIndex(9, Filme, Comentario),
    updateFilme(Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario).