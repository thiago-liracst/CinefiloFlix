module Texts where
import System.IO.Unsafe
import DashBoard

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
    putStrLn("⓸ DashBoard")
    putStrLn("⓹ Recomendações para você")
    putStrLn("⓺ Sair\n")

optionsAddMediaScreen :: IO()
optionsAddMediaScreen = do
    putStrLn("⓵ Cadastrar Filme")
    putStrLn("⓶ Cadastrar Série")
    putStrLn("⓷ Voltar ao Menu Principal\n")

goodByeMsg :: IO()
goodByeMsg = do
    putStrLn(unsafeDupablePerformIO(readFile "Files/xau.txt"))

invalidOptionMsg :: IO()
invalidOptionMsg = do
    putStrLn("\nOpção Inválida\n")

voltarAoMenuMsg :: IO()
voltarAoMenuMsg = do
    putStrLn("\nOBS: Para voltar ao menu, digite 'V'!\n")

eAgoraMsg :: IO()
eAgoraMsg = do 
    putStrLn("\nO que deseja fazer a seguir?\n")


---------------atualizar cadastro usuario----------------
pedeNomeUsuarioMsg :: IO()
pedeNomeUsuarioMsg =  do
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
    
---------------cadastro de filme----------------

cadastroTituloFilmeMsg :: IO()
cadastroTituloFilmeMsg = do
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

---------------cadastro de série----------------

cadastroTituloSerieMsg :: IO()
cadastroTituloSerieMsg = do
    putStrLn("● ○ ◉ CADASTRO DE SÉRIE◉ ○ ●")
    voltarAoMenuMsg
    putStr ("")
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
    putStrLn("⓵ Assistir Filme")
    putStrLn("⓶ Assistir Série")
    putStrLn("⓷ Voltar ao Menu Principal\n")

pedeIdFilmeMsg :: IO()
pedeIdFilmeMsg = do
    putStrLn("\nDigite o id do filme: \n")

avaliacaoFilmeMsg :: IO()
avaliacaoFilmeMsg = do
    putStrLn("\nComo você classifica esse filme?")
    putStrLn("★")
    putStrLn("★★")
    putStrLn("★★★")
    putStrLn("★★★★")
    putStrLn("★★★★★")

pedeComentarioFilmeMsg :: IO()
pedeComentarioFilmeMsg = do
    putStrLn("\n Por favor, insira um comentário sobre o filme: ")

confirmacaoAssistirFilmeMsg :: String -> IO()
confirmacaoAssistirFilmeMsg filme = do
    putStrLn("")
    putStrLn(filme)
    eAgoraMsg

headerAssistirSerieMsg ::IO()
headerAssistirSerieMsg = do
    putStrLn("● ○ ◉ Assistir Série ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("\nConfira a lista de séries disponíveis: \n")

pedeIdSerieMsg :: IO()
pedeIdSerieMsg = do
    putStrLn("\nDigite o id da série: \n")

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
    putStrLn("● ○ ◉ Recomendações ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("\nQue tipo de recomendação você gostaria, cinéfilo? \n")
    putStrLn("⓵ Recomendação de filmes")
    putStrLn("⓶ Recomendação de séries\n")

recomendacaoDeFilmeMsg :: IO()
recomendacaoDeFilmeMsg = do
    putStrLn("● ○ ◉ Recomendações de Filmes ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("\nConfira a lista de filmes que foi preparada só para você:")

recomendacaoDeSerieMsg :: IO()
recomendacaoDeSerieMsg = do
    putStrLn("● ○ ◉ Recomendações de Séries ◉ ○ ●")
    voltarAoMenuMsg
    putStrLn("\nConfira a lista de séries que foi preparada só para você:")

---------------dashboard----------------
dashboardScreen :: IO()
dashboardScreen = do 
    putStrLn("\n--------------------\n")
    putStrLn(DashBoard.filmesMelhorAvaliados) 
    putStrLn("\n--------------------\n")
    putStrLn(DashBoard.horasAssitidas)
    putStrLn("\n--------------------\n")
    putStrLn(DashBoard.principaisGeneros)
    putStrLn("\n--------------------\n")
    putStrLn(DashBoard.principaisDiretores ++ "\n")

