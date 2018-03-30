#!/usr/bin/runhaskell
-- This line allows us to run the file as a script

reverseWords :: String -> String
reverseWords = unwords . map reverse . words

main = do
    putStrLn "What is your name?"
    name <- getLine
    if null name then do
        putStrLn "Hey dumbass, read the rules.\n"
        main
    else if (name == "nosaj") then do
        let reversename = reverseWords name
        putStrLn $ reverseWords ("What kind of name is " ++ reversename) ++ "???"
    else do
        putStrLn $ "What kind of name is " ++ name ++ "???"
