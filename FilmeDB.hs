{-# LANGUAGE OverloadedStrings #-}

module FilmeDB where

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

-- Tipo de dado "Filme" que será armazenado no BD
data Filme = Filme {
    id_filme :: Int,
    titulo :: String,
    diretor :: String,
    anoDeLancamento :: String,
    genero :: String,
    duracao :: Int,
    assistido :: Int,
    visualizacoes :: Int,
    produtora :: String

} deriving (Show)

-- Tipo de dado "EstatisticasDoFilme" que será armazenado no BD
data EstatisticasDoFilme = EstatisticasDoFilme {
    id_estatistica_filme :: Int,
    avaliacao :: Int,
    comentarios :: String

} deriving (Show)

-- Código que serve para que o Haskell entenda como fazer para transformar os valores das linhas do BD
-- novamente em atributos do Objeto EstatisticasDoFilme.
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


-- Código que serve para que o Haskell entenda como fazer para transformar os valores das linhas do BD
-- novamente em atributos do Objeto EstatisticasDoFilme.
instance FromRow EstatisticasDoFilme where
  fromRow = EstatisticasDoFilme <$> field
                                    <*> field
                                    <*> field
                            
                    


-- Código que serve para o Haskell saber como transformar o objeto Filme em uma linha do BD
-- Os atributos do filme são passados para o metodo "toRow" que permite que esse filme seja inserido no BD.
instance ToRow Filme where
  toRow (Filme id_filme titulo diretor anoDeLancamento genero duracao assistido visualizacoes produtora) =
      toRow (id_filme, titulo, diretor, anoDeLancamento, genero, duracao, assistido, visualizacoes, produtora)

-- Código que serve para o Haskell saber como transformar o objeto EstatisticasDoFilme em uma linha do BD
-- Os atributos das estatísticas do filme são passados para o metodo "toRow" que permite que esse filme seja inserido no BD.
instance ToRow EstatisticasDoFilme where
  toRow (EstatisticasDoFilme id_estatistica_filme avaliacao comentarios) =
      toRow (id_estatistica_filme, avaliacao, comentarios)

-- Método que exibe o título de um filme a partir do id do filme.
getTituloFilme :: Int -> String
getTituloFilme idFilme = titulo (head(recuperaFilmeID idFilme))

cadastraFilme :: String -> String -> String -> String -> Int  -> String -> Filme
cadastraFilme titulo diretor anoDeLancamento genero duracao produtora =
    fromIO(addFilme titulo diretor anoDeLancamento genero duracao produtora) 

-- Adiciona filme a partir de título, diretor, anoDeLancamento, genero
-- OBS: Verificar formato da data antes de fazer a adição no BD
addFilme :: String -> String -> String -> String -> Int -> String -> IO Filme
addFilme titulo diretor anoDeLancamento genero duracao produtora = do
    let id = fromIO geraId

    insereDado id titulo diretor anoDeLancamento genero duracao 0 0 produtora
    insereDadoBDEstatisticas id 0 "Sem comentários"

    return (head (recuperaFilmeID id))
    
-- Método responsável por inserir os dados no banco de dados. 
insereDado :: Int -> String -> String -> String -> String -> Int -> Int -> Int -> String -> IO()
insereDado id titulo diretor anoDeLancamento genero duracao assistido visualizacoes produtora = do
    executeBD ("INSERT INTO filmes (id_filme,\
                \ titulo,\
                \ diretor,\
                \ anoDeLancamento,\
                \ genero,\
                \ duracao,\ 
                \ assistido,\ 
                \ visualizacoes,\ 
                \ produtora) \   
                \ VALUES\
                \ (" ++ show id ++ ",\
                \ '" ++ titulo ++ "',\
                \ '" ++ diretor ++ "',\
                \ '" ++ anoDeLancamento ++ "',\
                \ '" ++ genero ++ "',\
                \ " ++ show duracao ++ ",\
                \ " ++ show assistido ++ ",\
                \ " ++ show visualizacoes ++ ",\
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
    let visualizacoes1 = visualizacoes (head (recuperaFilmeID id))
    let visualizacaoSomado = visualizacoes1 + 1
    executeBD ("UPDATE filmes SET \
                \visualizacoes = " ++ show visualizacaoSomado ++ ", \
                \assistido = 1 \
                \WHERE id_filme = " ++ show id ++ ";")()

    executeBD ("UPDATE estatisticasfilmes SET \
                \avaliacao = " ++ show avaliacao ++ ", \
                \comentarios = '" ++ comentario ++ "' \
                \WHERE id_estatistica_filme =  " ++ show id ++ ";") ()

getVisualizacao :: Int -> [Filme]
getVisualizacao id = fromIO(queryBD ("SELECT visualizacoes FROM filmes WHERE id_filme= "++ show id ++""))

-- Metodo que cria um id para o Banco de dados dos filmes
geraId :: IO Int
geraId = getStdRandom(randomR (0, 1000)) :: IO Int

-- Metodo que retorna uma lista com todos os filmes cadastrados no BD.
recuperaFilmes :: [Filme]
recuperaFilmes = do
    let resultado = queryBD "SELECT * FROM filmes"
    let filmes = fromIO resultado
    filmes

-- Metodo que retorna uma lista contendo o filme do 
-- id passado se ele existir, caso contrário uma lista vazia é retornada.
recuperaFilmeID :: Int -> [Filme]
recuperaFilmeID id_filme = fromIO (queryBD ("SELECT * FROM filmes WHERE id_filme = "++ show id_filme ++";"))

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

-- Método responsável por inserir os dados das estatísticas no banco de dados.
insereDadoBDEstatisticas :: Int -> Int -> String -> IO()
insereDadoBDEstatisticas id avaliacao comentarios = do
    executeBD ("INSERT INTO estatisticasfilmes (id_estatistica_filme,\
                \ avaliacao,\
                \ comentarios) \ 
                \ VALUES\
                \ (" ++ show id ++ ",\
                \ " ++ show avaliacao ++ ",\
                \ '" ++ comentarios ++ "');") ()

recuperaEstatisticas :: [EstatisticasDoFilme] 
recuperaEstatisticas = fromIO (queryBD ("SELECT * FROM estatisticasfilmes;"))

recuperaEstatisticaPorId :: Int -> [EstatisticasDoFilme]
recuperaEstatisticaPorId id = fromIO (queryBD ("SELECT * FROM estatisticasfilmes WHERE id_estatistica_filme = " ++ show id ++ ""))

recuperaFilmesPorAvaliacao :: Int -> [EstatisticasDoFilme] 
recuperaFilmesPorAvaliacao i  = fromIO (queryBD ("SELECT * FROM estatisticasfilmes ORDER BY avaliacao DESC LIMIT " ++ show i ++ ""))

recuperaPrincipaisGeneros :: Int -> [(String, Int)]
recuperaPrincipaisGeneros i  = fromIO (queryBD ( "SELECT genero AS g, COUNT(genero) AS c FROM filmes GROUP BY genero ORDER BY c DESC LIMIT " ++ show i ++ ""))

recuperaPrincipaisDiretores :: Int -> [(String,Int)]
recuperaPrincipaisDiretores i  = fromIO (queryBD( "SELECT diretor AS d, COUNT(diretor) AS c FROM filmes GROUP BY diretor ORDER BY c DESC LIMIT " ++ show i ++ ""))