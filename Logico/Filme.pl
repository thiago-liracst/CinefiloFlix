:- include('FilmeDB.pl').
:- include('Arquivos.pl').

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

% Método responsável pela busca de um filme pelo título
buscaFilmePeloTitulo(Titulo) :- 
    getFilmes(Filmes),
    atom_string(Result, Titulo),
    getEntidadeById(Result, Filmes, Filme),
    toStringFilme(Filme).

% Método responsável pela busca de um filme pelo gênero
buscaFilmePeloGenero(Genero) :-
    getFilmes(Filmes),
    procuraFilmePeloGenero(Genero, Filmes).

% Método responsável por exibir todos os filmes de um determinado gênero
procuraFilmePeloGenero(Genero, []).
procuraFilmePeloGenero(Genero, [H|T]) :-
    elementByIndex(3, H, G),
    atom_string(G, Result),
    (Genero == Result -> toStringFilme(H), procuraFilmePeloGenero(Genero, T);
                    write(''), procuraFilmePeloGenero(Genero, T)).

% Método responsável pela busca de um filme pelo(a) diretor(a)
buscaFilmePeloDiretor(Diretor) :-
    getFilmes(Filmes),
    procuraFilmePeloDiretor(Diretor, Filmes).

% Método responsável por exibir todos os filmes de um(a) determinado(a) diretor(a)
procuraFilmePeloDiretor(Diretor, []).
procuraFilmePeloDiretor(Diretor, [H|T]) :-
    elementByIndex(1, H, D),
    atom_string(D, Result),
    (Diretor == Result -> toStringFilme(H), procuraFilmePeloDiretor(Diretor, T);
                    write(''), procuraFilmePeloDiretor(Diretor, T)).

% Método responsável pela busca de um filme pela produtora
buscaFilmePelaProdutora(Produtora) :-
    getFilmes(Filmes),
    procuraFilmePelaProdutora(Produtora, Filmes).

% Método responsável por exibir todos os filmes de uma determinada produtora
procuraFilmePelaProdutora(Produtora, []).
procuraFilmePelaProdutora(Produtora, [H|T]) :-
    elementByIndex(7, H, P),
    atom_string(P, Result),
    (Produtora == Result -> toStringFilme(H), procuraFilmePelaProdutora(Produtora, T);
                    write(''), procuraFilmePelaProdutora(Produtora, T)).

% Método responsável por listar todos os filmes cadastrados
listaFilmes() :- 
    getFilmes(Result),
    exibeFilmes(Result).

% Método responsável por exibir todos os filmes
exibeFilmes([]).
exibeFilmes([H|T]) :- 
    toStringFilme(H),
    exibeFilmes(T).

% Método responsável por listar as avaliações de todos os filmes cadastrados
listaAvaliacoesFilmes() :- 
    getFilmes(Result),
    exibeAvaliacoesFilmes(Result).

% Método responsável por exibir as avaliações de todos os filmes
exibeAvaliacoesFilmes([]).
exibeAvaliacoesFilmes([H|T]) :- 
    toStringAvaliacaoFilme(H),
    exibeAvaliacoesFilmes(T).

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

% Metodo responsavel por exibir a representação textual de um filme.
toStringFilme(Filme):- 
    elementByIndex(0, Filme, Titulo),
    elementByIndex(1, Filme, Diretor),
    elementByIndex(2, Filme, AnoDeLancamento),
    elementByIndex(3, Filme, Genero),
    elementByIndex(4, Filme, Duracao),
    elementByIndex(5, Filme, Assistido),
    elementByIndex(6, Filme, Visualizacoes),
    elementByIndex(7, Filme, Produtora),
    elementByIndex(8, Filme, Avaliacao),
    elementByIndex(9, Filme, Comentario),
    write('Título: '), write(Titulo),
    write(' - Diretor: '), write(Diretor),
    write(' - Ano De Lançamento: '), write(AnoDeLancamento),
    write(' - Gênero: '), write(Genero),
    write(' - Duração: '), write(Duracao),
    write(' - Assistido: '), write(Assistido),
    write(' - Visualizações: '), write(Visualizacoes),
    write(' - Produtora: '), write(Produtora),
    write(' - Avaliação: '), write(Avaliacao),
    write(' - Comentário: '), write(Comentario), nl.

% Metodo responsavel por exibir um texto referente à avaliação de um filme.
toStringAvaliacaoFilme(Filme):- 
    elementByIndex(0, Filme, Titulo),
    elementByIndex(2, Filme, AnoDeLancamento),
    elementByIndex(8, Filme, Avaliacao),
    elementByIndex(9, Filme, Comentario),
    (Avaliacao == 0 -> write('');
    write('Título: '), write(Titulo),
    write(' - Ano De Lançamento: '), write(AnoDeLancamento),
    write(' - Avaliação: '), write(Avaliacao),
    write(' - Comentário: '), write(Comentario), nl).

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