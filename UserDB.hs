{-# LANGUAGE OverloadedStrings #-}

module UserDB where

import           Control.Applicative
import qualified Data.Text as T
import           Database.SQLite.Simple
import           Database.SQLite.Simple.FromRow
import System.Random

import Data.Typeable
import qualified Data.Text.IO as T

import Util (queryBD, fromIO, executeBD)

-- Tipo de dado "User" que será armazenado no BD
data User = User {
    id_user :: Int,
    nome :: String,
    idade :: String,
    sexo :: String,
    generoFavorito :: String,
    filmeFavorito :: String,
    serieFavorita :: String

} deriving (Show)

-- Código que serve para que o Haskell entenda como fazer para transformar os valores das linhas do BD
-- novamente em atributos do Objeto User.
instance FromRow User where
  fromRow = User <$> field
                    <*> field
                    <*> field
                    <*> field
                    <*> field
                    <*> field
                    <*> field
                    


-- Código que serve para o Haskell saber como transformar o objeto User em uma linha do BD
-- Os atributos do user são passados para o metodo "toRow" que permite que esse user seja inserido no BD.
instance ToRow User where
  toRow (User id_user nome idade sexo generoFavorito filmeFavorito serieFavorita) = toRow (id_user, nome, idade, sexo, generoFavorito, filmeFavorito, serieFavorita)


updateUser :: String -> String -> String -> String -> String -> String  -> User
updateUser nome idade sexo generoFavorito filmeFavorito serieFavorita =
    fromIO(upUser nome idade sexo generoFavorito filmeFavorito serieFavorita) 

-- Adiciona user a partir de título, diretor, anoDeLancamento, genero
-- OBS: Verificar formato da data antes de fazer a adição no BD
upUser :: String -> String -> String -> String -> String -> String -> IO User
upUser nome idade sexo generoFavorito filmeFavorito serieFavorita = do
    let id = 1
    updateData id nome idade sexo generoFavorito filmeFavorito serieFavorita

    return (head (recuperaUserID id))

-- Método responsável por inserir os dados no banco de dados.
updateData :: Int -> String -> String -> String -> String -> String -> String ->IO()
updateData id nome idade sexo generoFavorito filmeFavorito serieFavorita = do
    executeBD ("UPDATE user SET (id_user,\
                \ nome,\
                \ idade,\
                \ sexo,\
                \ generoFavorito,\
                \ filmeFavorito,\               
                \ serieFavorita)\
                \ =\
                \ (" ++ show id ++ ",\
                \ '" ++ nome ++ "',\
                \ '" ++ idade ++ "',\
                \ '" ++ sexo ++ "',\
                \ '" ++ generoFavorito ++ "',\
                \ '" ++ filmeFavorito ++ "',\
                \ '" ++ serieFavorita ++ "') WHERE id_user = '" ++ show id ++ "';") ()

verificaExistenciaUserPorNome :: String -> Bool
verificaExistenciaUserPorNome nome
    | null (recuperaUserPorNome nome) = False
    | otherwise = False

-- Metodo que retorna uma lista com todos os users cadastrados no BD de ALOKA.
recuperaUsers :: [User]
recuperaUsers = do
    let resultado = queryBD "SELECT * FROM user"
    let users = fromIO resultado
    users

-- Metodo que retorna uma lista contendo o user do 
-- id passado se ele existir, caso contrário uma lista vazia é retornada.
recuperaUserID :: Int -> [User]
recuperaUserID id_user = fromIO (queryBD ("SELECT * FROM user WHERE id_user = " ++ show id_user))

-- Método que retorno o user através do seu título passado como parâmetro.
recuperaUserPorNome :: String -> [User]
recuperaUserPorNome nome = fromIO (queryBD ("SELECT * FROM user WHERE nome = '" ++ nome ++ "'"))

-- Metodo que serve para formatar um user específico para exibição.
formataUser :: User -> String
formataUser user = "Nome: " ++ nome user
