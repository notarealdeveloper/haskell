#!/usr/bin/runhaskell

import System.Random

-- random (mkStdGen 42) :: (Int, StdGen)
-- take 10 $ randoms (mkStdGen 666) :: [Int]
-- randomR (1,6) (mkStdGen 789)
-- randomR (1,60) (mkStdGen 359353322)
-- take 10 $ randomRs ('a', 'z') (mkStdGen 3) :: [Char]

-- Gives a different random string each time we run it
main = do
    gen <- getStdGen
    putStrLn $ take 20 (randomRs ('a', 'z') gen)
