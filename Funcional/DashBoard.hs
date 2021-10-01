module DashBoard where
    
import FilmeDB
import Filme
import SerieDB
import Serie
import Util

---- Metodos de DashBOard de Filmes ---------

filmesMelhorAvaliados :: String 

filmesMelhorAvaliados
  |((Util.tamanhoLista filmes) == 0) = erroSemCadastroFilme
  |((Util.tamanhoLista estatisticasFilmes) == 0) = errosemCadastroEstatisticasFilme
  |otherwise = "Filmes Melhor Avaliados :\n\n" ++ (filmesMelhorAvaliadosRecursivo estatisticasFilmes 1 )
  where 
    filmes = FilmeDB.recuperaFilmes
    estatisticasFilmes = FilmeDB.recuperaFilmesPorAvaliacao 5

filmesMelhorAvaliadosRecursivo :: [EstatisticasDoFilme] -> Int -> String
filmesMelhorAvaliadosRecursivo [] i  = ""
filmesMelhorAvaliadosRecursivo (x : xs) i = show i ++ "° " ++ FilmeDB.titulo (head (recuperaFilmeID id)) ++ " - " ++ show (FilmeDB.avaliacao x) ++ "\n" ++ filmesMelhorAvaliadosRecursivo xs (i + 1)
  where 
    id = id_estatistica_filme x

horasAssitidasFilmes :: String
horasAssitidasFilmes
  |((Util.tamanhoLista filmes) <= 0) = erroSemCadastroFilme
  |((Util.tamanhoLista assistidos) <= 0) = erroFilmeNaoAssistido
  |otherwise = "O total de horas assistidas é de " ++  show (div horas 60)  ++ " horas e " ++ show (mod horas 60) ++ " minutos."
    where 
      filmes = FilmeDB.recuperaFilmes
      assistidos = FilmeDB.recuperaFilmesAssistidos
      horas = contaHorasAssistidasFilme assistidos

contaHorasAssistidasFilme :: [Filme] -> Int 
contaHorasAssistidasFilme [] = 0
contaHorasAssistidasFilme (x : xs) = (duracao x) + contaHorasAssistidasFilme xs


principaisGenerosFilmes :: String 
principaisGenerosFilmes 
  |((Util.tamanhoLista filmes) <= 0) = erroSemCadastroFilme
  |((Util.tamanhoLista generos) <= 0) = erroFilmeNaoAssistido
  |otherwise =  "Principais Gêneros: \n" ++ principaisGenerosFilmeRecursivo generos 1
  where 
    filmes = FilmeDB.recuperaFilmes
    generos = FilmeDB.recuperaPrincipaisGeneros 5


principaisGenerosFilmeRecursivo :: [(String, Int)] -> Int -> String
principaisGenerosFilmeRecursivo [] i = ""
principaisGenerosFilmeRecursivo (x : xs) i = show i ++ "° " ++ (fst x) ++ " - " ++  show (snd x) ++ " filme(s)\n" ++ principaisGenerosFilmeRecursivo xs (i + 1)

principaisDiretores :: String 
principaisDiretores
  |((Util.tamanhoLista filmes) <= 0) = erroSemCadastroFilme
  |((Util.tamanhoLista diretores) <= 0) = erroFilmeNaoAssistido
  |otherwise =  "Principais Diretores: \n" ++ principaisDiretoresRecursivo  diretores 1
  where 
    filmes = FilmeDB.recuperaFilmes
    diretores = FilmeDB.recuperaPrincipaisDiretores 5

principaisDiretoresRecursivo :: [(String, Int)] -> Int -> String
principaisDiretoresRecursivo [] i = ""
principaisDiretoresRecursivo (x : xs) i = show i ++ "° " ++ (fst x) ++ " - " ++  show (snd x) ++ " filme(s)\n" ++ principaisDiretoresRecursivo xs (i + 1)


------------------------------------------------------

---- Metodos da DashBoard de Series ------------------

seriesMelhorAvaliadas :: String 
seriesMelhorAvaliadas 
  |(null series) = erroSemCadastroSerie
  |(null estatisticasSeries) = errosemCadastroEstatisticasSerie
  |otherwise = "Séries Melhor Avaliadas :\n\n" ++ (seriesMelhorAvaliadasRecursivo estatisticasSeries 1 )
  where 
    series = SerieDB.recuperaSeries
    estatisticasSeries = SerieDB.recuperaSeriesPorAvaliacao 5

seriesMelhorAvaliadasRecursivo :: [EstatisticasDaSerie] -> Int -> String
seriesMelhorAvaliadasRecursivo [] i  = ""
seriesMelhorAvaliadasRecursivo (x : xs) i = show i ++ "° " ++ SerieDB.titulo (head (recuperaSerieID id)) ++ " - " ++ show (SerieDB.avaliacao x) ++ "\n" ++ seriesMelhorAvaliadasRecursivo xs (i + 1) 
  where id = id_estatistica_serie x

horasAssitidasSeries :: String
horasAssitidasSeries
  |(null filmes) = erroSemCadastroSerie
  |(null assistidos) = erroSerieNaoAssistida
  |otherwise = "O total de horas assistidas é de " ++  show (div horas 60)  ++ " horas e " ++ show (mod horas 60) ++ " minutos."
    where 
      filmes = SerieDB.recuperaSeries
      assistidos = SerieDB.recuperaSeriesAssistidas
      horas = contaHorasAssistidasSerie assistidos

contaHorasAssistidasSerie :: [Serie] -> Int 
contaHorasAssistidasSerie [] = 0
contaHorasAssistidasSerie (x : xs) = (duracaoMediaEpisodio x)* (episodiosTotais x) + contaHorasAssistidasSerie xs

principaisGenerosSeries :: String 
principaisGenerosSeries 
  |(null series) = erroSemCadastroSerie
  |(null generos) = erroSerieNaoAssistida
  |otherwise =  "Principais Gêneros: \n" ++ principaisGenerosSerieRecursivo generos 1
  where 
    series = SerieDB.recuperaSeries
    generos = SerieDB.recuperaPrincipaisGeneros 5


principaisGenerosSerieRecursivo :: [(String, Int)] -> Int -> String
principaisGenerosSerieRecursivo [] i = ""
principaisGenerosSerieRecursivo (x : xs) i = show i ++ "° " ++ (fst x) ++ " - " ++  show (snd x) ++ " filme(s)\n" ++ principaisGenerosSerieRecursivo xs (i + 1)

principaisProdutoras :: String 
principaisProdutoras
  |(null series) = erroSemCadastroSerie
  |(null produtoras) = erroSerieNaoAssistida
  |otherwise =  "Principais Produtoras: \n" ++ (principaisProdutorasRecursivo produtoras 1)
  where 
    series = SerieDB.recuperaSeries
    produtoras = SerieDB.recuperaPrincipaisProdutoras 5

principaisProdutorasRecursivo :: [(String, Int)] -> Int -> String
principaisProdutorasRecursivo [] i = ""
principaisProdutorasRecursivo (x : xs) i = show i ++ "° " ++ (fst x) ++ " - " ++  show (snd x) ++ " série(s)\n" ++ principaisProdutorasRecursivo xs (i + 1)



----   Metodos de erros ------------------------------
erroSemCadastroFilme :: String
erroSemCadastroFilme = "Você não possui filmes cadastrados no Sistema.\nVolte quando tiver algum filme."

errosemCadastroEstatisticasFilme :: String
errosemCadastroEstatisticasFilme = "Você não possui Estatisticas de filme (avaliação, comentário) cadastrados no sistema.\nVolte quando tiver alguma avaliação reaalizada."

erroFilmeNaoAssistido :: String 
erroFilmeNaoAssistido = "Você não assistiu nenhum filme cadastrado no Sistema. \nVolte quando tiver asssistido algum Filme. "


erroSemCadastroSerie :: String 
erroSemCadastroSerie = "Você não possui séries cadastradas no Sistema. \nVolte quando tiver alguma série cadastrada."

errosemCadastroEstatisticasSerie :: String
errosemCadastroEstatisticasSerie = "Você não possui Estatisticas de série (avaliação, comentário) cadastrados no sistema.\nVolte quando tiver alguma avaliação reaalizada."

erroSerieNaoAssistida :: String 
erroSerieNaoAssistida = "Você não assistiu nenhuma série cadastrado no Sistema. \nVolte quando tiver asssistido alguma série. "