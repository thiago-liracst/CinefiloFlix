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
escolheOpcoesMenuPrincipal(2) :- tela_cadastro_midia.
escolheOpcoesMenuPrincipal(3) :- tela_assistir_midia.


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