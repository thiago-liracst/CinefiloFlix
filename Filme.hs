module Filme where

import FilmeDB
import GHC.Base (String, Bool (False))

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

cadastraFilme :: String -> String -> String -> String -> Int -> String  -> String
cadastraFilme titulo diretor anoDeLancamento genero duracao produtora
    | FilmeDB.verificaExistenciaFilmePorTitulo titulo = "Erro: filme já cadastrado!"
    | otherwise = "Cadastrado com sucesso!\n" ++ "id: " ++ show idFilme ++ "\n" ++ toString titulo diretor anoDeLancamento genero duracao produtora
    where idFilme = id_filme (FilmeDB.cadastraFilme titulo diretor anoDeLancamento genero duracao produtora)   

recuperaFilmes :: String
recuperaFilmes
    | not (null filmes) = "\nFilmes:\n" ++ filmes
    | otherwise = "\nNão há filmes para exibir!\n"
    where filmes = concatenaToStringsFilmes FilmeDB.recuperaFilmes
 
assistirFilme :: Int -> Int -> String -> String
assistirFilme id avaliacao comentario
    | not (FilmeDB.verificaExistenciaFilme id) = "Erro: filme não cadastrado!"
    | otherwise = "Filme de id " ++ show idFilme ++ " Concluído!\n"
    where idFilme = id_filme (FilmeDB.assistirFilme id avaliacao comentario)

recomendaFilme :: String
recomendaFilme
    | not (null filme) = "\nFilme recomendado:\n" ++ titulo (head filme)
    | otherwise = "\nNão há filmes para exibir!\n"
    where filme = FilmeDB.recomendaFilme

buscaFilmePorTitulo :: String -> String
buscaFilmePorTitulo titulo
    | not (null filmes) = "\nFilmes:\n" ++ filmes
    | otherwise = "\nNão há filmes para exibir!\n"
    where filmes = concatenaToStringsFilmes (FilmeDB.buscaFilme "titulo" titulo)

buscaFilmePorGenero :: String -> String
buscaFilmePorGenero genero
    | not (null filmes) = "\nFilmes:\n" ++ filmes
    | otherwise = "\nNão há filmes para exibir!\n"
    where filmes = concatenaToStringsFilmes (FilmeDB.buscaFilme "genero" genero)

buscaFilmePorDiretor :: String -> String
buscaFilmePorDiretor diretor
    | not (null filmes) = "\nFilmes:\n" ++ filmes
    | otherwise = "\nNão há filmes para exibir!\n"
    where filmes = concatenaToStringsFilmes (FilmeDB.buscaFilme "diretor" diretor)

buscaFilmePorProdutora :: String -> String
buscaFilmePorProdutora produtora
    | not (null filmes) = "\nFilmes:\n" ++ filmes
    | otherwise = "\nNão há filmes para exibir!\n"
    where filmes = concatenaToStringsFilmes (FilmeDB.buscaFilme "produtora" produtora)

recuperaEstatisticaFilme :: Int -> String
recuperaEstatisticaFilme id_filme
    | not (null estatistica) = "\nAvaliação: " ++ show (avaliacao (head estatistica)) ++ "\nComentário: " ++ comentarios (head estatistica) ++ "\n"
    | otherwise = "\nNão há estatistica para exibir!\n"
    where estatistica = FilmeDB.recuperaEstatistica id_filme

recuperaFilmesAssistidos :: String
recuperaFilmesAssistidos = Filme.formataFilmes FilmeDB.recuperaFilmesAssistidos

concatenaToStringsFilmes :: [Filme] -> String
concatenaToStringsFilmes [] = ""
concatenaToStringsFilmes (filme:outros) = "id: " ++ show (id_filme filme) ++ " - " ++ (FilmeDB.formataFilme filme) ++ "\n" ++ (concatenaToStringsFilmes outros)

toString ::  String -> String -> String -> String -> Int -> String -> String 
toString titulo diretor anoDeLancamento genero duracao produtora =
    "Titulo: " ++ titulo  ++ "\nGênero: " ++ genero ++ "\nDiretor: " ++ diretor 
    ++ "\nAno de lançamento: "  ++ anoDeLancamento ++ "\nDuração: "  ++  show duracao
    ++ "\nProdutora: "  ++ produtora