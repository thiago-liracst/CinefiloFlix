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
    putStrLn("⓹ Sair\n")

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

---------------cadastro de filme----------------

cadastroTituloFilmeMsg :: IO()
cadastroTituloFilmeMsg = do
    putStrLn("● ○ ◉ CADASTRO DE FILME ◉ ○ ●")
    putStrLn ("\nOBS: Para voltar ao menu, digite 'V'!\n")
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
    putStrLn("\nO que deseja fazer a seguir ?\n")

---------------cadastro de série----------------

cadastroTituloSerieMsg :: IO()
cadastroTituloSerieMsg = do
    putStrLn("● ○ ◉ CADASTRO DE SÉRIE◉ ○ ●")
    putStrLn ("\nOBS: Para voltar ao menu, digite 'V'!\n")
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
    putStrLn("Cadastro do série:")
    putStrLn(serie)
    putStrLn("\nO que deseja fazer a seguir ?\n")


---------------dashboard----------------
dashboardScreen :: IO()
dashboardScreen = do 
    putStrLn("\n" ++ DashBoard.filmesMelhorAvaliados) 
    putStrLn("\n--------------------\n")
    putStrLn(DashBoard.horasAssitidas)
    putStrLn("\n--------------------\n")
    putStrLn(DashBoard.principaisGeneros)
    putStrLn("\n--------------------\n")
    putStrLn(DashBoard.principaisDiretores ++ "\n")






