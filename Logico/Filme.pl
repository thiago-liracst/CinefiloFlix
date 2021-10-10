:- include('FilmeDB.pl').

% Metodo responsavel por verificar se um filme está cadastrado.
eh_filme(Titulo, Result) :- filmeExiste(Titulo, Result).

% Metodo que retorna o nome do título do filme  a partir do ID.
get_titulo(Titulo, Result) :- getTitulo(Titulo, Result).

% Metodo que verifica se o filme já está cadastrado, caso nao esteja segue para o novo cadastro.
add_filme(Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario, Result) :- filmeExiste(Titulo, R),
    (R -> Result = "Erro: filme já cadastrado!";
    adiciona_filme( Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario, Result)).

% Metodo responsavel por adcionar um filme no sistema.
adiciona_filme( Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario, Result) :- 
    addFilme( Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario),
    resumoFilme( Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario, Result).

% Metodo responsavel por exibir o resumo dos dados de um filme.
resumoFilme( Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario, Result):- 
    string_concat('Título: ', Titulo, T),
    string_concat('\nDiretor: ', Diretor, D),
    string_concat('\nAno De Lançamento: ', AnoDeLancamento, AL),
    string_concat('\nGênero: ', Genero, G),
    string_concat('\nDuração: ', Duracao, DU),
    string_concat('\nAssistido: ', Assistido, AS),
    string_concat('\nVisualizações: ', Visualizacoes, V),
    string_concat('\nProdutora: ', Produtora, P),
    string_concat('\nAvaliação: ', Avaliacao, AV),
    string_concat('\nComentário: ', Comentario, C),
    string_concat('Filme cadastrado com sucesso!\n', T, R1),
    string_concat(R1, D, R2),
    string_concat(R2, AL, R3),
    string_concat(R3, G, R4),
    string_concat(R4, DU, R5),
    string_concat(R5, AS, R6),
    string_concat(R6, V, R7),
    string_concat(R7, P, R8),
    string_concat(R8, AV, R9),
    string_concat(R9, C, Result).

% Metodo responsavel por atualizar dados de um filme
atualizaFilme( Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario, Result):-
    updateFilme( Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario),
    resumoFilme( Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario, Result).

% Metodo responsavel por marcar um filme como concluido
concluiFilme(Titulo, Avaliacao, Comentario, R) :- 
    concluiFilme(Titulo, Avaliacao, Comentario),
    %getFilmebyId(Titulo,Filme),
    %writeln(Filme),
    %getVisualizacoes(Filme,Visualizacoes),
    %writeln(Visualizacoes),
    %atomics_to_string([Titulo, Visualizacoes, Avaliacao, Comentario], '\n', String),
    %writeln(String).
    R = "Filme concluido com sucesso.".
    

cadastraFilme(Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario, Result):-
    add_filme(Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario, Result).