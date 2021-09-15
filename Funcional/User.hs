module User where

import UserDB
import GHC.Base (String, Bool (False))


updateUser :: String -> String -> String -> String -> String -> String -> String
updateUser nome1 idade sexo generoFavorito filmeFavorito serieFavorita
    | UserDB.verificaExistenciaUserPorNome nome1 = "User cadastrado!"
    | otherwise = "\nUser de nome: " ++ (nome user) ++ " atualizado com sucesso!\n" ++ toString nome1 idade sexo generoFavorito filmeFavorito serieFavorita
    where user = UserDB.updateUser nome1 idade sexo generoFavorito filmeFavorito serieFavorita

recuperaUser :: String
recuperaUser
    | not (null users) = "\nUsers:\n" ++ users
    | otherwise = "\nNão há usuários para exibir!\n"
    where users = concatenaToStringsUsers (UserDB.recuperaUsers)

concatenaToStringsUsers :: [User] -> String
concatenaToStringsUsers [] = ""
concatenaToStringsUsers (user:outros) = "id: " ++ show (id_user user) ++ " - " ++ (UserDB.formataUser user) ++ "\n" ++ (concatenaToStringsUsers outros)

toString ::  String -> String -> String -> String -> String -> String -> String 
toString nome idade sexo generoFavorito filmeFavorito serieFavorita =
    "Nome: " ++ nome  ++ "\nIdade: " ++ idade ++ "\nSexo: " ++ sexo 
    ++ "\nGênero Favorito: "  ++ generoFavorito ++ "\nFilme Favorito: "  ++ filmeFavorito
    ++ "\nSérie Favorita: "  ++ serieFavorita