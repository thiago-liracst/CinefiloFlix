:- (initialization main).
:- include('Util.pl').
:- include('Texts.pl').


main :-
    menu_principal,
    halt.

menu_principal :-
    opcoesMenuPrincipal,
    read(Opcao),
    escolheOpcoesMenuPrincipal(Opcao).

escolheOpcoesMenuPrincipal() :- menu_principal.
escolheOpcoesMenuPrincipal(1) :- update_user.


%Update do usuario

update_user :- 
    pedeNomeUsuarioMsg,
    read(Nome),
    recebeNomeUsuario(Nome).

recebeNomeUsuario("V") :- menu_principal.
recebeNomeUsuario(Nome) :- 
    pedeIdadeUsuarioMsg,
    read(Idade),
    recebeIdadeUsuario(Nome, Idade).

recebeIdadeUsuario(_,"V") :- menu_principal.
recebeIdadeUsuario(Nome, Idade) :- 
    pedeSexoUsuarioMsg,
    read(Sexo),
    recebeSexoUsuario(Nome, Idade, Sexo).

recebeSexoUsuario(_,_,"V") :- menu_principal.
recebeSexoUsuario(Nome, Idade, Sexo) :- 
    pedeGeneroFavoritoMsg,
    read(GeneroFavorito),
    recebeGeneroFavorito(Nome, Idade, Sexo, GeneroFavorito).

recebeGeneroFavorito(_,_,_,"V") :- menu_principal.
recebeGeneroFavorito(Nome, Idade, Sexo, GeneroFavorito) :- 
    pedeFilmeFavoritoMsg,
    read(FilmeFavorito),
    recebeFilmeFavorito(Nome, Idade, Sexo, GeneroFavorito, FilmeFavorito).

recebeFilmeFavorito(_,_,_,_,"V") :- menu_principal.
recebeFilmeFavorito(Nome, Idade, Sexo, GeneroFavorito, FilmeFavorito) :- 
    pedeSerieFavoritaMsg,
    read(SerieFavorita),
    %metodo q faz update
    fazUpdateUser(Nome, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita).

%fazUpdateUser(Nome, Idade, Sexo, GeneroFavorito, FilmeFavorito, SerieFavorita):-
   % confirmacaoUpdateMsg.