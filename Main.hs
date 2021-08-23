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
                    | option == "5" = Texts.goodByeMsg
                    | option == "4" = dashboard 
                    | otherwise = do {Texts.invalidOptionMsg; mainScren}

addMediaScreen :: IO()
addMediaScreen = do
    Texts.optionsAddMediaScreen
    option <-Util.readStringInput
    changeAddMediaScreen option

changeAddMediaScreen :: String -> IO()
changeAddMediaScreen option | option == "1" = telaCadastraFilme
                            | option == "3" = mainScren
                            | otherwise = do {Texts.invalidOptionMsg; mainScren}

telaCadastraFilme :: IO()
telaCadastraFilme = do
    Texts.cadastroTituloFilmeMsg
    titulo <- Util.readStringInput
    if titulo == "V"
        then do addMediaScreen
    else do 
        Texts.cadastroDiretorFilmeMsg
        diretor <- Util.readStringInput
        if diretor == "V"
        then do addMediaScreen
        else do 
            Texts.cadastroLancamentoFilmeMsg 
            anoLancamento <- Util.readStringInput
            if anoLancamento == "V"
            then do addMediaScreen
            else do
                Texts.cadastroGeneroFilmeMsg
                genero <- Util.readStringInput
                if genero == "V"
                then do addMediaScreen
                else do 
                    Texts.cadastroDuracaoFilmeMsg
                    duracao <- Util.readStringInput
                    if duracao == "V"
                    then do addMediaScreen
                    else do 
                        Texts.cadastroNacionalidadeFilmeMsg
                        nacionalidade <- Util.readStringInput
                        if nacionalidade == "V"
                        then do addMediaScreen
                        else do {
                            Texts.confirmacaoCadastroMsg (Filme.cadastraFilme titulo diretor anoLancamento genero duracao nacionalidade);
                            addMediaScreen
        }


dashboard :: IO()
dashboard = do 
    Texts.dashboardScreen
    putStrLn("\nOBS: Para voltar ao menu, digite qualquer tecla.\n\n")
    entrada <- getLine
    do mainScren
    
                
                
    
            
