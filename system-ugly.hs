#!/usr/bin/runhaskell

-- To see the effect of this, make a file called "test.txt" 
-- containing numbers, either on the same line or multiple lines,
-- separated by spaces. Then import this file and type main.
import System.IO  
import Control.Monad

main = do
    let list = []
    handle <- openFile "test.txt" ReadMode
    contents <- hGetContents handle
    let singlewords = words contents
        list = f singlewords
    print list
    hClose handle
                                                      
f :: [String] -> [Int]
f = map read
