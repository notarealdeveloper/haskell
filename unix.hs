#!/usr/bin/runhaskell

-- For pure stuff
import qualified Data.List as L

-- For system programming
import System.Directory as D
import System.FilePath as F
import System.IO as IO
import System.Process as P
import System.Posix as OS

ls :: IO [FilePath]
ls = D.getCurrentDirectory >>= D.listDirectory

cd :: FilePath -> IO ()
cd dir = D.setCurrentDirectory dir

removeDirectoryIfExists :: String -> IO ()
removeDirectoryIfExists dir = do
    D.doesDirectoryExist dir >>= conditionalRemove dir where
        conditionalRemove dir exists
            | exists == True      = D.removeDirectory dir
            | otherwise           = return ()

-- Lotsa useful system-programming stuff!
main :: IO ()
main = do

    let dir = "boop"

    -- String -> IO Bool     >>= String -> IO Bool -> IO ()
    removeDirectoryIfExists dir
    D.createDirectory dir
    D.setCurrentDirectory dir

    -- D.copyFile "/etc/hosts" "hosts"

    D.copyFile "/etc/hosts" "hosts"

    --files <- ls

    P.system $ "/usr/bin/gedit " ++ "hosts"

    D.removeFile "hosts"
    D.setCurrentDirectory ".."
    D.removeDirectory dir

    --map openpic files

    return ()

    --toggleDir dir exists
    --D.createDirectory dir
    --D.setCurrentDirectory dir
    --


