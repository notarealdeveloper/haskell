#!/usr/bin/runhaskell

import System.IO

-- Implementing an if statement
iff :: Bool -> IO a -> IO a -> IO a
iff True  a b = do {a;}
iff False a b = do {b;}

-- Implementing a for loop
forN :: Int -> IO () -> IO ()
forN 0 a = return ()
forN n a = do {a; forN (n-1) a;}

-- Implementing a while loop
while :: [Bool] -> IO () -> IO ()
while (False:xs) a = return ()
while (True:xs)  a = do {a; while xs a;}

main = do
    iff (odd 3) (putStrLn "Yep") (putStrLn "Nope")
    forN 10 (putChar 'x'); putChar '\n';
    while (map (<10) [0..]) (putChar 'a'); putChar '\n';
