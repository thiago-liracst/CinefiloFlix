:- use_module(library(pairs)).
:- include('FilmeDB.pl').

filmesMelhorAvaliados :- getPairsAvaliacaoFilme(Pares),
                            keysort(Pares, Sorted),
                            reverse(Sorted, Lista),
                            writeln("Filmes Melhor Avaliados : \n"),
                            listarFilmesAvaliados(Lista,0).
     
listarFilmesAvaliados([],_).
listarFilmesAvaliados(_,5).
listarFilmesAvaliados([K-V|T],I) :- getTituloFilme(V,Titulo),
                                        (K =< 0 -> listarFilmesAvaliados(T,I);
                                        format('~d - ~s', [K,Titulo]),nl,
                                        I1 is I + 1,
                                        listarFilmesAvaliados(T,I1)).
                                            
                                            
                                                                      

horasAssitidasFilmes :-
    writeln("A quantidade total de horas assistidas aparecerá aqui.").

principaisGenerosFilmes :- 
    writeln("A lista com os principais generos aparecerá aqui.").

principaisDiretores :- 
    writeln("A lista com os principais diretores aparecerá aqui.").

seriesMelhorAvaliadas :- 
    writeln("As series melhor avaliadas aparecerão aqui.").

horasAssitidasSeries :-
    writeln("A quantidade total de horas assistidas aparecerá aqui.").

principaisGenerosSeries :- 
    writeln("A lista com os principais generos aparecerá aqui.").

principaisProdutoras :- 
    writeln("A lista com as principais produtoras aparecerá aqui.").