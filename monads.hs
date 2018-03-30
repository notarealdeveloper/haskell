#!/usr/bin/runhaskell

skipline = putStrLn ""

returnM :: a -> Maybe a
returnM x = Just x

applyM f x = (Just x) >>= (\y -> Just (f y))

main = do
    putStrLn "Just 3 >>= (\\x -> Just (x^2)) is:"
    print $ Just 3 >>= (\x -> Just (x^2))
    skipline

    putStrLn "(\\x -> Just (x^2)) =<< Just 3"
    print $ (\x -> Just (x^2)) =<< Just 3
    skipline

    putStrLn "[3] >>= (\\x -> [1..x^2]) is:"
    print $ [3] >>= (\x -> [1..x^2])
    skipline

    putStrLn "(\\x -> [1..x^2]) =<< [3] is:"
    print $ (\x -> [1..x^2]) =<< [3]
    skipline

    putStrLn "applyM (^2) 4 is:"
    print $ applyM (^2) 4
    skipline
