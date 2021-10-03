:- include('UserDB.pl').

% Metodo responsavel por verificar se um usuário esta cadastrado.
eh_user(CPF, Result) :- userExiste(CPF, Result).

% Metodo que retorna o nome do user a partir do cpf.
get_nome(CPF, Result) :- getNome(CPF, Result).

% Metodo que verifica se o user ja esta cadastrado, caso nao esteja segue para o novo cadastro.
add_cliente(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita, Result) :- userExiste(CPF, R),
    (R -> Result = "Erro: usuário já cadastrado!";
    adiciona_user(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita, Result)).

% Metodo responsavel por adcionar um usuario no sistema.
adiciona_user(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita, Result) :- 
    addUser(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita),
    resumoUser(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita Result).

% Metodo responsavel por exibir o resumo dos dados de um usuario.
resumoUser(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita, Result):- 
    string_concat('Nome: ', Nome, N),
    string_concat('\nCPF: ', CPF, C),
    string_concat('\nIdade: ', Idade, I),
    string_concat('\nSexo: ', Sexo, S),
    string_concat('\nGenero Favorito: ', GeneroFavorito, G),
    string_concat('\Filme Favorito: ', FilmeFavorito, F),
    string_concat('\Serie Favorita: ', SerieFavorita, SF),
    string_concat('Usuário cadastrado com sucesso!\n', N, R1),
    string_concat(R1, C, R2),
    string_concat(R2, T, R3),
    string_concat(R3, E, Result).
