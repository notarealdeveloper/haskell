#!/usr/bin/runhaskell

-- Here's a stipped-down example of why monads are relevant for IO
-- in functional programming, without using the syntactic sugar of "do"

put = \x -> putStrLn x
get = \y -> getLine
end = \z -> return ()
main = getLine >>= put >>= get >>= put >>= end

-- Here's another example of how >>= and >> let us sequence IO
getLine >>= (\x -> putStrLn $ show $ replicate 3 x) >> getLine >>= putStrLn
