:- (initialization main).
:- include('Util.pl').
:- include('Texts.pl').
:- include('User.pl').
:- include('Info.pl').


main :-
    menu_principal,
    halt.

menu_principal :-
    opcoesMenuPrincipal,
    read(Opcao),
    escolheOpcoesMenuPrincipal(Opcao).

escolheOpcoesMenuPrincipal() :- menu_principal.
escolheOpcoesMenuPrincipal(1) :- update_user.

% Metodo responsavel por retornar a uma funcao especifica X, 
% ou persistir em caso de opcao invalida.
retorna("S", X) :- X.
retorna(_, X) :- msgDigiteS, read(Opcao), retorna(Opcao, X).

%Update do usuario
update_user :- 
    pedeNomeUsuarioMsg,
    read(Nome),
    recebeNomeUsuario(Nome).

recebeNomeUsuario("V") :- menu_principal.
recebeNomeUsuario(Nome) :- 
    pedeCPFUsuarioMsg,
    read(CPF),
    recebeCPFUsuario(Nome, CPF).

recebeCPFUsuario(_,"V") :- menu_principal.
recebeCPFUsuario(Nome, CPF) :- 
    pedeIdadeUsuarioMsg,
    read(Idade),
    recebeIdadeUsuario(Nome, CPF, Idade).

recebeIdadeUsuario(_,_,"V") :- menu_principal.
recebeIdadeUsuario(Nome, CPF, Idade) :- 
    pedeSexoUsuarioMsg,
    read(Sexo),
    recebeSexoUsuario(Nome, CPF, Idade, Sexo).

recebeSexoUsuario(_,_,_,"V") :- menu_principal.
recebeSexoUsuario(Nome, CPF, Idade, Sexo) :- 
    pedeGeneroFavoritoMsg,
    read(GeneroFavorito),
    recebeGeneroFavorito(Nome, CPF, Idade, Sexo, GeneroFavorito).

recebeGeneroFavorito(_,_,_,_,"V") :- menu_principal.
recebeGeneroFavorito(Nome, CPF, Idade, Sexo, GeneroFavorito) :- 
    pedeFilmeFavoritoMsg,
    read(FilmeFavorito),
    recebeFilmeFavorito(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito).

recebeFilmeFavorito(_,_,_,_,_,"V") :- menu_principal.
recebeFilmeFavorito(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito) :- 
    pedeSerieFavoritaMsg,
    read(SerieFavorita),
    %metodo q faz update
    fazUpdateUser(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita).

fazUpdateUser(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita):-
   atualizaUser(Nome, CPF, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita, Resumo),
   msgResumoUpdateUser(Resumo),
   read(Opcao),
   retorna(Opcao, menu_principal).