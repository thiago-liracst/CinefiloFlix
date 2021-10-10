:-use_module(library(csv)).
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- include('Arquivos.pl').

% Adiciona um filme no arquivo
addFilme( Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario) :-
    open('./dados/Filmes.csv', append, File),
    writeln(File, (Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario)),                 
    close(File).

% Verifica se o filme existe, lê o arquivo csv e chama o metodo verificaNaLista que vai ver se o filme está na lista
filmeExiste(Titulo, Result):-
	atom_string(Titulo1, Titulo),
    lerCsvRowList('Filmes.csv', Filmes),
    verificaNaLista( Titulo1, Filmes, Result).

% Retorna nome do filme a partir do título
getTitulo( Titulo, Resposta):-
   lerCsvRowList('Filmes.csv', Filmes),
    getEntidadeById( Titulo, Filmes, Filme),
  elementByIndex(1, Filme, Resposta).

concluiFilme(Titulo, Avaliacao, Comentario) :- lerCsvRowList('Filmes.csv', ArrayFilmes),
	atom_string(Titulo1, Titulo),
	getEntidadeById(Titulo1, ArrayFilmes, Filme),
	nth0(5, Filme, Assistido1),
	nth0(6, Filme, Visualizacoes),
	nth0(8, Filme, Avaliacao1),
	nth0(9, Filme, Comentario1),
	V is Visualizacoes + 1,
	select(Assistido1, Filme, 1, Filme1),
	select(Visualizacoes, Filme1, V, Filme2),
	select(Avaliacao1, Filme2, Avaliacao, Filme3),
	select(Comentario1, Filme3, Comentario, Filme4),
	selectchk(Filme, ArrayFilmes, Filme4, FilmesFinal),
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
escreverFilmes([Filme|T]) :-
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
    addFilme(Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario),
	escreverFilmes(T).

getTituloFilme(Filme, R):- elementByIndex(0,Filme,Titulo), R = Titulo.
getVisualizacoes(Filme,R):- elementByIndex(6,Filme,Visualizacoes), R = Visualizacoes.
getAvaliacao(Filme,R) :- elementByIndex(8,Filme,Avaliacao), R = Avaliacao.
getComentario(Filme,R) :- elementByIndex(9,Filme,Comentario), R = Comentario.
getFilmebyId(Titulo,R) :- lerCsvRowList('Filmes.csv', Filmes),
							atom_string(Id,Titulo),
							getEntidadeById(Id,Filmes,Filme),
							R = Filme.
getDuracao(Filme,R) :- elementByIndex(4,Filme,R).

getPairsAvaliacaoFilme(Pares) :- lerCsvRowList('Filmes.csv',ArrayFilmes),
									map_list_to_pairs(getAvaliacao, ArrayFilmes, Pares).

getFilmes(Filmes) :- lerCsvRowList('Filmes.csv', Filmes).