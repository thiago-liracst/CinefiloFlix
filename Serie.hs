module Serie where

import SerieDB
import GHC.Base (String, Bool (False))
import System.Directory.Internal.Prelude (String)

listaSeries :: String
listaSeries = Serie.formataSeries SerieDB.recuperaSeries

formataSeries :: [Serie] -> String
formataSeries [] = "<<vazio>>"
formataSeries (x:xs) = geraString (SerieDB.formataSeries 1 (x:xs))  ""

geraString :: [String] -> String -> String
geraString [] txt = txt
geraString (x:xs) txt = geraString xs (txt ++ "\n" ++ x)

ehSerie :: Int -> Bool
ehSerie id = SerieDB.verificaExistenciaSerie id

cadastraSerie :: String -> Int -> String -> String -> String
cadastraSerie titulo duracaoMediaEpisodio genero produtora
    | SerieDB.verificaExistenciaSeriePorTitulo titulo = "Erro: série já cadastrada!"
    | otherwise = "Cadastrado com sucesso!\n" ++ "id: " ++ show idSerie ++ "\n" ++ toString titulo duracaoMediaEpisodio genero produtora
    where idSerie = id_serie (SerieDB.cadastraSerie titulo duracaoMediaEpisodio genero produtora)  

recuperaSeries :: String
recuperaSeries
    | not (null series) = "\nSéries:\n" ++ series
    | otherwise = "\nNão há séries para exibir!\n"
    where series = concatenaToStringsSeries SerieDB.recuperaSeries

concluirEpisodio :: Int -> String
concluirEpisodio id
    | (SerieDB.verificaExistenciaSerie id == False) = "Erro: série não cadastrada!"
    | otherwise = "Episódio da série de id " ++ show idSerie ++ " Concluída!\n"
    where idSerie = id_serie (SerieDB.concluirEpisodioSerie id)

concluirTemporada :: Int -> String
concluirTemporada id
    | (SerieDB.verificaExistenciaSerie id == False) = "Erro: série não cadastrada!"
    | otherwise = "Temporada da série de id " ++ show idSerie ++ " Concluída!\n"
    where idSerie = id_serie (SerieDB.concluirTemporadaSerie id)

concluirSerie :: Int -> Int -> String -> String
concluirSerie id avaliacao comentario
    | (SerieDB.verificaExistenciaSerie id == False) = "Erro: série não cadastrada!"
    | otherwise = "Série de id " ++ show idSerie ++ " Concluída!\n"
    where idSerie = id_serie (SerieDB.concluirSerie id avaliacao comentario)
    
recomendaSerie :: String
recomendaSerie
    | not (null serie) = "\nSérie recomendada:\n" ++ titulo (head serie)
    | otherwise = "\nNão há séries para exibir!\n"
    where serie = SerieDB.recomendaSerie

concatenaToStringsSeries :: [Serie] -> String
concatenaToStringsSeries [] = ""
concatenaToStringsSeries (serie:outros) = "id: " ++ show (id_serie serie) ++ " - " ++ SerieDB.formataSerie serie ++ "\n" ++ concatenaToStringsSeries outros

toString ::  String -> Int -> String -> String -> String 
toString titulo duracaoMediaEpisodio genero produtora =
    "Titulo: " ++ titulo  ++ "\nGênero: " ++ genero ++ "\nDuração Média por Episódio: " ++  show duracaoMediaEpisodio 
    ++ "\nProdutora: "  ++ produtora