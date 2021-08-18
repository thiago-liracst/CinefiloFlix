import Texts
import Util

import Filme

main :: IO()
main = do
    Texts.printLogo
    mainScren

mainScren :: IO()
mainScren = do
    Texts.optionsStartMenu

    option <-Util.readStringInput
    changeScreen option

changeScreen :: String -> IO()
changeScreen option | option == "2" = addMediaScreen
                    | option == "4" = Texts.goodByeMsg
                    | otherwise = do {Texts.invalidOptionMsg; mainScren}

addMediaScreen :: IO()
addMediaScreen = do
    Texts.optionsAddMediaScreen
    option <-Util.readStringInput
    changeAddMediaScreen option

changeAddMediaScreen :: String -> IO()
changeAddMediaScreen option | option == "3" = mainScren
                            | otherwise = do {Texts.invalidOptionMsg; mainScren}

cadastraFilme :: String -> String -> String -> String -> String
cadastraFilme titulo diretor dataLancamento genero =
    Filme.cadastraFilme titulo diretor dataLancamento genero
