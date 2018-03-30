#!/usr/bin/runhaskell

-- Implementing pipes! :D
-- Note the similarity to the >>= syntax!
-- In a sense, bind is piping with context.
(!) :: a -> (a -> b) -> b
x ! f = f x

main = do
    putStr "3 ! (^2) ! (+3) ! (/2) = "
    print $ 3 ! (^2) ! (+3) ! (/2)
