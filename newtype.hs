#!/usr/bin/runhaskell

newtype CharList = CharList { getCharList :: [Char] } 
    deriving (Show,Eq)

main = do
    print $ CharList {getCharList = "This will be shown"}
