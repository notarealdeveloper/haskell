#!/usr/bin/runhaskell

quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]
        biggerSorted  = quicksort [a | a <- xs, a > x]
    in  smallerSorted ++ [x] ++ biggerSorted

-- We can use filter to express the same thing more sexily
quicksort' :: (Ord a) => [a] -> [a]    
quicksort' [] = []    
quicksort' (x:xs) =     
    let smallerSorted = quicksort (filter (<=x) xs)  
        biggerSorted  = quicksort (filter (>x)  xs)   
    in  smallerSorted ++ [x] ++ biggerSorted  

-- And here's a super abbreviated version, for funzies.
-- Since we're playing the abbreviation game, we can remove the function declaration, because Haskell just so happens to guess it right. Type :t qs after loading this module to see this.
-- qs :: (Ord a) => [a] -> [a]
qs [] = []; qs (x:xs) = (qs $ filter (<=x) xs) ++ [x] ++ (qs $ filter (>x) xs)
