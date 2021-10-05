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