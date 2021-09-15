## Como executar o CinéfiloFlix?

### Primeiramente, é preciso ter instalado: 

- O Compilador e o gerenciador de pacotes da linguagem Haskell ([GHC e Cabal](https://www.haskell.org/platform/linux.html))

  ```
  $ sudo apt-get install haskell-platform 
  ```

### Para uma primeira execução:

  ```
  $ git clone https://github.com/thiago-liracst/CinefiloFlix.git
  $ cd CinefiloFlix
  $ cd Funcional
  $ cabal update
  $ cabal install sqlite-simple
  $ cabal install random
  $ cabal install ansi-terminal
  $ runhaskell Main.hs
  ```

### Execuções rotineiras:
  
  ```
  $ runhaskell Main.hs
  ```