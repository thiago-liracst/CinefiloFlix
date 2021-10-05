% Método que realiza a exibição de resumo do cadastro do cliente.
msgResumoUpdateUser(User) :-
   % put_logo(),
   writeln("       -------ATUALIZADO-------"),
   writeln("\n-----\n"),
   writeln(User),
   writeln("\n-----"),
   msgDigiteS.

% Método que realiza a exibição da mensagem de instrução para voltar alguma operação no sistema.
msgDigiteS() :-
   writeln("\nPara voltar basta digitar 'S'!").