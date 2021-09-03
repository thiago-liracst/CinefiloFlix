module Texts where
import System.IO.Unsafe
import DashBoard
import System.Console.ANSI

printLogo :: IO()
printLogo = do
    putStrLn(unsafeDupablePerformIO(readFile "Files/logo.txt"))

optionsStartMenu :: IO()
optionsStartMenu = do
    putStrLn("● ○ ◉ MENU PRINCIPAL ◉ ○ ●")
    putStrLn("\nComo você quer prosseguir, cinéfilo?")
    putStrLn("⓵ Alterar Dados")
    putStrLn("⓶ Cadastrar Mídia")
    putStrLn("⓷ Assistir Mídia")
    putStrLn("⓸ Buscar Mídia")
    putStrLn("⓹ DashBoard")
    putStrLn("⓺ Recomendações para você")
    putStrLn("⓻ Lista de avaliações")
    putStrLn("⓼ Sair\n")

goodByeMsg :: IO()
goodByeMsg = do
    putStrLn(unsafeDupablePerformIO(readFile "Files/xau.txt"))

invalidOptionMsg :: IO()
invalidOptionMsg = do
    putStrLn("\nOpção Inválida\n")

voltarAoMenuMsg :: IO()
voltarAoMenuMsg = do
    putStrLn("\nOBS: Para voltar ao menu, digite 'V'!")

eAgoraMsg :: IO()
eAgoraMsg = do 
    putStrLn("\nO que deseja fazer a seguir?\n")


---------------atualizar cadastro usuario----------------
pedeNomeUsuarioMsg :: IO()
pedeNomeUsuarioMsg =  do
    clearScreen
    putStrLn("● ○ ◉ ATUALIZAÇÃO DE DADOS DO USUÁRIO ◉ ○ ●")
    voltarAoMenuMsg
    putStr ("")
    putStrLn("\nNome: ")

pedeIdadeUsuarioMsg :: IO()
pedeIdadeUsuarioMsg = do
    putStrLn("\nIdade: ")

pedeSexoUsuarioMsg :: IO()
pedeSexoUsuarioMsg =  do
    putStrLn("\nSexo: ")

pedeGeneroFavoritoMsg :: IO()
pedeGeneroFavoritoMsg  = do
    putStrLn("\nQual é o seu gênero cinematográfico favorito? ")

pedeFilmeFavoritoMsg :: IO()
pedeFilmeFavoritoMsg = do
    putStrLn("\nQual é o seu filme favorito? ")

pedeSerieFavoritaMsg:: IO()
pedeSerieFavoritaMsg = do
    putStrLn("\nQual é a sua série favorita? ")

confirmacaoUpdateMsg :: String -> IO()
confirmacaoUpdateMsg user = do
    putStrLn("")
    putStrLn(user)
    eAgoraMsg
    
---------------cadastro de mídia----------------
optionsAddMediaScreen :: IO()
optionsAddMediaScreen = do
    clearScreen
    putStrLn("● ○ ◉ CADASTRO DE MÍDIA ◉ ○ ●\n")
    putStrLn("⓵ Cadastrar Filme")
    putStrLn("⓶ Cadastrar Série")
    putStrLn("⓷ Voltar ao Menu Principal\n")

----------filme
cadastroTituloFilmeMsg :: IO()
cadastroTituloFilmeMsg = do
    clearScreen
    putStrLn("● ○ ◉ CADASTRO DE FILME ◉ ○ ●")
    voltarAoMenuMsg
    putStr ("")
    putStrLn("\nTítulo: ")

cadastroDiretorFilmeMsg :: IO()
cadastroDiretorFilmeMsg = do
    putStrLn("\nDiretor: ")

cadastroLancamentoFilmeMsg :: IO()
cadastroLancamentoFilmeMsg = do
    putStrLn("\nAno de lançamento: ")

cadastroGeneroFilmeMsg :: IO()
cadastroGeneroFilmeMsg = do
    putStrLn("\nGênero: ")

cadastroDuracaoFilmeMsg :: IO()
cadastroDuracaoFilmeMsg = do
    putStrLn("\nDuração (Em minutos): ")

cadastroNacionalidadeFilmeMsg :: IO()
cadastroNacionalidadeFilmeMsg = do
    putStrLn("\nNacionalidade: ")

cadastroProdutoraFilmeMsg :: IO()
cadastroProdutoraFilmeMsg = do
    putStrLn("\nProdutora: ")

confirmacaoCadastroMsg :: String -> IO()
confirmacaoCadastroMsg filme = do
    putStrLn("Cadastro do filme:")
    putStrLn(filme)
    eAgoraMsg

----------serie

cadastroTituloSerieMsg :: IO()
cadastroTituloSerieMsg = do
    clearScreen
    putStrLn("● ○ ◉ CADASTRO DE SÉRIE ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("\nTítulo: ")

cadastroDuracaoEpisodioMsg :: IO()
cadastroDuracaoEpisodioMsg = do
    putStrLn("\nDuração média (em minutos) do episódio: ")

cadastroGeneroSerieMsg :: IO()
cadastroGeneroSerieMsg = do
    putStrLn("\nGênero: ")

cadastroNacionalidadeSerieMsg :: IO()
cadastroNacionalidadeSerieMsg = do
    putStrLn("\nNacionalidade: ")

cadastroProdutoraSerieMsg :: IO()
cadastroProdutoraSerieMsg = do
    putStrLn("\nProdutora: ")

confirmacaoCadastroSerieMsg :: String -> IO()
confirmacaoCadastroSerieMsg serie = do
    putStrLn("Cadastro da série:")
    putStrLn(serie)
    eAgoraMsg

---------------assistir----------------
opcoesAssistirMsg :: IO()
opcoesAssistirMsg = do
    clearScreen
    putStrLn("O que você deseja, cinéfilo?\n")
    putStrLn("⓵ Assistir Filme")
    putStrLn("⓶ Assistir Série")
    putStrLn("⓷ Voltar ao Menu Principal\n")

pedeIdFilmeMsg :: IO()
pedeIdFilmeMsg = do
    putStrLn("\nPor favor, digite o id do filme que você quer assistir: \n")

avaliacaoFilmeMsg :: IO()
avaliacaoFilmeMsg = do
    putStrLn("\nComo você classifica esse filme?")
    putStrLn(" ★")
    putStrLn(" ★★")
    putStrLn(" ★★★")
    putStrLn(" ★★★★")
    putStrLn(" ★★★★★")

pedeComentarioFilmeMsg :: IO()
pedeComentarioFilmeMsg = do
    putStrLn("\nPor favor, insira um comentário sobre o filme: ")

confirmacaoAssistirFilmeMsg :: String -> IO()
confirmacaoAssistirFilmeMsg filme = do
    putStrLn("")
    putStrLn(filme)
    eAgoraMsg

headerAssistirSerieMsg ::IO()
headerAssistirSerieMsg = do
    clearScreen
    putStrLn("● ○ ◉ ASSISTIR SÉRIE ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("\nConfira a lista de séries disponíveis: \n")

pedeIdSerieMsg :: IO()
pedeIdSerieMsg = do
    putStrLn("\nPor favor, digite o id da série que você quer assistir: \n")

opcoesAssistirSerieMsg :: IO()
opcoesAssistirSerieMsg = do
    putStrLn("\nO quê você deseja fazer, cinéfilo?\n")
    putStrLn("⓵ Finalizar Episódio")
    putStrLn("⓶ Finalizar Temporada")
    putStrLn("⓷ Finalizar Série")

episodioFinalizadoMsg :: IO()
episodioFinalizadoMsg = do
    putStrLn("Episódio finalizado com sucesso!")
    eAgoraMsg

temporadaFinalizadaMsg :: IO()
temporadaFinalizadaMsg = do
    putStrLn("Temporada finalizada com sucesso!")
    eAgoraMsg

avaliacaoSerieMsg :: IO()
avaliacaoSerieMsg = do
    putStrLn("\nComo você classifica esse série?")
    putStrLn("★")
    putStrLn("★★")
    putStrLn("★★★")
    putStrLn("★★★★")
    putStrLn("★★★★★")

pedeComentarioSerieMsg :: IO()
pedeComentarioSerieMsg = do
    putStrLn("\n Por favor, insira um comentário sobre a série: ")

---------------recomendações----------------
opcoesRecomendacoes :: IO()
opcoesRecomendacoes = do
    clearScreen
    putStrLn("● ○ ◉ RECOMENDAÇÕES ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("\nQue tipo de recomendação você gostaria, cinéfilo? \n")
    putStrLn("⓵ Recomendação de filmes")
    putStrLn("⓶ Recomendação de séries\n")

recomendacaoDeFilmeMsg :: IO()
recomendacaoDeFilmeMsg = do
    clearScreen
    putStrLn("● ○ ◉ RECOMENDAÇÕES DE FILMES ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("\nConfira a lista de filmes que foi preparada só para você:")

recomendacaoDeSerieMsg :: IO()
recomendacaoDeSerieMsg = do
    clearScreen
    putStrLn("● ○ ◉ RECOMENDAÇÕES DE SÉRIES ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("\nConfira a lista de séries que foi preparada só para você:")

---------------Busca----------------
opcoesBuscaMsg :: IO()
opcoesBuscaMsg = do
    clearScreen
    putStrLn("● ○ ◉ BUSCA DE MÍDIA ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("\nQue tipo de busca você gostaria, cinéfilo? \n")
    putStrLn("⓵ Busca por título")
    putStrLn("⓶ Busca por gênero")
    putStrLn("⓷ Busca por diretor")
    putStrLn("⓸ Busca por produtora \n")

buscaTituloMsg :: IO()
buscaTituloMsg = do 
    clearScreen
    putStrLn("● ○ ◉ BUSCA POR TÍTULO ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("Por favor, insira o título que você procura: \n")

buscaGeneroMsg :: IO()
buscaGeneroMsg = do 
    clearScreen
    putStrLn("● ○ ◉ BUSCA POR GÊNERO ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("Por favor, insira o gênero que você procura: \n")

buscaDiretorMsg :: IO()
buscaDiretorMsg = do 
    clearScreen
    putStrLn("● ○ ◉ BUSCA POR DIRETOR ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("Por favor, insira o diretor que você procura: \n")

buscaProdutoraMsg :: IO()
buscaProdutoraMsg = do 
    clearScreen
    putStrLn("● ○ ◉ BUSCA POR PRODUTORA ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("Por favor, insira a produtora que você procura: \n")

---------------Lista----------------

opcoesListaMsg :: IO()
opcoesListaMsg = do
    clearScreen
    putStrLn("● ○ ◉ LISTA DE AVALIAÇÕES ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("\nQue tipo de avaliações você gostaria de ver, cinéfilo? \n")
    putStrLn("⓵ Avaliações de séries")
    putStrLn("⓶ Avaliações de filmes")

listaDeFilmeMsg :: IO()
listaDeFilmeMsg = do
    clearScreen
    putStrLn("● ○ ◉ AVALIAÇÕES DE FILMES ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("\nConfira a lista de filmes disponíveis:")

pedeIdFilmeAvaliacaoMsg :: IO()
pedeIdFilmeAvaliacaoMsg = do
    putStrLn("\nPor favor, digite o id do filme que você quer ver as avaliações: \n")

listaDeSerieMsg :: IO()
listaDeSerieMsg = do
    clearScreen
    putStrLn("● ○ ◉ AVALIAÇÕES DE SÉRIES ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("\nConfira a lista de séries disponíveis:")

pedeIdSerieAvaliacaoMsg :: IO()
pedeIdSerieAvaliacaoMsg = do
    putStrLn("\nPor favor, digite o id da série que você quer ver as avaliações: \n")

---------------dashboard----------------
dashboardMainScreen :: IO()
dashboardMainScreen = do 
    clearScreen
    putStrLn("● ○ ◉ DASHBOARD ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("\nComo você quer prosseguir, cinéfilo? \n")
    putStrLn("① DashBoard de Filmes")
    putStrLn("② DashBoard de Series\n")
    

telaDashBoardFilmes :: IO()
telaDashBoardFilmes = do 
    putStrLn("\n--------------------\n")
    putStrLn(DashBoard.filmesMelhorAvaliados) 
    putStrLn("\n--------------------\n")
    putStrLn(DashBoard.horasAssitidasFilmes)
    putStrLn("\n--------------------\n")
    putStrLn(DashBoard.principaisGenerosFilmes)
    putStrLn("\n--------------------\n")
    putStrLn(DashBoard.principaisDiretores ++ "\n")

telaDashBoarsSeries :: IO ()
telaDashBoarsSeries = do 
    putStrLn("\n--------------------\n")
    putStrLn(DashBoard.seriesMelhorAvaliadas) 
    putStrLn("\n--------------------\n")
    putStrLn(DashBoard.horasAssitidasSeries)
    putStrLn("\n--------------------\n")
    putStrLn(DashBoard.principaisGenerosSeries)
    putStrLn("\n--------------------\n")
    putStrLn(DashBoard.principaisProdutoras ++ "\n")