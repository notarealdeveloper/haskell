#!/usr/bin/runhaskell

-- For pure stuff
import qualified Data.List as L

-- For system(-ish) programming(-ish)
import System.Directory as D
import System.FilePath as F
import System.IO as IO
import System.Process as P
import System.Posix as OS

removeDirectoryIfExists :: String -> IO ()
removeDirectoryIfExists dir = do
    D.doesDirectoryExist dir >>= f dir where
        f dir exists
            | exists == True      = D.removeDirectory dir
            | otherwise           = return ()

removeDirectoryIfExists' :: String -> IO ()
removeDirectoryIfExists' dir = do
    exists <- D.doesDirectoryExist dir
    f dir exists where
        f d e
            | e == True = D.removeDirectory d
            | otherwise = return ()

removeDirectoryIfExists'' :: String -> IO ()
removeDirectoryIfExists'' dir = do
    D.doesDirectoryExist dir >>= conditionalRemove where
        conditionalRemove e
            | e == True = D.removeDirectory dir
            | otherwise = return ()

removeDirectoryIfExists''' :: String -> IO ()
removeDirectoryIfExists''' dir = do
    exists <- D.doesDirectoryExist dir
    conditionalRemove exists where
        conditionalRemove e
            | e == True = D.removeDirectory dir
            | otherwise = return ()

removeDirectoryIfExists'''' :: String -> IO ()
removeDirectoryIfExists'''' dir = do
    D.doesDirectoryExist dir >>= \e ->
        case e of True  -> D.removeDirectory dir
                  False -> return ()

-- Lotsa useful system-programming stuff!
main :: IO ()
main = do

    -- String -> IO Bool     >>= String -> IO Bool -> IO ()
    removeDirectoryIfExists     "boop-1"
    removeDirectoryIfExists'    "boop-2"
    removeDirectoryIfExists''   "boop-3"
    removeDirectoryIfExists'''  "boop-4"
    removeDirectoryIfExists'''' "boop-5"
    --D.createDirectory dir
    --D.setCurrentDirectory dir

    return ()

    --toggleDir dir exists
    --D.createDirectory dir
    --D.setCurrentDirectory dir
    --D.removeDirectory dir


