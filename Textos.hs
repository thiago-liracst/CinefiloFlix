module Textos where
import System.IO.Unsafe


opcoesMenuInicial :: IO()
opcoesMenuInicial = do
    putStrLn("● ○ ◉ MENU PRINCIPAL ◉ ○ ●")
    putStrLn("\nComo você quer prosseguir, cinéfilo?")
    putStrLn("⓵ Alterar Dados")
    putStrLn("⓶ Cadastrar Mídia")
    putStrLn("⓷ Atualizar Status")
    putStrLn("⓸ Sair\n")