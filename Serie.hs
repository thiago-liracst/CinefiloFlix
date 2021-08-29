module Serie where

import SerieDB
import GHC.Base (String, Bool (False))

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

cadastraSerie :: String -> Int -> String -> String -> String -> String
cadastraSerie titulo duracaoMediaEpisodio genero  nacionalidade produtora
    | SerieDB.verificaExistenciaSeriePorTitulo titulo = "Erro: Série já cadastrado!"
    | otherwise = "Cadastrada com sucesso!\n" ++ toString titulo duracaoMediaEpisodio genero nacionalidade produtora
    where id_Serie = id_serie (SerieDB.cadastraSerie titulo duracaoMediaEpisodio genero nacionalidade produtora)   

recuperaSeries :: String
recuperaSeries
    | not (null series) = "\nSéries:\n" ++ series
    | otherwise = "\nNão há séries para exibir!\n"
    where series = concatenaToStringsSeries (SerieDB.recuperaSeries)


concatenaToStringsSeries :: [Serie] -> String
concatenaToStringsSeries [] = ""
concatenaToStringsSeries (serie:outros) = "id: " ++ show (id_serie serie) ++ " - " ++ (SerieDB.formataSerie serie) ++ "\n" ++ (concatenaToStringsSeries outros)

toString ::  String -> Int -> String -> String -> String -> String 
toString titulo duracaoMediaEpisodio genero nacionalidade produtora =
    "Titulo: " ++ titulo  ++ "\nGênero: " ++ genero ++ "\nDuração Média por Episódio: " ++  show duracaoMediaEpisodio 
    ++ "\nNacionalidade: "  ++ nacionalidade ++ "\nProdutora: "  ++ produtora