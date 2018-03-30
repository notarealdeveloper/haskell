#!/usr/bin/runhaskell

import System.IO            -- For almost everything
import System.Directory     -- For removeFile

-- This fixes a type ambiguity in using "map read" by itself
-- Equivalently, we could just replace map read with
-- map (read :: String -> Int) to get the same result
readInt :: String -> Int
readInt = read

filename = "ints.txt"

-- This just makes a file containing the string 3 5 7 9
first_make_ints_file = do
    handle <- openFile filename WriteMode
    hPutStrLn handle "3 5 7 9"
    hClose handle

-- This uses the swapped bind operator (=<<) to do IO.
main = do
    first_make_ints_file
    (print . map readInt . words) =<< readFile filename     -- We can use bind
    readFile filename >>= (print . map readInt . words)     -- Or its mirror
    removeFile filename

-- Let's try to make sense of this piece by piece:

-- (print . map readInt . words) :: String -> IO ()

-- readFile filename :: IO String

-- (=<<) :: Monad m => (a -> m b) -> m a -> m b

-- So the way we used the bind operators makes sense!
