module Util where

import System.IO.Unsafe

readStringInput :: IO String
readStringInput = do
    i <- getLine
    return i