module Texts where
import System.IO.Unsafe


optionsStartMenu :: IO()
optionsStartMenu = do
    putStrLn("● ○ ◉ MENU PRINCIPAL ◉ ○ ●")
    putStrLn("\nComo você quer prosseguir, cinéfilo?")
    putStrLn("⓵ Alterar Dados")
    putStrLn("⓶ Cadastrar Mídia")
    putStrLn("⓷ Atualizar Status")
    putStrLn("⓸ Sair\n")

printLogo :: IO()
printLogo = do
    putStrLn(unsafeDupablePerformIO(readFile "Files/logo.txt"))

goodByeMsg :: IO()
goodByeMsg = do
    putStrLn(unsafeDupablePerformIO(readFile "Files/xau.txt"))