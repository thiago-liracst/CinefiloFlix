:- include('Util.pl').
:- include('DashBoard.pl').

opcoesMenuPrincipal() :-
writeln("● ○ ◉ MENU PRINCIPAL ◉ ○ ●"),
writeln("\nComo você quer prosseguir, cinéfilo?"),
writeln("⓵ Alterar Dados"),
writeln("⓶ Cadastrar Mídia"),
writeln("⓷ Assistir Mídia"),
writeln("⓸ Buscar Mídia"),
writeln("⓹ DashBoard"),
writeln("⓺ Recomendações para você"),
writeln("⓻ Lista de avaliações"),
writeln("⓼ Sair\n").

invalidOptionMsg() :-
    writeln("\nOpção Inválida\n").

voltarAoMenuMsg() :-
    writeln("\nOBS: Para voltar ao menu, digite 'V'!").

eAgoraMsg() :-
    writeln("\nO que deseja fazer a seguir?\n").

%Atualização dados user

pedeNomeUsuarioMsg :-
    clear,
    writeln("● ○ ◉ ATUALIZAÇÃO DE DADOS DO USUÁRIO ◉ ○ ●"),
    voltarAoMenuMsg,
    writeln("\nNome: ").

pedeCPFUsuarioMsg :-
    writeln("\nCPF: ").

pedeIdadeUsuarioMsg :-
    writeln("\nIdade: ").

pedeSexoUsuarioMsg :-
    writeln("\nSexo: ").

pedeGeneroFavoritoMsg  :-
    writeln("\nQual é o seu gênero cinematográfico favorito? ").

pedeFilmeFavoritoMsg :-
    writeln("\nQual é o seu filme favorito? ").


pedeSerieFavoritaMsg :-
    writeln("\nQual é a sua série favorita? ").

confirmacaoUpdateMsg(User) :-
    writeln(""),
    writeln(User),
    eAgoraMsg.

% Cadastro de mídia
opcoesCadastroMidia :-
    clear,
    writeln("● ○ ◉ CADASTRO DE MÍDIA ◉ ○ ●\n"),
    writeln("⓵ Cadastrar Filme"),
    writeln("⓶ Cadastrar Série"),
    writeln("⓷ Voltar ao Menu Principal\n").

%Cadastro de filme

cadastroTituloFilmeMsg :-
    clear,
    writeln("● ○ ◉ CADASTRO DE FILME ◉ ○ ●"),
    voltarAoMenuMsg,
    writeln("\nTítulo: ").

cadastroDiretorFilmeMsg :-
    writeln("\nDiretor: ").

cadastroLancamentoFilmeMsg :-
    writeln("\nAno de lançamento: ").

cadastroGeneroFilmeMsg :-
    writeln("\nGênero: ").

cadastroDuracaoFilmeMsg :-
    writeln("\nDuração (Em minutos): ").

cadastroNacionalidadeFilmeMsg :-
    writeln("\nNacionalidade: ").

cadastroProdutoraFilmeMsg :-
    writeln("\nProdutora: ").

confirmacaoCadastroMsg(Filme) :-
    writeln("Cadastro do filme:"),
    writeln(Filme),
    eAgoraMsg.

%Cadastro de serie

cadastroTituloSerieMsg :-
    clear,
    writeln("● ○ ◉ CADASTRO DE SÉRIE ◉ ○ ●"),
    voltarAoMenuMsg,
    writeln("\nTítulo: ").

cadastroDuracaoEpisodioMsg :-
    writeln("\nDuração média (em minutos) do episódio: ").

cadastroGeneroSerieMsg :-
    writeln("\nGênero: ").

cadastroNacionalidadeSerieMsg :-
    writeln("\nNacionalidade: ").

cadastroProdutoraSerieMsg :-
    writeln("\nProdutora: ").

confirmacaoCadastroSerieMsg(Serie) :-
    writeln("Cadastro da série:"),
    writeln(Serie),
    eAgoraMsg.

%Assistir

opcoesAssistirMsg :-
    writeln("O que você deseja, cinéfilo?\n"),
    writeln("⓵ Assistir Filme"),
    writeln("⓶ Assistir Série"),
    writeln("⓷ Voltar ao Menu Principal\n").

% Assistir filme

pedeIdFilmeMsg :-
    writeln("\nPor favor, digite o id do filme que você quer assistir: \n").

avaliacaoFilmeMsg :-
    writeln("\nComo você classifica esse filme?"),
    writeln(" ★"),
    writeln(" ★★"),
    writeln(" ★★★"),
    writeln(" ★★★★"),
    writeln(" ★★★★★").

pedeComentarioFilmeMsg :-
    writeln("\nPor favor, insira um comentário sobre o filme: ").

confirmacaoAssistirFilmeMsg(Filme) :-
    writeln("Filme concluído!"),
    writelnln(Filme),
    eAgoraMsg.

%Assistir serie

pedeIdSerieMsg :-
    writeln("\nPor favor, digite o id da série que você quer assistir: \n").

opcoesAssistirSerieMsg :-
    writeln("\nO quê você deseja fazer, cinéfilo?\n"),
    writeln("⓵ Finalizar Episódio"),
    writeln("⓶ Finalizar Temporada"),
    writeln("⓷ Finalizar Série").

episodioFinalizadoMsg :-
    writeln("Episódio finalizado com sucesso!"),
    eAgoraMsg.

temporadaFinalizadaMsg :-
    writeln("Temporada finalizada com sucesso!"),
    eAgoraMsg.

avaliacaoSerieMsg :-
    writeln("\nComo você classifica esse série?"),
    writeln("★"),
    writeln("★★"),
    writeln("★★★"),
    writeln("★★★★"),
    writeln("★★★★★").

pedeComentarioSerieMsg :-
    writeln("\n Por favor, insira um comentário sobre a série: ").

serieConcluidaMsg :- 
    writeln("\n Serie Concluida com Sucesso!!!\n").
    

%Recomendações

opcoesRecomendacoes :-
    clear,
    writeln("● ○ ◉ RECOMENDAÇÕES ◉ ○ ●"),
    writeln("\nQue tipo de recomendação você gostaria, cinéfilo? \n"),
    writeln("⓵ Recomendação de filmes"),
    writeln("⓶ Recomendação de séries"),
    writeln("⓷ Voltar ao menu principal\n").

recomendacaoDeFilmeMsg :-
    clear,
    writeln("● ○ ◉ RECOMENDAÇÕES DE FILMES ◉ ○ ●"),
    writeln("\nConfira a lista de filmes que foi preparada só para você:").

recomendacaoDeSerieMsg :-
    clear,
    writeln("● ○ ◉ RECOMENDAÇÕES DE SÉRIES ◉ ○ ●"),
    writeln("\nConfira a lista de séries que foi preparada só para você:").

% Busca

opcoesBuscaMsg :-
    writeln("\n● ○ ◉ BUSCA DE MÍDIA ◉ ○ ●"),
    writeln("\nQue tipo de busca você gostaria, cinéfilo? \n"),
    writeln("⓵ Busca filmes"),
    writeln("⓶ Busca séries"),
    writeln("⓷ Voltar ao menu principal\n").

opcoesBuscaFilmeMsg :-
    clear,
    writeln("\n● ○ ◉ BUSCA DE FILME ◉ ○ ●"),
    writeln("\nQue tipo de busca você gostaria, cinéfilo? \n"),
    writeln("⓵ Busca por título"),
    writeln("⓶ Busca por gênero"),
    writeln("⓷ Busca por diretor"),
    writeln("⓸ Busca por produtora"),
    writeln("⓹ Voltar ao menu principal\n").

opcoesBuscaSerieMsg :-
    clear,
    writeln("\n● ○ ◉ BUSCA DE SÉRIE ◉ ○ ●"),
    writeln("\nQue tipo de busca você gostaria, cinéfilo? \n"),
    writeln("⓵ Busca por título"),
    writeln("⓶ Busca por gênero"),
    writeln("⓷ Busca por produtora"),
    writeln("⓸ Voltar ao menu principal\n").

buscaTituloMsg :- 
    writeln("\n● ○ ◉ BUSCA POR TÍTULO ◉ ○ ●"),
    voltarAoMenuMsg,
    writeln("\nPor favor, insira o título que você procura: \n").

buscaGeneroMsg :- 
    writeln("\n● ○ ◉ BUSCA POR GÊNERO ◉ ○ ●"),
    voltarAoMenuMsg,
    writeln("\nPor favor, insira o gênero que você procura: \n").

buscaDiretorMsg :- 
    writeln("\n● ○ ◉ BUSCA POR DIRETOR ◉ ○ ●"),
    voltarAoMenuMsg,
    writeln("Por favor, insira o diretor que você procura: \n").

buscaProdutoraMsg :- 
    writeln("\n● ○ ◉ BUSCA POR PRODUTORA ◉ ○ ●"),
    voltarAoMenuMsg,
    writeln("Por favor, insira a produtora que você procura: \n").

%DashBoard
dashBoardMainScreen :- 
    writeln("● ○ ◉ DASHBOARD ◉ ○ ●"),
    writeln("\nComo você quer prosseguir, cinéfilo? \n"),
    writeln("⓵ DashBoard de Filmes"),
    writeln("⓶ DashBoard de Series"),
    writeln("⓷ Voltar ao menu principal\n").

dashBoardFilmes :- 
    writeln("\n--------------------\n"),
    filmesMelhorAvaliados,
    writeln("\n--------------------\n"),
    horasAssitidasFilmes,
    writeln("\n--------------------\n"),
    principaisGenerosFilmes,
    writeln("\n--------------------\n"),
    principaisDiretores,nl.


dashBoardSeries :- 
    writeln("\n--------------------\n"),
    seriesMelhorAvaliadas,
    writeln("\n--------------------\n"),
    horasAssitidasSeries,
    writeln("\n--------------------\n"),
    principaisGenerosSeries,
    writeln("\n--------------------\n"),
    principaisProdutoras,nl.

%Lista

opcoesListaMsg :-
    writeln("\n● ○ ◉ LISTA DE AVALIAÇÕES ◉ ○ ●"),
    writeln("\nQue tipo de avaliações você gostaria de ver, cinéfilo? \n"),
    writeln("⓵ Avaliações de filmes"),
    writeln("⓶ Avaliações de séries"),
    writeln("⓷ Voltar ao menu principal\n").

listaDeFilmeMsg :-
    clear,
    writeln("\n● ○ ◉ AVALIAÇÕES DE FILMES ◉ ○ ●"),
    voltarAoMenuMsg,
    writeln("\nConfira a lista de avaliações dos filmes:\n").

% pedeIdFilmeAvaliacaoMsg :-
%     writeln("\nPor favor, digite o id do filme que você quer ver as avaliações: \n").

listaDeSerieMsg :-
    clear,
    writeln("\n● ○ ◉ AVALIAÇÕES DE SÉRIES ◉ ○ ●"),
    voltarAoMenuMsg,
    writeln("\nConfira a lista de avaliações das séries:\n").

% pedeIdSerieAvaliacaoMsg :-
%     writeln("\nPor favor, digite o id da série que você quer ver as avaliações: \n").
