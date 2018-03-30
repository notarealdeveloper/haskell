#!/usr/bin/runhaskell

-- CC.forkIO (writeFile "boop" "hey!") >> D.doesFileExist "boop"
import qualified Control.Concurrent as CC
import qualified System.Directory as D

ramble :: Int -> IO ()
ramble n = do 
    let rambling = [ string n i | i <- [0..1000]] where
        string n i = "Instance " ++ show n ++ ". Number: " ++ show i
    mapM_ print rambling
    -- CC.threadDelay 2

-- Run this for a complete fucking disaster!
main :: IO ()
main = do
    CC.forkIO (ramble 1) >> CC.forkIO (ramble 2)
    return ()
