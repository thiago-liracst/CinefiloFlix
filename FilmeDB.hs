{-# LANGUAGE OverloadedStrings #-}

module FilmeDB where

import           Control.Applicative
import qualified Data.Text as T
import           Database.SQLite.Simple
import           Database.SQLite.Simple.FromRow
import System.Random

import Data.Typeable
import qualified Data.Text.IO as T

import Util (queryBD, fromIO, executeBD)

-- Tipo de dado "Filme" que será armazenado no BD
data Filme = Filme {
    id_filme :: Int,
    titulo :: String,
    diretor :: String,
    anoDeLancamento :: String,
    genero :: String,
    duracao :: Int,
    nacionalidade :: String,
    visualizacoes :: Int,
    produtora :: String

} deriving (Show)

-- Código que serve para que o Haskell entenda como fazer para transformar os valores das linhas do BD
-- novamente em atributos do Objeto Filme.
instance FromRow Filme where
  fromRow = Filme <$> field
                    <*> field
                    <*> field
                    <*> field
                    <*> field
                    <*> field
                    <*> field
                    <*> field
                    <*> field            
                    


-- Código que serve para o Haskell saber como transformar o objeto Filme em uma linha do BD
-- Os atributos do filme são passados para o metodo "toRow" que permite que esse filme seja inserido no BD.
instance ToRow Filme where
  toRow (Filme id_filme titulo diretor anoDeLancamento genero duracao nacionalidade visualizacoes produtora) =
     toRow (id_filme, titulo, diretor, anoDeLancamento, genero, duracao, nacionalidade, visualizacoes, produtora)

-- Método que exibe o título de um filme a partir do id do filme.
getTituloFilme :: Int -> String
getTituloFilme idFilme = titulo (head(recuperaFilmeID idFilme))

cadastraFilme :: String -> String -> String -> String -> Int -> String  -> String -> Filme
cadastraFilme titulo diretor anoDeLancamento genero duracao nacionalidade produtora =
    fromIO(addFilme titulo diretor anoDeLancamento genero duracao nacionalidade produtora) 

-- Adiciona filme a partir de título, diretor, anoDeLancamento, genero
-- OBS: Verificar formato da data antes de fazer a adição no BD
addFilme :: String -> String -> String -> String -> Int -> String -> String -> IO Filme
addFilme titulo diretor anoDeLancamento genero duracao nacionalidade produtora = do
    let id = fromIO geraId
    criaBD
    insereDado id titulo diretor anoDeLancamento genero duracao nacionalidade produtora

    return (head (recuperaFilmeID id))
    
-- Método responsável por inserir os dados no banco de dados. (avaliação inicia com -1 para indicar que o filme não foi avaliado ainda)
insereDado :: Int -> String -> String -> String -> String -> Int -> String -> String -> IO()
insereDado id titulo diretor anoDeLancamento genero duracao nacionalidade produtora = do
    executeBD ("INSERT INTO filmes (id_filme,\
                \ titulo,\
                \ diretor,\
                \ anoDeLancamento,\
                \ genero,\
                \ duracao,\ 
                \ nacionalidade,\ 
                \ produtora,\   
                \ VALUES\
                \ (" ++ show id ++ ",\
                \ '" ++ titulo ++ "',\
                \ '" ++ diretor ++ "',\
                \ '" ++ anoDeLancamento ++ "',\
                \ '" ++ genero ++ "',\
                \ " ++ show duracao ++ ",\
                \ '" ++ nacionalidade ++ "',\
                \ '" ++ produtora ++ "');") ()

-- Método responsável por alterar o status de acompanhamento de um filme
assistirFilme :: Int -> Int -> String -> Filme
assistirFilme id avaliacao comentario = 
    fromIO(updateStatusFilme id avaliacao comentario)

updateStatusFilme :: Int -> Int -> String -> IO Filme
updateStatusFilme id avaliacao comentario = do
    updateStatus id avaliacao comentario
    return (head (recuperaFilmeID id))

updateStatus :: Int -> Int -> String -> IO()
updateStatus id avaliacao comentario = do
    let filme = recuperaFilmeID id
    executeBD ("UPDATE filmes SET (assistido, visualizacoes, avaliacao, comentario) = \
        \ (1, 2, "++ show avaliacao ++", '"++ comentario ++"') \
        \ WHERE id_filme = "++ show id ++";") ()

-- Método responsável por criar o banco de dados.
criaBD :: IO ()
criaBD = do executeBD "CREATE TABLE IF NOT EXISTS filmes (\
                 \ id_filme INT PRIMARY KEY, \
                 \ titulo TEXT, \
                 \ diretor TEXT, \
                 \ anoDeLancamento TEXT, \
                 \ genero TEXT, \
                 \ duracao INT, \
                 \ nacionalidade TEXT, \
                 \ visualizacoes INT, \
                 \ produtora TEXT \
                 \);" ()

-- Metodo que cria um id para o Banco de dados dos filmes
geraId :: IO Int
geraId = getStdRandom(randomR (0, 1000)) :: IO Int

-- Metodo que retorna uma lista com todos os filmes cadastrados no BD de ALOKA.
recuperaFilmes :: [Filme]
recuperaFilmes = do
    let resultado = queryBD "SELECT * FROM filmes"
    let filmes = fromIO resultado
    filmes

-- Metodo que retorna uma lista contendo o filme do 
-- id passado se ele existir, caso contrário uma lista vazia é retornada.
recuperaFilmeID :: Int -> [Filme]
recuperaFilmeID id_filme = fromIO (queryBD ("SELECT * FROM filmes WHERE id_filme = "++ show id_filme ++""))

-- Método que retorno o filme através do seu título passado como parâmetro.
recuperaFilmeTitulo :: String -> [Filme]
recuperaFilmeTitulo titulo = fromIO (queryBD ("SELECT * FROM filmes WHERE titulo = '" ++ titulo ++ "'"))

-- Metodo retornar uma lista contendo todos os filmes do gênero passado como parâmetro da função
recuperaFilmesPorGenero :: String -> [Filme]
recuperaFilmesPorGenero genero = fromIO (queryBD ("SELECT * FROM filmes WHERE genero = '" ++ genero ++ "'"))

-- Metodo que verifica existência de um filme no Banco de dados e retorna um valor booleano
-- True se ele existir e False se ele não existir
verificaExistenciaFilme :: Int -> Bool
verificaExistenciaFilme id_filme
    | null (recuperaFilmeID (read $ show id_filme)) = False
    | otherwise = True

-- Metodo que verifica existência de um filme no Banco de dados e retorna um valor booleano
-- True se ele existir e False se ele não existir
verificaExistenciaFilmePorTitulo :: String -> Bool
verificaExistenciaFilmePorTitulo titulo
    | null (recuperaFilmeTitulo titulo) = False
    | otherwise = True

-- Metodo que serve para formatar uma lista de filmes para exibição.
formataFilmes :: Int -> [Filme] -> [String]
formataFilmes _ [] = []
formataFilmes indice filmes@(filme:resto) = ("[" ++ show (id_filme filme) ++ "] " ++ formataFilme filme) : formataFilmes (indice + 1) resto

-- Metodo que serve para formatar um filme específico para exibição.
formataFilme :: Filme -> String
formataFilme filme = "Título: " ++ titulo filme ++ ", Gênero: " ++ genero filme

--- pesquisa um id de filme para aquele genero, se tiver filmes daquele genero
pesquisaFilmeParaRecomendar:: String -> Int
pesquisaFilmeParaRecomendar genero
    | length (recuperaFilmesPorGenero genero) > 0 = randomizaFilme (recuperaFilmesPorGenero genero)
    | otherwise = -1

--método auxiliar que randomiza o id do filme
randomizaFilme:: [Filme] -> Int
randomizaFilme filmes = (id_filme (filmes!!(randomInt 0 (length filmes-1))))

-- randomiza o inteiro, recebe o i que é o inicio do range e o j que eh o final do range
randomInt :: Int-> Int -> Int
randomInt i j = fromIO(getStdRandom(randomR (i, j)) :: IO Int)