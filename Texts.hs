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