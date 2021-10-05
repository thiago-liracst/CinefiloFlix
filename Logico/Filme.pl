:- include('FilmeDB.pl').

% Metodo responsavel por verificar se um filme está cadastrado.
eh_filme(IdFilme, Result) :- filmeExiste(IdFilme, Result).

% Metodo que retorna o nome do título do filme  a partir do ID.
get_titulo(idFilme, Result) :- getTitulo(IdFilme, Result).

% Metodo que verifica se o flme já está cadastrado, caso nao esteja segue para o novo cadastro.
add_filme(IdFilme,Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario, Result) :- filmeExiste(IdFilme, R),
    (R -> Result = "Erro: filme já cadastrado!";
    adiciona_filme(IdFilme, Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario, Result)).

% Metodo responsavel por adcionar um filme no sistema.
adiciona_filme(IdFilme, Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario, Result) :- 
    addFilme(IdFilme, Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario),
    resumoFilme(IdFilme, Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario, Result).

% Metodo responsavel por exibir o resumo dos dados de um filme.
resumoFilme(IdFilme, Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario, Result):- 
    string_concat('Título: ', Titulo, T),
    string_concat('\nDiretor: ', Diretor, D),
    string_concat('\nAnoDeLancamento: ', AnoDeLancamento, AL),
    string_concat('\nGenero: ', Genero, G),
    string_concat('\nDuracao: ', Duracao, DU),
    string_concat('\nAssistido: ', Assistido, AS),
    string_concat('\nVisualizacoes: ', Visualizacoes, V),
    string_concat('\nProdutora: ', Produtora, P),
    string_concat('\nAvaliacao: ', Avaliacao, AV),
    string_concat('\nComentario: ', Comentario, C),
    string_concat('Filme atualizado com sucesso!\n', T, R1),
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
atualizaFilme(IdFilme, Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario, Result):-
    updateFilme(IdFilme, Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario),
    resumoFilme(IdFilme, Titulo, Diretor, AnoDeLancamento, Genero, Duracao, Assistido, Visualizacoes, Produtora, Avaliacao, Comentario, Result).