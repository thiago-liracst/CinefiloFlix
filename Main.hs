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
                    | option == "4" = telaBuscarMidia
                    | option == "5" = dashboard
                    | option == "6" = telaRecomendacao 
                    | option == "7" = telaListaAvaliacoes 
                    | option == "8" = Texts.goodByeMsg
                    | otherwise = do {Texts.invalidOptionMsg; mainScren}

telaUpdateUsuario :: IO()
telaUpdateUsuario = do
    Texts.pedeNomeUsuarioMsg
    nome <- Util.readStringInput
    if nome == "V" || nome == "v"
        then do mainScren
    else do
        Texts.pedeIdadeUsuarioMsg
        idade <- Util.readStringInput
        if idade == "V" || idade == "v"
            then do mainScren
        else do
            Texts.pedeSexoUsuarioMsg
            sexo <- Util.readStringInput
            if sexo == "V" ||  sexo == "v"
                then do mainScren
            else do
                Texts.pedeGeneroFavoritoMsg
                generoFavorito <- Util.readStringInput
                if generoFavorito == "V" || generoFavorito == "v"
                    then do mainScren
                else do
                    Texts.pedeFilmeFavoritoMsg
                    filmeFavorito <- Util.readStringInput
                    if filmeFavorito == "V" || filmeFavorito == "v"
                        then do mainScren
                    else do 
                        Texts.pedeSerieFavoritaMsg
                        serieFavorita <- Util.readStringInput
                        if serieFavorita == "V" || serieFavorita == "v"
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
    if titulo == "V" || titulo == "v"
        then do addMediaScreen
    else do 
        Texts.cadastroDiretorFilmeMsg
        diretor <- Util.readStringInput
        if diretor == "V" || diretor == "v"
        then do addMediaScreen
        else do 
            Texts.cadastroLancamentoFilmeMsg 
            anoLancamento <- Util.readStringInput
            if anoLancamento == "V" || anoLancamento == "v"
            then do addMediaScreen
            else do
                Texts.cadastroGeneroFilmeMsg
                genero <- Util.readStringInput
                if genero == "V" || genero == "v"
                then do addMediaScreen
                else do 
                    Texts.cadastroDuracaoFilmeMsg
                    duracao <- Util.readStringInput
                    if duracao == "V" || duracao == "v"
                    then do addMediaScreen
                    else do  
                        Texts.cadastroProdutoraFilmeMsg
                        produtora <- Util.readStringInput
                        if produtora == "V" || produtora == "v"
                        then do addMediaScreen
                        else do {
                            Texts.confirmacaoCadastroMsg (Filme.cadastraFilme titulo diretor anoLancamento genero (parseToInt(duracao)) produtora);
                            mainScren
        }

telaCadastraSerie :: IO()
telaCadastraSerie = do
    Texts.cadastroTituloSerieMsg
    titulo <- Util.readStringInput
    if titulo == "V" || titulo == "v"
        then do addMediaScreen
    else do 
        Texts.cadastroDuracaoEpisodioMsg
        duracaoMediaEpisodio <- Util.readStringInput
        if duracaoMediaEpisodio == "V" || duracaoMediaEpisodio == "v"
        then do addMediaScreen
        else do 
            Texts.cadastroGeneroSerieMsg 
            genero <- Util.readStringInput
            if genero == "V" || genero == "v"
            then do addMediaScreen
            else do 
                Texts.cadastroProdutoraSerieMsg
                produtora <- Util.readStringInput
                if produtora == "V" || produtora == "v"
                then do addMediaScreen
                else do {
                    Texts.confirmacaoCadastroSerieMsg (Serie.cadastraSerie titulo (parseToInt(duracaoMediaEpisodio)) genero produtora);
                    mainScren
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
                            | option == "V" = telaAssistirMidia
                            | option == "v" = telaAssistirMidia
                            | otherwise = do {Texts.invalidOptionMsg; mainScren}

telaAssistirFilme :: IO()
telaAssistirFilme = do
    Texts.voltarAoMenuMsg

    putStrLn("\n" ++ Filme.listaFilmes ++ "\n")

    Texts.pedeIdFilmeMsg
    id <- Util.readStringInput
    if id == "V" || id == "v"
        then do telaAssistirMidia
    else do
        Texts.avaliacaoFilmeMsg
        avaliacao <- Util.readStringInput
        if avaliacao == "V" || avaliacao == "v"
            then do telaAssistirMidia
        else do
            Texts.pedeComentarioFilmeMsg
            comentario <- Util.readStringInput
            if comentario == "V" || comentario == "v"
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
    if id == "V" || id == "v"
        then do telaAssistirMidia
    else do 
        putStrLn(Serie.exibirStatusSerie (read id))
        Texts.opcoesAssistirSerieMsg
        opcao <-Util.readStringInput
        opcoesAssistirSerie opcao (read id)
    

opcoesAssistirSerie :: String -> Int -> IO()
opcoesAssistirSerie opcao id  
    | opcao == "1" = telaFinalizaEpisodio id
    | opcao == "2" = telaFinalizaTemporada id
    | opcao == "3" = telaFinalizaSerie id
    | otherwise = do {Texts.invalidOptionMsg; mainScren}

telaFinalizaEpisodio :: Int -> IO()
telaFinalizaEpisodio id = do 
    putStrLn(Serie.concluirEpisodio id)
    Texts.episodioFinalizadoMsg
    mainScren

telaFinalizaTemporada :: Int ->  IO()
telaFinalizaTemporada id =  do
    putStrLn(Serie.concluirTemporada id)
    Texts.temporadaFinalizadaMsg
    mainScren

telaFinalizaSerie :: Int -> IO()
telaFinalizaSerie id = do
    Texts.voltarAoMenuMsg
    Texts.avaliacaoSerieMsg
    avaliacao <- Util.readStringInput
    if avaliacao == "V" || avaliacao == "v"
        then do telaAssistirMidia
    else do
        Texts.pedeComentarioSerieMsg
        comentario <- Util.readStringInput
        if comentario == "V" || comentario == "v"
            then do telaAssistirMidia
        else do 
            putStrLn((Serie.concluirSerie id (read avaliacao) comentario))
            telaAssistirMidia
        

telaRecomendacao :: IO()
telaRecomendacao = do 
    Texts.opcoesRecomendacoes
    opcao <- Util.readStringInput
    opcoesRecomendacao opcao

opcoesRecomendacao :: String -> IO()
opcoesRecomendacao opcao    | opcao == "1" = telaRecomendacaoFilme
                            | opcao == "2" = telaRecomendacaoSerie
                            | opcao == "3" = mainScren
                            | otherwise = do {Texts.invalidOptionMsg; mainScren}

telaRecomendacaoFilme :: IO()
telaRecomendacaoFilme = do
    Texts.recomendacaoDeFilmeMsg
    putStrLn("\n" ++ Filme.recomendaFilme ++ "\n")
    Texts.eAgoraMsg
    mainScren

telaRecomendacaoSerie :: IO()
telaRecomendacaoSerie = do
    Texts.recomendacaoDeSerieMsg
    putStrLn("\n" ++ Serie.recomendaSerie ++ "\n")
    Texts.eAgoraMsg
    mainScren


dashboard :: IO()
dashboard = do
    Texts.dashboardMainScreen
    opcao <- Util.readStringInput
    opcoesDashBoard opcao

    putStrLn("\nOBS: Para voltar ao menu, digite qualquer tecla.\n")
    entrada <- getLine
    mainScren

opcoesDashBoard :: String -> IO()
opcoesDashBoard opcao
    |(opcao == "1") = Texts.telaDashBoardFilmes
    |(opcao == "2") = Texts.telaDashBoarsSeries
    |(opcao == "3") = mainScren
    |otherwise = do {Texts.invalidOptionMsg; dashboard}


telaBuscarMidia :: IO()
telaBuscarMidia = do
    Texts.opcoesBuscaMsg
    opcao <- Util.readStringInput
    opcoesBusca opcao

opcoesBusca :: String -> IO()
opcoesBusca opcao   | opcao == "1" = telaBuscaFilme
                    | opcao == "2" = telaBuscaSerie
                    | opcao == "3" = mainScren
                    | otherwise = do {Texts.invalidOptionMsg; mainScren}

telaBuscaFilme :: IO()
telaBuscaFilme = do
    Texts.opcoesBuscaFilmeMsg
    opcao <- Util.readStringInput
    opcoesBuscaFilme opcao

opcoesBuscaFilme :: String -> IO()
opcoesBuscaFilme opcao   | opcao == "1" = telaBuscaTituloFilme
                    | opcao == "2" = telaBuscaGeneroFilme
                    | opcao == "3" = telaBuscaDiretorFilme
                    | opcao == "4" = telaBuscaProdutoraFilme
                    | opcao == "5" = mainScren
                    | otherwise = do {Texts.invalidOptionMsg; mainScren}

telaBuscaSerie :: IO()
telaBuscaSerie = do
    Texts.opcoesBuscaSerieMsg
    opcao <- Util.readStringInput
    opcoesBuscaSerie opcao

opcoesBuscaSerie :: String -> IO()
opcoesBuscaSerie opcao   | opcao == "1" = telaBuscaTituloSerie
                    | opcao == "2" = telaBuscaGeneroSerie
                    | opcao == "3" = telaBuscaProdutoraSerie
                    | opcao == "4" = mainScren
                    | otherwise = do {Texts.invalidOptionMsg; mainScren}

telaBuscaTituloFilme :: IO()
telaBuscaTituloFilme = do
    Texts.buscaTituloMsg
    titulo <- Util.readStringInput
    if titulo == "V" || titulo == "v"
        then do telaBuscarMidia
    else do 
        putStrLn(Filme.buscaFilmePorTitulo titulo)
        Texts.eAgoraMsg
        mainScren

telaBuscaTituloSerie :: IO()
telaBuscaTituloSerie = do
    Texts.buscaTituloMsg
    titulo <- Util.readStringInput
    if titulo == "V" || titulo == "v"
        then do telaBuscarMidia
    else do 
        putStrLn(Serie.buscaSeriePorTitulo titulo)
        Texts.eAgoraMsg
        mainScren

telaBuscaGeneroFilme :: IO()
telaBuscaGeneroFilme = do
    Texts.buscaGeneroMsg
    genero <- Util.readStringInput
    if genero == "V" || genero == "v"
        then do telaBuscarMidia
    else do
        putStrLn(Filme.buscaFilmePorGenero genero)
        Texts.eAgoraMsg
        mainScren

telaBuscaGeneroSerie :: IO()
telaBuscaGeneroSerie = do
    Texts.buscaGeneroMsg
    genero <- Util.readStringInput
    if genero == "V" || genero == "v"
        then do telaBuscarMidia
    else do
        putStrLn(Serie.buscaSeriePorGenero genero)
        Texts.eAgoraMsg
        mainScren
    
telaBuscaDiretorFilme :: IO()
telaBuscaDiretorFilme = do
    Texts.buscaDiretorMsg
    diretor <- Util.readStringInput
    if diretor == "V" ||  diretor == "v"
        then do telaBuscarMidia
    else do
        putStrLn(Filme.buscaFilmePorDiretor diretor)
        Texts.eAgoraMsg
        mainScren
    
telaBuscaProdutoraFilme :: IO()
telaBuscaProdutoraFilme = do
    Texts.buscaProdutoraMsg
    produtora <- Util.readStringInput
    if produtora == "V" || produtora == "v"
        then do telaBuscarMidia
    else do
        putStrLn(Filme.buscaFilmePorProdutora produtora)
        Texts.eAgoraMsg
        mainScren

telaBuscaProdutoraSerie :: IO()
telaBuscaProdutoraSerie = do
    Texts.buscaProdutoraMsg
    produtora <- Util.readStringInput
    if produtora == "V" || produtora == "v"
        then do telaBuscarMidia
    else do
        putStrLn(Serie.buscaSeriePorProdutora produtora)
        Texts.eAgoraMsg
        mainScren
    
telaListaAvaliacoes :: IO()
telaListaAvaliacoes = do
    Texts.opcoesListaMsg
    opcao <- Util.readStringInput
    opcoesLista opcao

opcoesLista :: String -> IO()
opcoesLista opcao   | opcao == "1" = telaListaAvaliacaoFilme
                    | opcao == "2" = telaListaAvaliacaoSerie
                    | opcao == "3" = mainScren
                    | otherwise = do {Texts.invalidOptionMsg; mainScren}

telaListaAvaliacaoFilme :: IO()
telaListaAvaliacaoFilme = do
    Texts.listaDeFilmeMsg
    -- chama metodo que lista filme
    Texts.pedeIdFilmeAvaliacaoMsg
    id <- Util.readStringInput
    if id == "V" || id == "v"
        then do telaListaAvaliacoes
    else do 
        --chama metodo de avaliacao por filme
        Texts.eAgoraMsg
        mainScren


telaListaAvaliacaoSerie :: IO()
telaListaAvaliacaoSerie = do
    Texts.listaDeSerieMsg
    -- chama metodo que lista Serie
    Texts.pedeIdSerieAvaliacaoMsg
    id <- Util.readStringInput
    if id == "V" || id == "v"
        then do telaListaAvaliacoes
    else do 
        --chama metodo de avaliacao por Serie
        Texts.eAgoraMsg
        mainScren

