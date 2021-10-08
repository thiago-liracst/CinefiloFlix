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

concluiFilme(Titulo) :- 
	lerCsvRowList(Filmes.csv’, ArrayFilmes),
	getEntidadeById(Titulo, ArrayFilmes, Filme),
	remover(Filme, ArrayFilmes, Filmes),
	%avaliaFilme(Titulo),
	elementByIndex(5, Filme, Assistido),
	A is 1,
	removeind(7, Filme, FilmeAssistido),
	concatenar(FilmeAssistido, [A], FilmeFinal),
	concatenar(Filmes, [FilmeFinal], FilmesFinal),
	limparCsvFilmes,
	escreverFilmes(FilmesFinal).
  

updateFilme( Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario):-
    open('./dados/Filmes.csv', write, File),
    write(File, ''),
    close(File),
    addFilme( Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario).