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