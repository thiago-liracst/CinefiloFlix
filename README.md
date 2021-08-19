## Como executar o CinéfiloFlix?

### Primeiramente, é preciso ter instalado: 

- O Compilador e o gerenciador de pacotes da linguagem Haskell ([GHC e Cabal](https://www.haskell.org/platform/linux.html))

  ```
  $ sudo apt-get install haskell-platform 
  ```

-O SqLite3 para gerenciamento do Banco de Dados

  ```
  $ sudo apt-get install sqlite3
  ```


### Então, basta executar os comandos abaixo:

  ```
  $ git clone https://github.com/thiago-liracst/CinefiloFlix.git
  $ cd data
  $ sqlite3 cinefiloflix.db < build.sql
  $ runhaskell Main.hs
  ```
