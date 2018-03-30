#!/usr/bin/runhaskell

-- For pure stuff
import qualified Data.List as L

-- For system programming
import System.Directory as D
import System.FilePath as F
import System.IO as IO
import System.Process as P
import System.Posix as OS

toggleDir :: String -> Bool -> IO ()
toggleDir dir exists
    | exists == True      = D.removeDirectory dir
    | otherwise           = D.createDirectory dir

-- Lotsa useful system-programming stuff!
main :: IO ()
main = do

    let dir = "boop"
    exists <- D.doesDirectoryExist dir
    toggleDir dir exists
    --D.createDirectory dir
    --D.setCurrentDirectory dir
    --D.removeDirectory dir


