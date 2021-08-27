import Texts
import Util

import Filme
import Serie

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
                    | option == "3" = telaAssistirMidia
                    | option == "4" = dashboard 
                    | option == "5" = Texts.goodByeMsg
                    | otherwise = do {Texts.invalidOptionMsg; mainScren}

addMediaScreen :: IO()
addMediaScreen = do
    Texts.optionsAddMediaScreen
    option <-Util.readStringInput
    changeAddMediaScreen option

changeAddMediaScreen :: String -> IO()
changeAddMediaScreen option | option == "1" = telaCadastraFilme
                            | option == "2" = telaCadastraSerie
                            | option == "3" = mainScren
                            | otherwise = do {Texts.invalidOptionMsg; mainScren}


parseToInt :: String -> Int
parseToInt num = read (num) :: Int

--retornaZero :: Int
--retornaZero = 0

--comentarioInicial :: String
--comentarioInicial = "Sem comentários."

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
                        else do 
                            Texts.cadastroProdutoraFilmeMsg
                            produtora <- Util.readStringInput
                            if produtora == "V"
                            then do addMediaScreen
                            else do {
                                Texts.confirmacaoCadastroMsg (Filme.cadastraFilme titulo diretor anoLancamento genero (parseToInt(duracao)) nacionalidade produtora);
                                addMediaScreen
        }

telaCadastraSerie :: IO()
telaCadastraSerie = do
    Texts.cadastroTituloSerieMsg
    titulo <- Util.readStringInput
    if titulo == "V"
        then do addMediaScreen
    else do 
        Texts.cadastroDuracaoEpisodioMsg
        duracaoMediaEpisodio <- Util.readStringInput
        if duracaoMediaEpisodio == "V"
        then do addMediaScreen
        else do 
            Texts.cadastroGeneroSerieMsg 
            genero <- Util.readStringInput
            if genero == "V"
            then do addMediaScreen
            else do
                Texts.cadastroNacionalidadeSerieMsg
                nacionalidade <- Util.readStringInput
                if nacionalidade == "V"
                then do addMediaScreen
                else do 
                    Texts.cadastroProdutoraSerieMsg
                    produtora <- Util.readStringInput
                    if produtora == "V"
                    then do addMediaScreen
                    else do {
                        Texts.confirmacaoCadastroSerieMsg (Serie.cadastraSerie titulo (parseToInt(duracaoMediaEpisodio)) genero nacionalidade produtora);
                        addMediaScreen
                            }

telaAssistirMidia :: IO()
telaAssistirMidia = do
    Texts.opcoesAssistirMsg
    option <-Util.readStringInput
    opcoesAssistirMidia option

opcoesAssistirMidia :: String -> IO()
opcoesAssistirMidia option  | option == "1" = telaAssistirFilme
                            --- | option == "2" = telaAssistirSerie
                            | option == "3" = mainScren
                            | otherwise = do {Texts.invalidOptionMsg; mainScren}

telaAssistirFilme :: IO()
telaAssistirFilme = do
    Texts.voltarAoMenuMsg

    Texts.pedeIdFilmeMsg
    id <- Util.readStringInput
    if id == "V"
        then do addMediaScreen
    else do
        Texts.avaliacaoFilmeMsg
        avaliacao <- Util.readStringInput
        if avaliacao == "V"
            then do addMediaScreen
        else do
            Texts.pedeComentarioFilmeMsg
            comentario <- Util.readStringInput
            if avaliacao == "V"
                then do addMediaScreen
            else do {
                Texts.confirmacaoAssistirFilmeMsg (Filme.assistirFilme (parseToInt(id)) (parseToInt(avaliacao)) comentario);
                addMediaScreen
            }




dashboard :: IO()
dashboard = do 
Texts.dashboardScreen
putStrLn("\nOBS: Para voltar ao menu, digite qualquer tecla.\n\n")
entrada <- getLine
do mainScren
                        