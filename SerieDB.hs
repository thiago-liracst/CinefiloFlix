{-# LANGUAGE OverloadedStrings #-}

module SerieDB where

import           Control.Applicative
import qualified Data.Text as T
import           Database.SQLite.Simple
import           Database.SQLite.Simple.FromRow
import System.Random

import Data.Typeable
import qualified Data.Text.IO as T

import Util (queryBD, fromIO, executeBD, convertStringToInt)
import System.Directory.Internal.Prelude (Num(fromInteger))
import Text.Printf (PrintfArg(parseFormat))

-- Tipo de dado "Serie" que será armazenado no BD
data Serie = Serie {
    id_serie :: Int,
    titulo :: String,
    duracaoMediaEpisodio :: Int,
    genero :: String,
    nacionalidade :: String,
    produtora :: String,
    temporadas :: Int,
    episodios :: Int,
    episodiosTotais :: Int

} deriving (Show)

-- Tipo de dado "EstatisticasDaSerie" que será armazenado no BD
data EstatisticasDaSerie = EstatisticasDaSerie {
    id_estatistica_serie :: Int,
    avaliacao :: Int,
    comentarios :: String

} deriving (Show)

-- Código que serve para que o Haskell entenda como fazer para transformar os valores das linhas do BD
-- novamente em atributos do Objeto Serie.
instance FromRow Serie where
  fromRow = Serie <$> field
                    <*> field
                    <*> field
                    <*> field
                    <*> field
                    <*> field
                    <*> field
                    <*> field
                    <*> field

-- Código que serve para que o Haskell entenda como fazer para transformar os valores das linhas do BD
-- novamente em atributos do Objeto EstatisticasDaSerie.
instance FromRow EstatisticasDaSerie where
  fromRow = EstatisticasDaSerie <$> field
                                    <*> field
                                    <*> field
                                    

-- Código que serve para o Haskell saber como transformar o objeto Serie em uma linha do BD
-- Os atributos da série são passados para o metodo "toRow" que permite que essa série seja inserida no BD.
instance ToRow Serie where
  toRow (Serie id_serie titulo duracaoMediaEpisodio genero nacionalidade produtora temporadas episodios episodiosTotais) =
     toRow (id_serie, titulo, duracaoMediaEpisodio, genero, nacionalidade, produtora, temporadas, episodios, episodiosTotais)   

-- Código que serve para o Haskell saber como transformar o objeto EstatisticasDaSerie em uma linha do BD
-- Os atributos das estatísticas da série são passados para o metodo "toRow" que permite que essas estatísticas sejam inseridas no BD.
instance ToRow EstatisticasDaSerie where
  toRow (EstatisticasDaSerie id_estatistica_serie avaliacao comentarios) =
     toRow (id_estatistica_serie, avaliacao, comentarios) 


-- Método que exibe o título de uma série a partir do id da série.
getTituloSerie :: Int -> String
getTituloSerie id_serie = titulo (head(recuperaSerieID id_serie))

cadastraSerie :: String -> Int -> String -> String -> String -> Serie
cadastraSerie titulo duracaoMediaEpisodio genero nacionalidade produtora  =
    fromIO(addSerie titulo duracaoMediaEpisodio genero nacionalidade produtora)

-- Adiciona serie a partir de título, duracaoMediaEpisodio,, genero
-- OBS: Verificar formato da data antes de fazer a adição no BD
addSerie :: String -> Int -> String -> String -> String  -> IO Serie
addSerie titulo duracaoMediaEpisodio genero nacionalidade produtora = do
    let id = fromIO geraId
    criaBD
    criaBDEstatisticas
    insereDado id titulo duracaoMediaEpisodio genero nacionalidade produtora 1 0 0
    insereDadoBDEstatisticas id 0 "Sem comentários"

    return (head (recuperaSerieID id))

-- Método responsável por inserir os dados no banco de dados.
insereDado :: Int -> String -> Int -> String -> String -> String -> Int -> Int -> Int -> IO()
insereDado id titulo duracaoMediaEpisodio genero nacionalidade produtora temporadas episodios episodiosTotais = do
    executeBD ("INSERT INTO series (id_serie,\
                \ titulo,\
                \ duracaoMediaEpisodio,\
                \ genero,\
                \ nacionalidade,\ 
                \ produtora,\ 
                \ temporadas,\
                \ episodios,\ 
                \ episodiosTotais)\ 
                \ VALUES\
                \ (" ++ show id ++ ",\
                \ '" ++ titulo ++ "',\
                \ " ++ show duracaoMediaEpisodio ++ ",\
                \ '" ++ genero ++ "',\
                \ '" ++ nacionalidade ++ "',\
                \ '" ++ produtora ++ "',\
                \ " ++ show temporadas ++ ",\
                \ " ++ show episodios ++ ",\
                \ " ++ show episodiosTotais ++ ");") ()

-- Método responsável por criar o banco de dados.
criaBD :: IO ()
criaBD = do executeBD "CREATE TABLE IF NOT EXISTS series (\
                 \ id_serie INT PRIMARY KEY, \
                 \ titulo TEXT, \
                 \ duracaoMediaEpisodio INT, \
                 \ genero TEXT, \
                 \ nacionalidade TEXT, \
                 \ produtora TEXT \
                 \ temporadas INT \
                 \ episodios INT \
                 \ episodiosTotais INT \
                 \);" ()

-- Metodo que cria um id para o Banco de dados das séries
geraId :: IO Int
geraId = getStdRandom(randomR (0, 1000)) :: IO Int

-- Metodo que retorna uma lista com todos as séries cadastrados no BD.
recuperaSeries :: [Serie]
recuperaSeries = do
    let resultado = queryBD "SELECT * FROM series"
    let series = fromIO resultado
    series

-- Metodo que retorna uma lista contendo a série do 
-- id passado se ele existir, caso contrário uma lista vazia é retornada.
recuperaSerieID :: Int -> [Serie]
recuperaSerieID id_serie = fromIO (queryBD ("SELECT * FROM series WHERE id_serie = "++ show id_serie ++""))

-- Método que retorna a série  através do seu título passado como parâmetro.
recuperaSerieTitulo :: String -> [Serie]
recuperaSerieTitulo titulo = fromIO (queryBD ("SELECT * FROM series WHERE titulo = '" ++ titulo ++ "'"))

-- Metodo retornar uma lista contendo todos as series do gênero passado como parâmetro da função
recuperaSeriesPorGenero :: String -> [Serie]
recuperaSeriesPorGenero genero = fromIO (queryBD ("SELECT * FROM series WHERE genero = '" ++ genero ++ "'"))

-- Metodo que verifica existência de uma série no Banco de dados e retorna um valor booleano
-- True se ele existir e False se ele não existir
verificaExistenciaSerie :: Int -> Bool
verificaExistenciaSerie id_serie
    | null (recuperaSerieID (read $ show id_serie)) = False
    | otherwise = True

-- Metodo que verifica existência de um serie no Banco de dados e retorna um valor booleano
-- True se ele existir e False se ele não existir
verificaExistenciaSeriePorTitulo :: String -> Bool
verificaExistenciaSeriePorTitulo titulo
    | null (recuperaSerieTitulo titulo) = False
    | otherwise = True

-- Metodo que serve para formatar uma série de series para exibição.
formataSeries :: Int -> [Serie] -> [String]
formataSeries _ [] = []
formataSeries indice series@(serie:resto) = ("[" ++ show (id_serie serie) ++ "] " ++ formataSerie serie) : formataSeries (indice + 1) resto

-- Metodo que serve para formatar um série específico para exibição.
formataSerie :: Serie -> String
formataSerie serie = "Título: " ++ titulo serie ++ ", Gênero: " ++ genero serie

--- pesquisa um id de série para aquele genero, se tiver  daquele genero
pesquisaSerieParaRecomendar:: String -> Int
pesquisaSerieParaRecomendar genero
    | length (recuperaSeriesPorGenero genero) > 0 = randomizaSerie (recuperaSeriesPorGenero genero)
    | otherwise = -1

--método auxiliar que randomiza o id da série
randomizaSerie:: [Serie] -> Int
randomizaSerie series = (id_serie (series!!(randomInt 0 (length series -1))))

-- randomiza o inteiro, recebe o i que é o inicio do range e o j que eh o final do range
randomInt :: Int-> Int -> Int
randomInt i j = fromIO(getStdRandom(randomR (i, j)) :: IO Int)

-- Método responsável por criar o banco de dados.
criaBDEstatisticas :: IO ()
criaBDEstatisticas = do executeBD "CREATE TABLE IF NOT EXISTS estatisticasseries (\
                 \ id_estatistica_serie INT PRIMARY KEY, \
                 \ avaliacao INT, \
                 \ comentarios TEXT \
                 \);" ()

-- Método responsável por inserir os dados das estatísticas no banco de dados.
insereDadoBDEstatisticas :: Int -> Int -> String -> IO()
insereDadoBDEstatisticas id avaliacao comentarios = do
    executeBD ("INSERT INTO estatisticasseries (id_estatistica_serie,\
                \ avaliacao,\
                \ comentarios,\ 
                \ VALUES\
                \ (" ++ show id ++ ",\
                \ " ++ show avaliacao ++ ",\
                \ '" ++ comentarios ++ "');") ()