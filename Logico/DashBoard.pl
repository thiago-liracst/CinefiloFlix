:- use_module(library(pairs)).
:- use_module(library(lists)).
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
                                        format('~d. ~s - ~d', [I + 1,Titulo,K]),nl,
                                        I1 is I + 1,
                                        listarFilmesAvaliados(T,I1)).
                                            
horasAssitidasFilmes :- writeln("Principais Generos: \n"),
    getFilmes(Filmes),
    calculaHorasAssistidas(Filmes,0,Result),
    divmod(Result, 60, Horas, Minutos),
    format('O tempo total gasto assistindo filmes é de ~d horas e ~d minutos.\n', [Horas,Minutos]).
                         

calculaHorasAssistidas([],A,Result) :- A = Result.
calculaHorasAssistidas([H|T],A,Result) :- getDuracao(H,Duracao),
                                        Horas is A + Duracao,
                                        calculaHorasAssistidas(T,Horas,Result).

principaisGenerosFilmes :- 
    getFilmes(Filmes),
    getListaGenerosFilme(Filmes,[],ListaGeneros),
    msort(ListaGeneros, Sorted),
    agrupaGeneros(Sorted,[],"",0,R),
    selectchk(0-"", R, R1),
    keysort(R1, Result),
    exibirPrincipaisgeneros(0,Result).

exibirPrincipaisgeneros(_,[]).
exibirPrincipaisgeneros(5,_).
exibirPrincipaisgeneros(I,[H|T]) :- 
    H = K-V,
    format('~d. ~s - ~d\n', [I + 1,V,K]),
    exibirPrincipaisgeneros(I + 1,T).
    

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