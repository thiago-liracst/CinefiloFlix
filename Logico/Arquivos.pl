
% Le o arquivo .csv e retorna uma lista de listas, cada lista é uma entidae
% ex: [[Cpf1, Nome1, Telefone1, Endereco1], [Cpf2, Nome2, Telefone2, Endereco2]].
lerCsvRowList(Arquivo,Lists):-
    atom_concat('./dados/', Arquivo, Path),
    csv_read_file(Path, Rows, []),
    rows_to_lists(Rows, Lists).

rows_to_lists(Rows, Lists):- maplist(row_to_list, Rows, Lists).

row_to_list(Row, List):-
    Row =.. [row|List].

% Método utilitário que retorna um elemento por seu indice
elementByIndex(0, [H|_], H):- !.
elementByIndex(I, [_|T], E):- X is I - 1, elementByIndex(X, T, E).

% Verifica se a entidade está na lista, a partir do identificador unico
verificaNaLista(_,[], false).
verificaNaLista(SearchedId, [H|T], Result) :-
     idCadastrado(SearchedId, H, Cadastrado),
     (Cadastrado -> Result = true
     ;verificaNaLista(SearchedId, T, R),
     Result = R).

idCadastrado(_,[], false).
idCadastrado(SearchedId, [H|T], Result) :-
    H =:= SearchedId -> Result = true
    ; Result = false.

% Retorna o Id da entidade. É assumido que esse identificador é elemento da cabeça da lista.
getEntidadeId([], []).
getEntidadeId([H|T], H).

% Retorna o elemento que possui o ID correspondente ao solicitado.
getEntidadeById(_, [], []).
getEntidadeById(Id, [H|T], Result) :-
    getEntidadeId(H, EntidadeID),
    (EntidadeID =:= Id 
        -> Result = H
        ; getEntidadeById(Id, T, R),
        Result = R
    ).

% Remove elementos de uma lista
remover(X, [X|T], T).
remover(X, [H|T], [H|T1]):- remover(X,T,T1).

% Remove um elemento da lista a partir do índice
removeind(0,[_|T],T):- !.
removeind(I,[H|T],R):- X is I - 1, removeind(X, T, Y), insereInicio(H, Y, R).

% Insere um elemento no início de uma lista
insereInicio(H, L, [H|L]):- !.

% Concatena elementos de uma lista
concatenar([], L, L).
concatenar([H|T], L, [H|D]) :- concatenar(T, L, D).
