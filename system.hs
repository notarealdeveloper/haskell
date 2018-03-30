#!/usr/bin/runhaskell

-- To see the effect of this, make a file called "test.txt" 
-- containing numbers, either on the same line or multiple lines,
-- separated by spaces. Then import this file and type main.

main = do  
        contents <- readFile "test.txt"
        print . map readInt . words $ contents
-- Or... main = print . map readInt . words =<< readFile "test.txt"

readInt :: String -> Int
readInt = read
