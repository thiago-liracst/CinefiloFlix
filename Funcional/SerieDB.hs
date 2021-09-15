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
    episodios :: Int,
    temporadas :: Int,
    episodiosTotais :: Int,
    assistido :: Int,
    produtora :: String

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
  toRow (Serie id_serie titulo duracaoMediaEpisodio genero assistido produtora temporadas episodios episodiosTotais) =
     toRow (id_serie, titulo, duracaoMediaEpisodio, genero, assistido, produtora, temporadas, episodios, episodiosTotais)   

-- Código que serve para o Haskell saber como transformar o objeto EstatisticasDaSerie em uma linha do BD
-- Os atributos das estatísticas da série são passados para o metodo "toRow" que permite que essas estatísticas sejam inseridas no BD.
instance ToRow EstatisticasDaSerie where
  toRow (EstatisticasDaSerie id_estatistica_serie avaliacao comentarios) =
     toRow (id_estatistica_serie, avaliacao, comentarios)


-- Método que exibe o título de uma série a partir do id da série.
getTituloSerie :: Int -> String
getTituloSerie id_serie = titulo (head(recuperaSerieID id_serie))

cadastraSerie :: String -> Int -> String -> String -> Serie
cadastraSerie titulo duracaoMediaEpisodio genero produtora  =
    fromIO (addSerie titulo duracaoMediaEpisodio genero produtora 0) :: Serie

-- Adiciona serie a partir de título, duracaoMediaEpisodio,, genero
-- OBS: Verificar formato da data antes de fazer a adição no BD
addSerie :: String -> Int -> String -> String -> Int -> IO Serie
addSerie titulo duracaoMediaEpisodio genero produtora assistido = do
     let id = fromIO geraId
     insereDado id titulo duracaoMediaEpisodio genero produtora assistido 1 0 0
     insereDadoBDEstatisticas id 0 "Sem comentários"
     return (head (recuperaSerieID id))

-- Método responsável por inserir os dados no banco de dados.
insereDado :: Int -> String -> Int -> String -> String -> Int -> Int -> Int -> Int -> IO()
insereDado id titulo duracaoMediaEpisodio genero produtora assistido temporadas episodios episodiosTotais = do
    executeBD ("INSERT INTO series (id_serie,\
                \ titulo,\
                \ duracaoMediaEpisodio,\
                \ genero,\
                \ assistido,\ 
                \ produtora,\ 
                \ temporadas,\
                \ episodios,\ 
                \ episodiosTotais)\ 
                \ VALUES\
                \ (" ++ show id ++ ",\
                \ '" ++ titulo ++ "',\
                \ " ++ show duracaoMediaEpisodio ++ ",\
                \ '" ++ genero ++ "',\
                \ " ++ show assistido ++ ",\
                \ '" ++ produtora ++ "',\
                \ " ++ show temporadas ++ ",\
                \ " ++ show episodios ++ ",\
                \ " ++ show episodiosTotais ++ ");") ()

-- Método responsável por atualizar a quantidade de episódios de uma temporada de uma série
concluirEpisodioSerie :: Int -> Serie
concluirEpisodioSerie id_serie =
    fromIO(updateEpisodiosSerie id_serie)

updateEpisodiosSerie :: Int -> IO Serie
updateEpisodiosSerie id_serie = do
    updateEpisodios id_serie
    return (head (recuperaSerieID id_serie))

updateEpisodios:: Int -> IO()
updateEpisodios id_serie = do 
    let serie = (head(recuperaSerieID id_serie))
    let episodiosTotaisAtualizada = episodiosTotais(serie) + 1
    let episodiosAtualizada = episodios(serie) + 1
    executeBD ("UPDATE series SET  \
    \ episodios = "++ show episodiosAtualizada ++", \
    \ episodiosTotais = " ++ show episodiosTotaisAtualizada ++ " \
    \WHERE id_serie="++ show id_serie ++";") ()



concluirTemporadaSerie :: Int -> Serie
concluirTemporadaSerie id_serie =
    fromIO(updateTemporadaSerie id_serie)

updateTemporadaSerie :: Int -> IO Serie
updateTemporadaSerie id_serie = do
    updateTemporadas id_serie
    return (head (recuperaSerieID id_serie))

updateTemporadas :: Int -> IO()
updateTemporadas id_serie = do
    let serie = head (recuperaSerieID id_serie)
    let temporadasAtualizada = temporadas (serie) + 1
    executeBD ("UPDATE series SET \
    \(temporadas, episodios) = (\
    \"++ show temporadasAtualizada ++", 0) \
    \WHERE id_serie="++ show id_serie ++";") ()


-- Método responsável por atualizar o status de conclusão de uma série e sua avaliação
concluirSerie :: Int -> Int -> String -> Serie
concluirSerie id avaliacao comentario =
    fromIO(updateStatusSerie id avaliacao comentario)

updateStatusSerie :: Int -> Int -> String -> IO Serie
updateStatusSerie id avaliacao comentario = do
    updateStatus id avaliacao comentario
    return (head (recuperaSerieID id))

updateStatus :: Int -> Int -> String -> IO()
updateStatus id avaliacao comentario = do
    assistirSerie id
    executeBD ("UPDATE estatisticasseries SET \
    \(avaliacao, comentarios) = \
    \ (" ++ show avaliacao ++", '"++ comentario ++"')\
    \ WHERE id_estatistica_serie = " ++ show id ++ ";") ()
assistirSerie :: Int -> IO()
assistirSerie id_serie = do
    executeBD ("UPDATE series SET assistido=1 WHERE id_serie="++ show id_serie ++";") ()



-- Metodo que cria um id para o Banco de dados das séries
geraId :: IO Int
geraId = getStdRandom(randomR (0, 1000)) :: IO Int

-- Metodo que retorna uma lista com todos as séries cadastrados no BD.
recuperaSeries :: [Serie]
recuperaSeries = do
    let resultado = queryBD "SELECT * FROM series"
    let series = fromIO resultado
    series

-- Metodo que retorna uma lista com todos os filmes cadastrados no BD.
recomendaSerie :: [Serie]
recomendaSerie = do
    let genero = recomendaSeriesPorGenero 5
    let consulta = fromIO(queryBD("SELECT * FROM series WHERE genero = '" ++ fst (genero !! 1) ++"';"))
    consulta

recomendaSeriesPorGenero :: Int -> [(String, Int)]
recomendaSeriesPorGenero i  = fromIO (queryBD ( "SELECT genero AS g, COUNT(genero) AS c FROM series GROUP BY genero ORDER BY c DESC LIMIT " ++ show i ++ ""))

-- Metodo que retorna uma lista contendo a série do 
-- id passado se ele existir, caso contrário uma lista vazia é retornada.
recuperaSerieID :: Int -> [Serie]
recuperaSerieID id_serie = fromIO (queryBD ("SELECT * FROM series WHERE id_serie = "++ show id_serie ++ ";"))

-- Método que retorna a série  através do seu título passado como parâmetro.
recuperaSerieTitulo :: String -> [Serie]
recuperaSerieTitulo titulo = fromIO (queryBD ("SELECT * FROM series WHERE titulo = '" ++ titulo ++ "'"))

-- Metodo retornar uma lista contendo todos as series do gênero passado como parâmetro da função
recuperaSeriesPorGenero :: String -> [Serie]
recuperaSeriesPorGenero genero = fromIO (queryBD ("SELECT * FROM series WHERE genero = '" ++ genero ++ "'"))

-- Método que retorna uma lista de séries que correspondam à pesquisa do usuário
buscaSerie :: String -> String -> [Serie]
buscaSerie coluna str = do
    let resultado = queryBD ("SELECT * FROM series WHERE "++ coluna ++" LIKE '%"++ str ++"%';")
    let series = fromIO resultado
    series

-- Método que retorna a avaliação e comentário sobre uma determinada série
recuperaEstatistica :: Int -> [EstatisticasDaSerie]
recuperaEstatistica id_serie = do
    let consulta = fromIO(queryBD("SELECT * FROM estatisticasseries WHERE id_estatistica_serie = "++ show id_serie ++";"))
    consulta

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
formataSerie serie = "Título: " ++ titulo serie ++ ", Gênero: " ++ genero serie ++ ", Produtora: " ++ produtora serie

--- pesquisa um id de série para aquele genero, se tiver  daquele genero
pesquisaSerieParaRecomendar:: String -> Int
pesquisaSerieParaRecomendar genero
    | length (recuperaSeriesPorGenero genero) > 0 = randomizaSerie (recuperaSeriesPorGenero genero)
    | otherwise = -1

--método auxiliar que randomiza o id da série
randomizaSerie:: [Serie] -> Int
randomizaSerie series = id_serie (series!!randomInt 0 (length series -1))

-- randomiza o inteiro, recebe o i que é o inicio do range e o j que eh o final do range
randomInt :: Int-> Int -> Int
randomInt i j = fromIO(getStdRandom(randomR (i, j)) :: IO Int)

-- Método responsável por inserir os dados das estatísticas no banco de dados.
insereDadoBDEstatisticas :: Int -> Int -> String -> IO()
insereDadoBDEstatisticas id avaliacao comentarios = do
    executeBD ("INSERT INTO estatisticasseries (id_estatistica_serie,\
                \ avaliacao,\
                \ comentarios)\ 
                \ VALUES\
                \ (" ++ show id ++ ",\
                \ " ++ show avaliacao ++ ",\
                \ '" ++ comentarios ++ "');") ()


recuperaSeriesPorAvaliacao :: Int -> [EstatisticasDaSerie] 
recuperaSeriesPorAvaliacao i  = fromIO (queryBD ("SELECT * FROM estatisticasseries WHERE avaliacao >= 1 ORDER BY avaliacao DESC LIMIT " ++ show i ++ ""))

recuperaSeriesAssistidas :: [Serie]
recuperaSeriesAssistidas = fromIO (queryBD "SELECT * FROM series WHERE assistido >=1")

recuperaPrincipaisGeneros :: Int -> [(String, Int)]
recuperaPrincipaisGeneros i = fromIO (queryBD ( "SELECT genero AS g, COUNT(genero) AS c FROM series WHERE assistido >=1 GROUP BY genero ORDER BY c DESC LIMIT " ++ show i ++ ""))

recuperaPrincipaisProdutoras :: Int -> [(String, Int)]
recuperaPrincipaisProdutoras i = fromIO (queryBD( "SELECT produtora AS p, COUNT(produtora) AS c FROM series WHERE assistido >= 1 GROUP BY produtora ORDER BY c DESC LIMIT " ++ show i ++ "")) 