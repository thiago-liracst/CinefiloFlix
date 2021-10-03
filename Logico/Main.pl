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
escolheOpcoesMenuPrincipal(2) :- cadastro_midia.


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

%Cadastro de midia 

cadastro_midia :-
    opcoesCadastroMidia,
    read(Opcao),
    escolheOpcoesCadastroMidia(Opcao).

escolheOpcoesCadastroMidia(1) :- update_user.
escolheOpcoesCadastroMidia(3) :- menu_principal.

%Cadastro de filme

tela_cadastro_filme :- 
    cadastroTituloFilmeMsg,
    read(Titulo),
    recebeTituloFilme(Titulo).

recebeTituloFilme("V") :- menu_principal.
recebeTituloFilme(Titulo) :- 
    cadastroDiretorFilmeMsg,
    read(Diretor),
    recebeDiretorFilme(Titulo, Diretor).

recebeDiretorFilme(_,"V") :- menu_principal.
recebeDiretorFilme(Titulo, Diretor) :- 
    cadastroLancamentoFilmeMsg,
    read(AnoLancamento),
    recebeLancamentoFilme(Titulo, Diretor, AnoLancamento).

recebeLancamentoFilme(_,_,"V") :- menu_principal.
recebeLancamentoFilme(Titulo, Diretor , AnoLancamento) :- 
    cadastroGeneroFilmeMsg ,
    read(Genero),
    recebeGeneroFilme(Titulo, Diretor, AnoLancamento, Genero).

recebeGeneroFilme(_,_,_,"V") :- menu_principal.
recebeGeneroFilme(Titulo, Diretor , AnoLancamento, Genero) :- 
    cadastroDuracaoFilmeMsg ,
    read(Duracao),
    recebeDuracaoFilme(Titulo, Diretor, AnoLancamento, Genero, Duracao).

recebeDuracaoFilme(_,_,_,_,"V") :- menu_principal.
recebeDuracaoFilme(Titulo, Diretor , AnoLancamento, Genero, Duracao) :- 
    cadastroNacionalidadeFilmeMsg ,
    read(Nacionalidade),
    recebeNacionalidadeFilme(Titulo, Diretor, AnoLancamento, Genero, Duracao, Nacionalidade).

recebeNacionalidadeFilme(_,_,_,_,_,"V") :- menu_principal.
recebeNacionalidadeFilme(Titulo, Diretor , AnoLancamento, Genero, Duracao, Nacionalidade) :- 
    cadastroProdutoraFilmeMsg ,
    read(Produtora),
    fazCadastroFilme(Titulo, Diretor, AnoLancamento, Genero, Duracao, Nacionalidade, Produtora).

%fazCadastroFilme(Titulo, Diretor, AnoLancamento, Genero, Duracao, Nacionalidade, Produtora).