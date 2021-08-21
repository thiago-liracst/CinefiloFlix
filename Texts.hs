module Texts where
import System.IO.Unsafe

printLogo :: IO()
printLogo = do
    putStrLn(unsafeDupablePerformIO(readFile "Files/logo.txt"))

optionsStartMenu :: IO()
optionsStartMenu = do
    putStrLn("● ○ ◉ MENU PRINCIPAL ◉ ○ ●")
    putStrLn("\nComo você quer prosseguir, cinéfilo?")
    putStrLn("⓵ Alterar Dados")
    putStrLn("⓶ Cadastrar Mídia")
    putStrLn("⓷ Atualizar Status")
    putStrLn("⓸ Sair\n")

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
    putStrLn("\nData de Lançamento: ")

cadastroGeneroFilmeMsg :: IO()
cadastroGeneroFilmeMsg = do
    putStrLn("\nGênero: ")

cadastroDuracaoFilmeMsg :: IO()
cadastroDuracaoFilmeMsg = do
    putStrLn("\nDuração: ")

cadastroElencoFilmeMsg :: IO()
cadastroElencoFilmeMsg = do
    putStrLn("\nElenco: ")

cadastroNacionalidadeFilmeMsg :: IO()
cadastroNacionalidadeFilmeMsg = do
    putStrLn("\nNacionalidade: ")

confirmacaoCadastroMsg :: String -> IO()
confirmacaoCadastroMsg filme = do
    putStrLn("Cadastro do filme:")
    putStrLn(filme)
    putStrLn("realizado com sucesso!")