#!/usr/bin/runhaskell
import Control.Monad
import Data.Char
import System.IO
import System.Environment
import Data.List

gluing_io_actions_manually = do
    putStrLn "Gimmie three lines of text:"
    a <- getLine
    b <- getLine
    c <- getLine
    print [a,b,c]

gluing_io_actions_using_sequence = do
    rs <- sequence $ replicate 3 getLine
    print rs

sequence_example = do
    sequence $ map print [1..3]

mapM_example = do
    mapM print [1..3]

mapM__example = do
    mapM_ print [1..3]

forM_example = do
    forM [1..3] print

forM__example = do
    forM_ [1..3] print

order_matters_example_1 = do
    mapM_example
    mapM__example

order_matters_example_2 = do
    mapM__example
    mapM_example

forever_example = forever $ do
    putStrLn "Gimmie some input: "
    input <- getLine
    putStrLn $ map toUpper input ++ "\n"

input_redirection_example = forever $ do
    -- Run with: runhaskell thisfile.hs < textfile 2> /dev/null
    input <- getLine
    putStrLn $ map toUpper input

getContents_example = do
    -- Note: This saves us from having to use "forever"
    -- Run with: runhaskell thisfile.hs < textfile
    contents <- getContents
    putStr $ map toUpper contents

shortLinesOnly :: String -> String
shortLinesOnly = unlines . filter (\line -> length line < 30) . lines

shortLinesOnly_example = do
    contents <- getContents
    putStr $ shortLinesOnly contents

interact_example = interact shortLinesOnly

isPal :: String -> Bool
isPal line = (line == reverse line)
tellPal :: String -> String
tellPal line = if isPal line then "palindrome!" else "not palindrome!"
tellPals :: String -> String
tellPals = unlines . map tellPal . lines
is_palindrome_example = interact tellPals

tellPalindromes :: String -> String
tellPalindromes = 
    unlines . 
    map (\x -> if (x == reverse x) then "palindrome!" else "nope!") . 
    lines
is_palindrome_example_brief = interact tellPalindromes

-- openFile :: FilePath -> IOMode -> IO Handle
-- type FilePath = String
-- data IOMode = ReadMode | WriteMode | AppendMode | ReadWriteMode
-- hGetContents :: Handle -> IO String
-- hClose :: Handle -> IO ()
reading_from_files_example = do
    handle <- openFile "BEEP" ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle

-- Using my head brains and the example above, 
-- I'll try to determine how to write to a file
-- without looking it up anywhere. Baller!
writing_to_files_example = do
    handle <- openFile "WriteToMe" WriteMode
    hPutStrLn handle "Herpa derpa der\n\
                     \Derpa herpa her\n\
                     \Borpa dorpa dorpa der\n\
                     \Dorpa durpa der"
    hClose handle

withFile_example = do
    withFile "WriteToMe" ReadMode (\handle -> do
        contents <- hGetContents handle
        putStrLn contents)

-- Run with ./progname 3 4 5
command_line_arguments_example = do
    args <- getArgs
    name <- getProgName
    putStrLn name
    mapM_ putStrLn args


concatPairs :: [(String, String)] -> [String]
concatPairs = map (\pair -> fst pair ++ snd pair)

mkNumberedPairs :: [b] -> [(String, b)]
mkNumberedPairs = zip (map numToListItem [0..]) where
    numToListItem = (\s -> "Arg " ++ s ++ ": " ) . show

mkNumberedList :: [String] -> [String]
mkNumberedList = concatPairs . mkNumberedPairs

-- Run with ./progname 3 4 5
command_line_arguments_example_2 = do
    args <- getArgs
    name <- getProgName
    putStrLn $ "Program name: " ++ name
    --mapM_ putStrLn . mkNumberedList $ args
    explain args where explain = mapM_ putStrLn . mkNumberedList


main = do
    --gluing_io_actions_manually
    --gluing_io_actions_using_sequence
    --sequence_example
    --mapM_example
    --mapM__example
    --forM_example
    --forM__example
    --order_matters_example_1
    --order_matters_example_2
    --forever_example
    --input_redirection_example
    --getContents_example
    --shortLinesOnly_example
    --interact_example
    --is_palindrome_example
    --is_palindrome_example_brief
    --reading_from_files_example
    --writing_to_files_example
    --withFile_example
    --command_line_arguments_example
    command_line_arguments_example_2
