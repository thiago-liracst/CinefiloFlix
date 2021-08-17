import Texts
import Util

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
changeScreen option | option == "4" = Texts.goodByeMsg