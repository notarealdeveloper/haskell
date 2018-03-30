#!/usr/bin/runhaskell

sgn' x
    | x > 0 = "+"
    | x < 0 = "-"
    | otherwise = "0"

cmp' x y
    | x > y     = x
    | otherwise = y

cmp'' x y = if x > y then x else y

max' [x] = x
max' (x:xs) = cmp' x (max' xs)

len' x y = sqrt (sq x + sq y)
    where sq a = a * a

fac' 0 = 1
fac' n = n * fac' (n-1)

zip' :: [a] -> [b] -> [(a,b)]  
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : (zipWith' f xs ys)

unzip' [] = ([],[])
unzip' xs = (map fst xs, map snd xs)

rev' [] = []
rev' (x:xs) = (rev' xs) ++ [x]

head' (x:xs) = x
tail' (x:xs) = xs
init' = rev' . tail' . rev'
finl' = head' . rev'

map' f x = [f s | s <- x]

replicate' :: (Num i, Ord i) => i -> a -> [a]  
replicate' n x  
    | n <= 0    = []  
    | otherwise = x:replicate' (n-1) x

reverse' :: [a] -> [a]  
reverse' [] = []  
reverse' (x:xs) = reverse' xs ++ [x]  

elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
    | a == x    = True
    | otherwise = a `elem'` xs

take' :: (Num i, Ord i) => i -> [a] -> [a]  
take' n _  
    | n <= 0   = []  
take' _ []     = []  
take' n (x:xs) = x : take' (n-1) xs  

twice :: (a -> a) -> a -> a
twice f x = f (f x)

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- A function that flips the arguments of another function
flip' :: (a -> b -> c) -> (b -> a -> c)  
flip' f = g  
    where g x y = f y x 

-- A simpler implementation of the same meta-function
flip'' :: (a -> b -> c) -> b -> a -> c  
flip'' f y x = f x y 

quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted

-- We can use filter to express the same thing more sexily
quicksort' :: (Ord a) => [a] -> [a]    
quicksort' [] = []    
quicksort' (x:xs) =     
    let smallerSorted = quicksort (filter (<=x) xs)  
        biggerSorted  = quicksort (filter (>x)  xs)   
    in  smallerSorted ++ [x] ++ biggerSorted  

-- And here's a super abbreviated version, for funzies.
-- Since we're playing the abbreviation game,
-- we can remove the function declaration,
-- because Haskell just so happens to guess it right.
-- Type :t qs after loading this module to see this.
-- qs :: (Ord a) => [a] -> [a]
qs [] = []; qs (x:xs) = (qs $ filter (<=x) xs) ++ [x] ++ (qs $ filter (>x) xs)

-- Area of a cylinder
cylinder :: (RealFloat a) => a -> a -> a  
cylinder r h = 
    let sideArea = 2 * pi * r * h  
        topArea = pi * r ^2  
    in  sideArea + 2 * topArea 
