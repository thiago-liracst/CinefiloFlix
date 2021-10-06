:-use_module(library(csv)).
:-include('Arquivos.pl').

% Adiciona uma  série no arquivo
addSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario) :-
    open('./dados/Series.csv', append, File),
    writeln(File, ( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario)),                 
    close(File).

% Verifica se a série existe, lê o arquivo csv e chama o metodo verificaNaLista que vai ver se o série está na lista
serieExiste( Titulo, Result):-
    lerCsvRowList('Series.csv', Series),
    verificaNaLista( Titulo, Series, Result).

% Retorna nome da série a partir do título
getTitulo( Titulo, Resposta):-
   lerCsvRowList('Series.csv', Series),
    getEntidadeById( Titulo, Series, Serie),
  elementByIndex(1, Serie, Resposta).

updateSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario):-
    open('./dados/Series.csv', write, File),
    write(File, ''),
    close(File),
    addSerie( Titulo, DuracaoMediaEpisodio, Genero, Episodios, Temporadas, EpisodiosTotais, Assistido, Produtora, Avaliacao, Comentario).