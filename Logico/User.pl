:- include('UserDB.pl').

% Metodo responsavel por verificar se um usuário esta cadastrado.
eh_user(CPF, Result) :- userExiste(CPF, Result).

% Metodo que retorna o nome do user a partir do cpf.
get_nome(CPF, Result) :- getNome(CPF, Result).

% Metodo que verifica se o user ja esta cadastrado, caso nao esteja segue para o novo cadastro.
add_user(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita, Result) :- userExiste(CPF, R),
    (R -> Result = "Erro: usuário já cadastrado!";
    adiciona_user(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita, Result)).

% Metodo responsavel por adcionar um usuario no sistema.
adiciona_user(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita, Result) :- 
    addUser(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita),
    resumoUser(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita, Result).

% Metodo responsavel por exibir o resumo dos dados de um usuario.
resumoUser(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita, Result):- 
    string_concat('Nome: ', Nome, N),
    string_concat('\nCPF: ', CPF, C),
    string_concat('\nIdade: ', Idade, I),
    string_concat('\nSexo: ', Sexo, S),
    string_concat('\nGenero Favorito: ', GeneroFavorito, G),
    string_concat('\nFilme Favorito: ', FilmeFavorito, F),
    string_concat('\nSerie Favorita: ', SerieFavorita, SF),
    string_concat('Usuário atualizado com sucesso!\n', N, R1),
    string_concat(R1, C, R2),
    string_concat(R2, I, R3),
    string_concat(R3, S, R4),
    string_concat(R4, G, R5),
    string_concat(R5, F, R6),
    string_concat(R6, SF, Result).

% Metodo responsavel por atualizar dados de um usuario
atualizaUser(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita, Result):-
    updateUser(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita),
    resumoUser(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita, Result).
