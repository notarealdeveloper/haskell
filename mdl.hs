#!/usr/bin/runhaskell

-- Just for fun, trying to reimplement (very) minimal parts of the MDL program in Haskell,
-- before realizing I should probably quit procrastinating and get back to work.

import System.Random
import Data.List

myPureFunction :: Float -> Float
myPureFunction x = x ^ 2

cs = "00000000000000111111111110000000000000000000000000000000001111111111100000000000000000000"
us = "00000000000000000000000000010000000000000000000000000000000000000000000100000000000000000"


tCSon = init . map fst $ filter (\t -> (fst t - 1) /= snd t) pairs
    where pairs = zip (csOnTimes++[-1]) ([-1]++csOnTimes)
          csOnTimes = findIndices (=='1') cs

tCSof = tail . map (\x -> 1 + snd x) $ filter (\t -> (fst t - 1) /= snd t) pairs
    where pairs = zip (csOnTimes++[-1]) ([-1]++csOnTimes)
          csOnTimes = findIndices (=='1') cs

separator = foldl1 (++) $ replicate 40 "~"

main :: IO ()
main = do
    -- num :: Float
    -- This "extracts" the float from IO Float and binds it to the name num
    -- We'd get the same results with: num <- System.Random.randomIO :: IO Float
    num <- randomIO :: IO Float
    print $ (\x -> x^2) num
    print separator
    print $ myPureFunction num
