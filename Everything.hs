#!/usr/bin/runhaskell

-- Functions behave exactly like variables
twice :: (a -> a) -> a -> a
twice f x = f (f x)

-- Using "as patterns" to make subnames while keeping whole name
capital :: String -> String
capital "" = "Whoops! Empty string!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x] 

-- Pattern matching
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

zip' :: [a] -> [b] -> [(a,b)]  
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

-- Where
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where   (f:_) = firstname
            (l:_) = lastname

-- Where (inline)
maxish x = 1 + maximum (xish x) where xish = tail . init

-- Where can be used to define functions too!
calcBmis :: (RealFloat a) => [(a,a)] -> [a]
calcBmis xs = [ bmi w h | (w,h) <- xs ]
    where bmi w h = w / h^2

-- Guards
kind :: (Integral a) => a -> String
kind n
    | odd  n = "odd"
    | even n = "even"

replicate' :: (Num i, Ord i) => i -> a -> [a]  
replicate' n x
    | n <= 0    = []
    | otherwise = x:replicate' (n-1) x

-- Guards (inline)
maxx :: (Ord a) => a -> a -> a
maxx a b | a > b = a | otherwise = b

-- Guards and Where
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
  | bmi <= skinny = "You're underweight."
  | bmi <= normal = "You're regular, but probably boring."
  | bmi <= fat    = "You're pretty... pretty fat!"
  | otherwise     = "Fatty fat fat fat."
  where bmi = weight / height ^ 2
        skinny = 18.5
        normal = 25.0
        fat = 30.0

-- Guards, Where, and Pattern Matching!
bmiTell' :: (RealFloat a) => a -> a -> String
bmiTell' weight height
  | bmi <= skinny = "You're underweight."
  | bmi <= normal = "You're regular, but probably boring."
  | bmi <= fat    = "You're pretty... pretty fat!"
  | otherwise     = "Fatty fat fat fat."
  where bmi = weight / height ^ 2
        (skinny, normal, fat) = (18.5, 25.0, 30.0)

-- Guards, Pattern Matching, and Recursion!
-- If all guards fail, evalutation falls through to the next pattern
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0   = []
take' _ []     = []
take' n (x:xs) = x : take' (n-1) xs

-- Let and In
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort (filter (<=x) xs)
        biggerSorted = quicksort (filter (>x) xs)
    in  smallerSorted ++ [x] ++ biggerSorted

calcBmis' :: (RealFloat a) => [(a,a)] -> [a]
calcBmis' xs = [ bmi | (w,h) <- xs, let bmi = w / h^2 ]

-- Case: Pattern matching is just syntactic sugar for case expressions
head' :: [a] -> a
head' [] = error "No head for empty lists!"
head' (x:_) = x

head'' :: [a] -> a
head'' xs = case xs of [] -> error "No head for empty lists!"
                       (x:_) -> x

-- While pattern matching on function parameters can only be done when defining functions, case expressions can be used almost anywhere.
describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of [] -> "empty"
                                               [x] -> "a singleton"
                                               xs -> "long"

describeList' :: [a] -> String
describeList' xs = "The list is: "
    ++ case xs of [] -> "empty"
                  [x] -> "a singleton"
                  xs -> "long"

-- Higher order function stuff!
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

-- Currying!
f x y z = 1*x + 2*y + 3*z
-- Currying: By default, it works left to right
g = f 10
-- Currying: But we can use it in any order by being explicit
h x z = f x 10 z
i a b = f a b 10

listOfFunctions = map (*) [0..]
element = (listOfFunctions !! 5) 6 -- element = 30

-- Map (reimplementation)
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

-- Filter (reimplementation)
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x = x : filter' p xs
    | otherwise = filter' p xs

-- Filtering: Find largest n < 100,000 that is divisible by 3829
largestDivisible :: (Integral a) => a  
largestDivisible = head (filter p [100000,99999..])  
    where p x = x `mod` 3829 == 0

-- Foldl (my own reimplementation, with no help :D)
foldl' :: (a -> a -> a) -> a -> [a] -> a
foldl' _ s [] = s
foldl' f s (x:xs) = f s (foldl' f x xs)

-- Foldl1 (my own reimplementation, with no help :D)
foldl1' :: (a -> a -> a) -> [a] -> a
foldl1' _ [] = error "Can't use foldl1' on empty lists, yo!"
foldl1' _ [x] = x
foldl1' f (x:xs) = f x (foldl1' f xs)

-- Left Folds
sum1' :: (Num a) => [a] -> a
sum1' xs = foldl (\acc x -> acc + x) 0 xs

sum2' :: (Num a) => [a] -> a
sum2' xs = foldl (+) 0 xs

sum3' :: (Num a) => [a] -> a
sum3' = foldl (+) 0

elem' :: (Eq a) => a -> [a] -> Bool  
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

-- Right folds (re-re-implementing "map")
map'' :: (a -> b) -> [a] -> [b]  
map'' f xs = foldr (\x acc -> f x : acc) [] xs

-- foldl1 and foldr1 are similar, but they self-initialize
-- using the first element of the list. However, they give runtime
-- errors if called on empty lists, while foldl and foldr don't
gaussnuml1 = foldl1 (+) [0..100]
gaussnumr1 = foldr1 (+) [0..100]

-- Using lambdas.
flip' :: (a -> b -> c) -> b -> a -> c  
flip' f = \x y -> f y x

flip'' :: (a -> b -> c) -> b -> a -> c  
flip'' f y x = f x y 

-- Show: A typeclass of showable stuff, and a function for showing them
tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has 1 element : " ++ show x
tell (x:y:[]) = "The list has 2 elements : " ++ show x ++ " & " ++ show y
tell (x:y:_) = "This list starts with : " ++ show x ++ " and " ++ show y

-- Function application
-- ($) :: (a -> b) -> a -> b
-- f $ x = f x
--
-- Applying functions with a ' ' has strongest precedence, & left assoc.
-- f a b c == (((f a) b) c)
-- Applying functions with a '$' has weakest precedence, & right assoc.
-- f $ a b c == (((f a) b) c)
-- 
-- Ex: sqrt 3 + 4 + 9 = (sqrt 3) + 4 + 9
-- Ex: sqrt $ 3 + 4 + 9 = sqrt (3 + 4 + 9)

-- Another consequence of $ is that function application itself
-- can be treated like just another function: ($) f g = f $ g
-- So ($) is a binary operation on a set of functions!
-- We're getting close to category theory here! :D
crazyshit = map ($ 16) [(4+), (10*), (^2), sqrt]

-- Function composition
-- (.) :: ( b -> c ) -> ( a -> b ) -> a -> c
-- f . g = \ x -> f ( g x )
map ( negate . sum . tail ) [[1..5] ,[3..6] ,[1..7]]

-- Defining your own data types!
-- First, put this in a file called Geometry.hs in the cwd (done)
data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)
-- ghci> area :: Shape -> Float
-- ghci> area (Rectangle x1 y1 x2 y2) = (abs $ x1 - x2) * (abs $ y1 - y2)
-- ghci> area (Circle _ _ r) = pi * r^2
-- Then type :l Geometry.hs in ghci and enter the following:
let r = Rectangle 1 5 7 2
let c = Circle 0 0 1
-- ghci> area r
-- ghci> area c
-- ghci> map area [c,r]
