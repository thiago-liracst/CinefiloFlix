% Método que realiza a exibição de resumo do cadastro do cliente.
msgResumoUpdateUser(User) :-
   % put_logo(),
   writeln("       -------USUÁRIO ATUALIZADO-------"),
   writeln("\n-----\n"),
   writeln(User),
   writeln("\n-----"),
   msgDigiteS.

% Método que realiza a exibição da mensagem de instrução para voltar alguma operação no sistema.
msgDigiteS() :-
   writeln("\nPara voltar basta digitar 'S'!").

% Método que realiza a exibição de resumo do cadastro do filme.
msgResumoCadastroFilme(Filme) :-
   % put_logo(),
   writeln("       -------FILME CADASTRADO-------"),
   writeln("\n-----\n"),
   writeln(Filme),
   writeln("\n-----"),
   msgDigiteS.

% Método que realiza a exibição de resumo do cadastro do filme.
msgResumoCadastroSerie(Serie) :-
   % put_logo(),
   writeln("       -------SÉRIE CADASTRADA-------"),
   writeln("\n-----\n"),
   writeln(Serie),
   writeln("\n-----"),
   msgDigiteS.