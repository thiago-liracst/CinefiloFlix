module DashBoard where
    
import FilmeDB
import Filme
import Util


filmesMelhorAvaliados :: String 

filmesMelhorAvaliados
  |((Util.tamanhoLista filmes) == 0) = erroSemCadastroFilme
  |((Util.tamanhoLista estatisticasFilmes) == 0) = errosemCadastroEstatisticas
  |otherwise = "Filmes Melhor Avaliados :\n\n" ++ (filmesMelhorAvaliadosRecursivo estatisticasFilmes 1 )
  where 
    filmes = FilmeDB.recuperaFilmes
    estatisticasFilmes = FilmeDB.recuperaFilmesPorAvaliacao 5

filmesMelhorAvaliadosRecursivo :: [EstatisticasDoFilme] -> Int -> String
filmesMelhorAvaliadosRecursivo [] i  = ""
filmesMelhorAvaliadosRecursivo (x : xs) i = show i ++ "° " ++ titulo (head (recuperaFilmeID id)) ++ " - " ++ show (avaliacao x) ++ "\n" ++ filmesMelhorAvaliadosRecursivo xs (i + 1)
  where 
    id = id_estatistica_filme x

horasAssitidas :: String
horasAssitidas
  |((Util.tamanhoLista filmes) <= 0) = erroSemCadastroFilme
  |otherwise = "O total de horas assistidas é de " ++  show (div horas 60)  ++ " horas e " ++ show (mod horas 60) ++ " minutos."
    where 
      filmes = FilmeDB.recuperaFilmes
      horas = contaHorasAssistidas filmes

contaHorasAssistidas :: [Filme] -> Int 
contaHorasAssistidas [] = 0
contaHorasAssistidas (x : xs) = (duracao x) + contaHorasAssistidas xs


principaisGeneros :: String 
principaisGeneros 
  |((Util.tamanhoLista filmes) <= 0) = erroSemCadastroFilme
  |otherwise =  "Principais Gêneros: \n" ++ principaisGenerosRecursivo  generos 1
  where 
    filmes = FilmeDB.recuperaFilmes
    generos = FilmeDB.recuperaPrincipaisGeneros 5


principaisGenerosRecursivo :: [(String, Int)] -> Int -> String
principaisGenerosRecursivo [] i = ""
principaisGenerosRecursivo (x : xs) i = show i ++ "° " ++ (fst x) ++ " - " ++  show (snd x) ++ " filme(s)\n" ++ principaisGenerosRecursivo xs (i + 1)

principaisDiretores :: String 
principaisDiretores
  |((Util.tamanhoLista filmes) <= 0) = erroSemCadastroFilme
  |otherwise =  "Principais Diretores: \n" ++ principaisDiretoresRecursivo  generos 1
  where 
    filmes = FilmeDB.recuperaFilmes
    generos = FilmeDB.recuperaPrincipaisDiretores 5

principaisDiretoresRecursivo :: [(String, Int)] -> Int -> String
principaisDiretoresecursivo [] i = ""
principaisDiretoresRecursivo (x : xs) i = show i ++ "° " ++ (fst x) ++ " - " ++  show (snd x) ++ " filme(s)\n" ++ principaisGenerosRecursivo xs (i + 1)

erroSemCadastroFilme :: String
erroSemCadastroFilme = "Você não possui filmes cadastrados no Sistema.\nVolte quando tiver algum filme."

errosemCadastroEstatisticas :: String
errosemCadastroEstatisticas = "Você não possui Estatisticas (avaliação, comentário) cadastrados no sistema.\nVolte quando tiver alguma avaliação reqalizada."