module Filme where

import FilmeDB

listaFilmes :: String
listaFilmes = Filme.formataFilmes FilmeDB.recuperaFilmes

formataFilmes :: [Filme] -> String
formataFilmes [] = "<<vazio>>"
formataFilmes (x:xs) = geraString (FilmeDB.formataFilmes 1 (x:xs))  ""

geraString :: [String] -> String -> String
geraString [] txt = txt
geraString (x:xs) txt = geraString xs (txt ++ "\n" ++ x)

ehFilme :: Int -> Bool
ehFilme id = FilmeDB.verificaExistenciaFilme id

cadastraFilme :: String -> String -> String -> String -> Int -> String -> String  -> String
cadastraFilme titulo diretor anoDeLancamento genero duracao nacionalidade produtora
    | FilmeDB.verificaExistenciaFilmePorTitulo titulo = "Erro: filme já cadastrado!"
    | otherwise = "\nFilme de id: " ++ show idFilme ++ " cadastrado com sucesso!\n" ++ toString titulo diretor anoDeLancamento genero duracao nacionalidade produtora
    where idFilme = id_filme (FilmeDB.cadastraFilme titulo diretor anoDeLancamento genero duracao nacionalidade produtora)   


recuperaFilmes :: String
recuperaFilmes
    | not (null filmes) = "\nFilmes:\n" ++ filmes
    | otherwise = "\nNão há filmes para exibir!\n"
    where filmes = concatenaToStringsFilmes (FilmeDB.recuperaFilmes)

concatenaToStringsFilmes :: [Filme] -> String
concatenaToStringsFilmes [] = ""
concatenaToStringsFilmes (filme:outros) = "id: " ++ show (id_filme filme) ++ " - " ++ (FilmeDB.formataFilme filme) ++ "\n" ++ (concatenaToStringsFilmes outros)

toString ::  String -> String -> String -> String -> Int -> String  -> String -> String 
toString titulo diretor anoDeLancamento genero duracao nacionalidade produtora =
    "Titulo: " ++ titulo  ++ "\nGênero: " ++ genero ++ "\nDiretor: " ++ diretor 
    ++ "\nAno de lançamento: "  ++ anoDeLancamento ++ "\nDuração: "  ++  show duracao
    ++ "\nNacionalidade: "  ++ nacionalidade ++ "\nProdutora: "  ++ produtora