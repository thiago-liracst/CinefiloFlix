module User where

import UserDB

updateUser :: String -> String -> String -> String -> String -> String -> String
updateUser nome idade sexo generoFavorito filmeFavorito serieFavorita
    | UserDB.verificaExistenciaUserPorNome nome = "User cadastrado!"
    | otherwise = "\nUser de nome: " ++ nome ++ " atualizado com sucesso!\n" ++ toString nome idade sexo generoFavorito filmeFavorito serieFavorita
    where idUser = id_user (UserDB.updateUser nome idade sexo generoFavorito filmeFavorito serieFavorita)

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