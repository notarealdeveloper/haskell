#!/usr/bin/runhaskell

import qualified System.Random as R

getZeros :: [Int] -> [Int]
getZeros = map (\n -> if (n == 0) then 1 else 0)


makeUsVector :: Int -> IO [Int]
makeUsVector n = do
    g <- R.getStdGen
    let rs = R.randomRs (0, n-1) g
    let us = getZeros rs
    return us


main :: IO ()
main = do
    -- stdgen :: StdGen
    g0 <- R.getStdGen

    -- Make one random at a time, using a StdGen
    let (a1, g1) = R.next g0
    let (a2, g2) = R.next g1
    let (a3, g3) = R.next g2
    mapM_ print [a1, a2, a3]

    -- Make an infinite number of randoms, within a specified range
    us <- makeUsVector 10
    print $ take 100 us


