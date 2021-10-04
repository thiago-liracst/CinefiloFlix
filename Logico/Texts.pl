:- include('Util.pl').

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