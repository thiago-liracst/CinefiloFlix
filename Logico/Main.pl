:- (initialization main).
:- include('Util.pl').
:- include('Texts.pl').
:- include('User.pl').
:- include('Info.pl').
:- include('Filme.pl').
:- include('Serie.pl').


main :-
    menu_principal,
    halt.

menu_principal :-
    opcoesMenuPrincipal,
    read(Opcao),
    escolheOpcoesMenuPrincipal(Opcao).

escolheOpcoesMenuPrincipal() :- menu_principal.
escolheOpcoesMenuPrincipal(1) :- update_user.
escolheOpcoesMenuPrincipal(2) :- tela_cadastro_midia.
escolheOpcoesMenuPrincipal(3) :- tela_assistir_midia.
escolheOpcoesMenuPrincipal(4) :- tela_busca.
escolheOpcoesMenuPrincipal(6) :- tela_recomendacoes.

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

tela_cadastro_midia :-
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
    read(AnoDeLancamento),
    recebeLancamentoFilme(Titulo, Diretor, AnoDeLancamento).

recebeLancamentoFilme(_,_,"V") :- menu_principal.
recebeLancamentoFilme(Titulo, Diretor , AnoDeLancamento) :- 
    cadastroGeneroFilmeMsg ,
    read(Genero),
    recebeGeneroFilme(Titulo, Diretor, AnoDeLancamento, Genero).

recebeGeneroFilme(_,_,_,"V") :- menu_principal.
recebeGeneroFilme(Titulo, Diretor , AnoDeLancamento, Genero) :- 
    cadastroDuracaoFilmeMsg ,
    read(Duracao),
    recebeDuracaoFilme(Titulo, Diretor, AnoDeLancamento, Genero, Duracao).

recebeDuracaoFilme(_,_,_,_,"V") :- menu_principal.
recebeDuracaoFilme(Titulo, Diretor , AnoDeLancamento, Genero, Duracao) :- 
    cadastroProdutoraFilmeMsg ,
    read(Produtora),
    fazCadastroFilme(Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Produtora).

fazCadastroFilme(Titulo, Diretor, AnoDeLancamento, Genero, Duracao,  Produtora):-
    atualizaFilme( Titulo, Diretor, AnoDeLancamento, Genero, Duracao, 0 , 0, Produtora, 0, "Sem comentário", Resumo),
    msgResumoCadastroFilme(Resumo),
    read(Opcao),
    retorna(Opcao, menu_principal).
%Cadastro de serie

tela_cadastro_serie :- 
    cadastroTituloSerieMsg,
    read(Titulo),
    recebeTituloSerie(Titulo).

recebeTituloSerie("V") :- menu_principal.
recebeTituloSerie(Titulo) :- 
    cadastroDuracaoEpisodioMsg,
    read(DuracaoMediaEpisodio),
    recebeDuracaoSerie(Titulo, DuracaoMediaEpisodio).

recebeDuracaoSerie(_,"V") :- menu_principal.
recebeDuracaoSerie(Titulo, DuracaoMediaEpisodio) :- 
    cadastroGeneroSerieMsg,
    read(Genero),
    recebeGeneroSerie(Titulo, DuracaoMediaEpisodio, Genero).

recebeGeneroSerie(_,_,"V") :- menu_principal.
recebeGeneroSerie(Titulo, DuracaoMediaEpisodio, Genero) :- 
    cadastroProdutoraSerieMsg ,
    read(Produtora),
    fazCadastroSerie(Titulo, DuracaoMediaEpisodio, Genero,  Produtora).

fazCadastroSerie(Titulo, DuracaoMediaEpisodio, Genero,  Produtora):-
    atualizaSerie( Titulo, DuracaoMediaEpisodio, Genero, 0, 1, 0, 0, Produtora, 0, "Sem comentário", Resumo),
    msgResumoCadastroSerie(Resumo),
    read(Opcao),
    retorna(Opcao, menu_principal).

%Assistir mídia

tela_assistir_midia :-
    opcoesAssistirMsg,
    read(Opcao),
    escolheOpcoesAssistir(Opcao).

escolheOpcoesAssistir(1) :- tela_assiste_filme.
escolheOpcoesAssistir(2) :- tela_assiste_serie.
escolheOpcoesAssistir(3) :- menu_principal.

tela_assiste_filme:-
    %tem que listar os filmes em algum lugar
    pedeIdFilmeMsg,
    read(Id),
    recebeIdFilme(Id).

recebeIdFilme("V") :- menu_principal.
recebeIdFilme(Id) :- 
    avaliacaoFilmeMsg,
    read(Avaliacao),
    recebeAvaliacaoFilme(Id, Avaliacao).

recebeAvaliacaoFilme(_,"V") :- menu_principal.
recebeAvaliacaoFilme(Id, Avaliacao) :- 
    pedeComentarioFilmeMsg ,
    read(Comentario),
    assisteFilme(Id, Avaliacao, Comentario).

%assisteFilme(Id, Avaliacao, Comentario)-:
 %   confirmacaoAssistirFilmeMsg.

 tela_assiste_serie:-
    %tem que listar as series 
    pedeIdSerieMsg,
    read(Id),
    recebeIdSerie(Id).

recebeIdSerie("V") :- menu_principal.
recebeIdSerie(Id) :- 
    opcoesAssistirSerieMsg,
    read(Opcao),
    escolheOpcoesAssistirSerie(Id, Opcao).

escolheOpcoesAssistirSerie(Id,1) :- finaliza_episodio.
escolheOpcoesAssistirSerie(Id,2) :- finaliza_temporada.
escolheOpcoesAssistirSerie(Id,3) :- finaliza_serie.

finaliza_episodio :-
    episodioFinalizadoMsg,
    menu_principal.
    

finaliza_temporada :-
    temporadaFinalizadaMsg,
    menu_principal.

finaliza_serie :-
    avaliacaoSerieMsg ,
    read(AvaliacaoSerie),
    recebeAvaliacaoSerie(AvaliacaoSerie).

recebeAvaliacaoSerie("V") :- menu_principal.
recebeAvaliacaoSerie(AvaliacaoSerie):- 
    pedeComentarioSerieMsg,
    read(ComentarioSerie),
    recebeComentarioSerie(AvaliacaoSerie,ComentarioSerie).

%Busca
tela_busca :-
    opcoesBuscaMsg,
    read(Opcao),
    escolheOpcoesBusca(Opcao).

escolheOpcoesBusca(1) :- tela_busca_filme.
escolheOpcoesBusca(2) :- tela_busca_serie.
escolheOpcoesBusca(3) :- menu_principal.

tela_busca_filme :-
    opcoesBuscaFilmeMsg,
    read(Opcao),
    escolheOpcoesBuscaFilme(Opcao).

escolheOpcoesBuscaFilme(1) :- busca_filme_titulo.
escolheOpcoesBuscaFilme(2) :- busca_filme_genero.
escolheOpcoesBuscaFilme(3) :- busca_filme_diretor.
escolheOpcoesBuscaFilme(4) :- busca_filme_produtora.
escolheOpcoesBuscaFilme(5) :- menu_principal.

busca_filme_titulo :-
    buscaTituloMsg.
    %read(Titulo).
    %coloca metodo que faz a busca

busca_filme_genero :-
    buscaGeneroMsg.
    %read(Genero).
    %coloca metodo que faz a busca

busca_filme_diretor :-
    buscaDiretorMsg.
    %read(Diretor).
    %coloca metodo que faz a busca

busca_filme_produtora:-
    buscaProdutoraMsg.
    %read(Produtora).
    %coloca metodo que faz a busca


tela_busca_serie :-
    opcoesBuscaSerieMsg,
    read(Opcao),
    escolheOpcoesBuscaSerie(Opcao).

escolheOpcoesBuscaSerie(1) :- busca_serie_titulo.
escolheOpcoesBuscaSerie(2) :- busca_serie_genero.
escolheOpcoesBuscaSerie(3) :- busca_serie_diretor.
escolheOpcoesBuscaSerie(4) :- busca_serie_produtora.
escolheOpcoesBuscaSerie(5) :- menu_principal.

busca_serie_titulo :-
    buscaTituloMsg.
    %read(Titulo).
    %coloca metodo que faz a busca

busca_serie_genero :-
    buscaGeneroMsg.
    %read(Genero).
    %coloca metodo que faz a busca

busca_serie_diretor :-
    buscaDiretorMsg.
    %read(Diretor).
    %coloca metodo que faz a busca

busca_serie_produtora:-
    buscaProdutoraMsg.
    %read(Produtora).
    %coloca metodo que faz a busca

%Recomendacoes

tela_recomendacoes :-
    opcoesRecomendacoes,
    read(Opcao),
    escolheOpcoesRecomendacao(Opcao).

escolheOpcoesRecomendacao(1) :- recomendacao_filme.
escolheOpcoesRecomendacao(2) :- recomendacao_serie.
escolheOpcoesRecomendacao(3) :- menu_principal.

recomendacao_filme :-
    recomendacaoDeFilmeMsg.
    %lista os filmes aqui.

recomendacao_serie :-
    recomendacaoDeSerieMsg.
    %lista as series aqui.
    