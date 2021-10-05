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
escolheOpcoesMenuPrincipal(2) :- cadastro_midia.

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

%Cadastro de midia 
cadastro_midia :-
    opcoesCadastroMidia,
    read(Opcao),
    escolheOpcoesCadastroMidia(Opcao).

escolheOpcoesCadastroMidia(1) :- tela_cadastro_filme.
escolheOpcoesCadastroMidia(2) :- tela_cadastro_serie.
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


%Cadastro de serie

tela_cadastro_serie :- 
    cadastroTituloSerieMsg,
    read(Titulo),
    recebeTituloSerie(Titulo).

recebeTituloSerie("V") :- menu_principal.
recebeTituloSerie(Titulo) :- 
    cadastroDuracaoEpisodioMsg,
    read(DuracaoEpisodio),
    recebeDuracaoSerie(Titulo, DuracaoEpisodio).

recebeDuracaoSerie(_,"V") :- menu_principal.
recebeDuracaoSerie(Titulo, DuracaoEpisodio) :- 
    cadastroGeneroSerieMsg,
    read(Genero),
    recebeGeneroSerie(Titulo, DuracaoEpisodio, Genero).

recebeGeneroSerie(_,_,"V") :- menu_principal.
recebeGeneroSerie(Titulo, DuracaoEpisodio, Genero) :- 
    cadastroNacionalidadeSerieMsg ,
    read(Nacionalidade),
    recebeNacionalidadeSerie(Titulo, DuracaoEpisodio, Genero, Nacionalidade).

recebeNacionalidadeSerie(_,_,_,"V") :- menu_principal.
recebeNacionalidadeSerie(Titulo, DuracaoEpisodio, Genero, Nacionalidade) :- 
    cadastroProdutoraSerieMsg ,
    read(Produtora),
    fazCadastroSerie(Titulo, DuracaoEpisodio, Genero, Nacionalidade, Produtora).

%fazCadastroSerie(Titulo, DuracaoEpisodio, Genero, Nacionalidade, Produtora):-
 %   confirmacaoCadastroSerieMsg.
