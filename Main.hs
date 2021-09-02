import Texts
import Util

import Filme
import Serie
import User

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
changeScreen option | option == "1" = telaUpdateUsuario
                    | option == "2" = addMediaScreen
                    | option == "3" = telaAssistirMidia
                    | option == "4" = dashboard
                    | option == "5" = telaRecomendacao 
                    | option == "6" = Texts.goodByeMsg
                    | otherwise = do {Texts.invalidOptionMsg; mainScren}

telaUpdateUsuario :: IO()
telaUpdateUsuario = do
    Texts.pedeNomeUsuarioMsg
    nome <- Util.readStringInput
    if nome == "V"
        then do mainScren
    else do
        Texts.pedeIdadeUsuarioMsg
        idade <- Util.readStringInput
        if idade == "V"
            then do mainScren
        else do
            Texts.pedeSexoUsuarioMsg
            sexo <- Util.readStringInput
            if sexo == "V"
                then do mainScren
            else do
                Texts.pedeGeneroFavoritoMsg
                generoFavorito <- Util.readStringInput
                if generoFavorito == "V"
                    then do mainScren
                else do
                    Texts.pedeFilmeFavoritoMsg
                    filmeFavorito <- Util.readStringInput
                    if filmeFavorito == "V"
                        then do mainScren
                    else do 
                        Texts.pedeSerieFavoritaMsg
                        serieFavorita <- Util.readStringInput
                        if serieFavorita == "V"
                            then do mainScren
                        else do {
                            Texts.confirmacaoUpdateMsg (User.updateUser nome idade sexo generoFavorito filmeFavorito serieFavorita);
                            mainScren
                        }


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
                        Texts.cadastroProdutoraFilmeMsg
                        produtora <- Util.readStringInput
                        if produtora == "V"
                        then do addMediaScreen
                        else do {
                            Texts.confirmacaoCadastroMsg (Filme.cadastraFilme titulo diretor anoLancamento genero (parseToInt(duracao)) produtora);
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
                Texts.cadastroProdutoraSerieMsg
                produtora <- Util.readStringInput
                if produtora == "V"
                then do addMediaScreen
                else do {
                    Texts.confirmacaoCadastroSerieMsg (Serie.cadastraSerie titulo (parseToInt(duracaoMediaEpisodio)) genero produtora);
                    addMediaScreen
                        }

telaAssistirMidia :: IO()
telaAssistirMidia = do
    Texts.opcoesAssistirMsg
    option <-Util.readStringInput
    opcoesAssistirMidia option

opcoesAssistirMidia :: String -> IO()
opcoesAssistirMidia option  | option == "1" = telaAssistirFilme
                            | option == "2" = telaAssistirSerie
                            | option == "3" = mainScren
                            | otherwise = do {Texts.invalidOptionMsg; mainScren}

telaAssistirFilme :: IO()
telaAssistirFilme = do
    Texts.voltarAoMenuMsg

    putStrLn("\n" ++ Filme.listaFilmes ++ "\n")

    Texts.pedeIdFilmeMsg
    id <- Util.readStringInput
    if id == "V"
        then do telaAssistirMidia
    else do
        Texts.avaliacaoFilmeMsg
        avaliacao <- Util.readStringInput
        if avaliacao == "V"
            then do telaAssistirMidia
        else do
            Texts.pedeComentarioFilmeMsg
            comentario <- Util.readStringInput
            if avaliacao == "V"
                then do telaAssistirMidia
            else do {
                Texts.confirmacaoAssistirFilmeMsg (Filme.assistirFilme (read id) (read avaliacao) comentario);
                telaAssistirMidia
            }

telaAssistirSerie :: IO()
telaAssistirSerie = do
    Texts.headerAssistirSerieMsg 
    -- chamar metodo de listar as séries
    putStrLn("\n" ++ Serie.listaSeries ++ "\n")

    Texts.pedeIdSerieMsg
    id <- Util.readStringInput
    if id == "V"
        then do telaAssistirMidia
    else do 
        -- lanca o stts da serie
        Texts.opcoesAssistirSerieMsg
        opcao <-Util.readStringInput
        opcoesAssistirSerie opcao
    

opcoesAssistirSerie :: String -> IO()
opcoesAssistirSerie opcao   | opcao == "1" = telaFinalizaEpisodio
                            | opcao == "2" = telaFinalizaTemporada
                            | opcao == "3" = telaFinalizaSerie
                            | otherwise = do {Texts.invalidOptionMsg; mainScren}

telaFinalizaEpisodio :: IO()
telaFinalizaEpisodio = do 
    -- metodo que finaliza episódio 
    Texts.episodioFinalizadoMsg
    mainScren

telaFinalizaTemporada :: IO()
telaFinalizaTemporada =  do
    --metodo q finaliza temporada
    Texts.temporadaFinalizadaMsg
    mainScren

telaFinalizaSerie :: IO()
telaFinalizaSerie = do
    Texts.voltarAoMenuMsg
    Texts.avaliacaoSerieMsg
    avaliacao <- Util.readStringInput
    if avaliacao == "V"
        then do telaAssistirMidia
    else do
        Texts.pedeComentarioSerieMsg
        comentario <- Util.readStringInput
        if avaliacao == "V"
            then do telaAssistirMidia
        else do {
            -- confirmação e metodo de assistir serie c comentario e avaliacao
            telaAssistirMidia
        }

telaRecomendacao :: IO()
telaRecomendacao = do 
    Texts.opcoesRecomendacoes
    opcao <- Util.readStringInput
    opcoesRecomendacao opcao

opcoesRecomendacao :: String -> IO()
opcoesRecomendacao opcao    | opcao == "1" = telaRecomendacaoFilme
                            | opcao == "2" = telaRecomendacaoSerie
                            | otherwise = do {Texts.invalidOptionMsg; mainScren}

telaRecomendacaoFilme :: IO()
telaRecomendacaoFilme = do
    Texts.recomendacaoDeFilmeMsg
    putStrLn("\n" ++ Filme.recomendaFilme ++ "\n")

telaRecomendacaoSerie :: IO()
telaRecomendacaoSerie = do
    Texts.recomendacaoDeSerieMsg
    putStrLn("\n" ++ Serie.recomendaSerie ++ "\n")


dashboard :: IO()
dashboard = do 
Texts.dashboardScreen
putStrLn("\nOBS: Para voltar ao menu, digite qualquer tecla.\n")
entrada <- getLine
do mainScren
                        