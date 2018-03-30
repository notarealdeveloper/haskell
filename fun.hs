#!/usr/bin/runhaskell

import qualified System.Directory as D
import qualified Data.Map as M
import Control.Applicative

map' :: (a -> b) -> [a] -> [b]
map' f []       = []
map' f (x:xs)   = (f x) : (map' f xs)

qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) = (qsort smaller) ++ [x] ++ (qsort larger) where
    smaller = [a | a <- xs, a <= x]
    larger  = [a | a <- xs, a >  x]

evens :: [Int] -> [Int]
evens xs = filter even xs

isdivisorof :: Int -> Int -> Bool
isdivisorof x y = if (y `mod` x == 0) then True else False

divisors :: Int -> [Int]
divisors n = filter (\x -> isdivisorof x n) [2..n-1]

isprime :: Int -> Bool
isprime 1 = False
isprime n = (divisors n == [])

dicty :: String -> String
dicty name
    | name == "gandhi"  = "Hooray, good job!"
    | name == "hitler"  = "Yo why you gotta be that way?"
    | otherwise         = "Nope"

thingy key = M.lookup key dict where
    dict    = M.fromList [("gandhi", "yoyoyo"), ("hitler", "999")]

data Person = Person {
    firstName :: String,
    lastName  :: String,
    sex       :: Maybe String,
    age       :: Int
}

me = Person {
    firstName = "Jason",
    lastName  = "Wilkes",
    sex       = Just "visiting",
    age       = 28
}

class Objecty a where
    tostr :: a -> String
    toint :: a -> Int

instance Objecty Person where
    tostr p = (firstName p) ++ " " ++ (lastName p)
    toint p = age  p

data Mabie a = Nope | Yep a deriving (Show)
instance (Eq a) => Eq (Mabie a) where
    Yep x == Yep y   =  x == y
    Nope  == Nope    =  True
    _ == _           =  False

instance Functor Mabie where
    fmap f Nope     =   Nope
    fmap f (Yep x)  =   Yep (f x)


instance Monad Mabie where
    return x        = Yep x
    Nope  >>= f     = Nope
    Yep x >>= f     = f x
    fail _          = Nope

instance Applicative Mabie where
    pure x              = return x      -- Yep x
    Yep f <*> Yep x     = Yep (f x)

main = do
    D.getHomeDirectory >>= print
    print $ Just 9 >>= (\x -> Just (x^2))
    let xs = [4,3,7,5,6,1,2]
    print $ qsort xs
    print $ divisors 8
    print $ evens $ qsort xs
    print $ filter isprime [1..100]
    let showall = mapM_ print
    showall [1,2,3]

    mapM_ print $ map show [1,2,3]

    print $ dicty  "gandhi"
    print $ dicty  "hitler"
    print $ thingy "gandhi"
    print $ thingy "hitler"

    print $ firstName me
    print $ tostr me

    print $ (Nope   :: Mabie Int) == (Nope   :: Mabie Int)
    print $ (Nope   :: Mabie Int) == (Yep 69 :: Mabie Int)
    print $ (Yep 69 :: Mabie Int) == (Yep 69 :: Mabie Int)

    print $ fmap (^2) (Nope)
    print $ fmap (^2) (Yep 5)
    print $ (Yep 71) >>= (\x -> Yep (x-2))
    print $   Nope   >>= (\x -> Yep (x-2))
    print $ (Yep 71) >>= (\x -> Nope :: Mabie Int)

    print $ (return 69.42)
            >>= (\x -> Yep (x^2)) 
            >>= (\x -> Yep (sqrt x))

    return ()


