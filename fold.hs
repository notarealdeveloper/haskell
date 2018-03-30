#!/usr/bin/runhaskell

--Left folds
sum1' :: (Num a) => [a] -> a
sum1' xs = foldl (\acc x -> acc + x) 0 xs

sum2' :: (Num a) => [a] -> a
sum2' xs = foldl (+) 0 xs

sum3' :: (Num a) => [a] -> a
sum3' = foldl (+) 0

elem' :: (Eq a) => a -> [a] -> Bool  
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

--Right folds. Implementing our own version of the map function.
--Notice the \x acc instead of the \acc x from before. 
--This is because we're attacking the list from the right side, rather than the left.
map' :: (a -> b) -> [a] -> [b]  
map' f xs = foldr (\x acc -> f x : acc) [] xs

