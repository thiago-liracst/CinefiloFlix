module Util where

import System.IO.Unsafe

import Database.SQLite.Simple

readStringInput :: IO String
readStringInput = do
    i <- getLine
    return i

fromIO :: IO a -> a
fromIO = unsafePerformIO

executeBD :: ToRow q => String -> q -> IO ()
executeBD action properties = do
   conn <- open "./data/cinefiloflix.db"
   let pesquisa = read $ show action :: Query
   execute conn pesquisa properties
   close conn

queryBD :: FromRow r => String -> IO [r]
queryBD query = do
   conn <- open "./data/cinefiloflix.db"
   let search = read $ show query :: Query;
   query_ conn search;
