#!/usr/bin/runhaskell

-- Here's a stipped-down example of why monads are relevant for IO
-- in functional programming, without using the syntactic sugar of "do"
main = 
    getLine     >>= (\x -> 
    putStrLn x) >>= (\y -> 
    getLine   ) >>= (\z -> 
    putStrLn z) >>= (\_ -> 
    return () )
