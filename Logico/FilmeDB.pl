:-use_module(library(csv)).
:-include('Arquivos.pl').

% Adiciona um filme no arquivo
addFilme(IdFilme, Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario) :-
    open('./dados/Filmes.csv', append, File),
    writeln(File, (IdFilme, Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario)),                 
    close(File).

% Verifica se o filme existe, lê o arquivo csv e chama o metodo verificaNaLista que vai ver se o filme está na lista
filmeExiste(IdFilme, Result):-
    lerCsvRowList('Filmes.csv', Filmes),
    verificaNaLista(IdFilme, Filmes, Result).

% Retorna nome do Usuario a partir do cpf
getTitulo(IdFilme, Titulo):-
    lerCsvRowList('Filmes.csv', Filmes),
    getEntidadeById(IdFilme, Filmes, Filme),
    elementByIndex(1, Filme, Titulo).

updateFilme(IdFilme, Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario):-
    open('./dados/Filmes.csv', write, File),
    write(File, ''),
    close(File),
    addFilme(IdFilme, Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario).