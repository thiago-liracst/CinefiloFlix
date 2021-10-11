:-use_module(library(csv)).
:-include('Arquivos.pl').

% Adiciona um usuario no arquivo
addUser(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita) :-
    open('./dados/Users.csv', append, File),
    writeln(File, (CPF, Nome, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita)),                 
    close(File).

% Verifica se o usuario existe, le o arquivo csv e chama o metodo verificaNaLista que vai ver se o usuario está na lista
userExiste(Cpf, Result):-
    lerCsvRowList('Users.csv', Users),
    verificaNaLista(Cpf, Users, Result).

% Retorna nome do Usuario a partir do cpf
getNome(Cpf, Nome):-
    lerCsvRowList('Users.csv', Users),
    getEntidadeById(Cpf, Users, User),
    elementByIndex(1, User, Nome).

updateUser(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita):-
    open('./dados/Users.csv', write, File),
    write(File, ''),
    close(File),
    addUser(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita).