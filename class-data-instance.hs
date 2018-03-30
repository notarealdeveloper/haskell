#!/usr/bin/runhaskell

-- Defining some types and making them 
-- instances of existing typeclasses

-- Making a TrafficLight type
data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
    Red == Red          = True
    Yellow == Yellow    = True
    Green == Green      = True
    _ == _              = False

instance Show TrafficLight where
    show Red = "Red light"
    show Yellow = "Yellow light"
    show Green = "Green light"

-- Making the "Mabie" type
data Mabie a = Nope | Only a 

instance (Show m) => Show (Mabie m) where
    show (Only x) = "Only " ++ show x
    show Nope = "Nope"

instance (Eq m) => Eq (Mabie m) where
    Only x == Only y = x == y
    Nope == Nope = True
    _ == _ = False

instance (Ord a) => Ord (Mabie a) where
    Nope > Nope = True
    Only x > Nope = True
    Only x > Only y = (x > y)
    x < y = not (x > y) && not (x == y)

instance Functor Mabie where
    fmap f Nope = Nope
    fmap f (Only x) = Only (f x)

-- Making the YesNo TypeClass, and making instances of it.
class YesNo a where
    yesno :: a -> Bool

instance YesNo Bool where
    yesno = id

instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _  = True

instance YesNo (Maybe m) where
    yesno Nothing  = False
    yesno (Just _) = True

-- Type "main" after loading this module in ghci to see the results of the examples
main = do 
    let x = fmap (^2) (Only 3)
    let y = fmap (++"I'M INSIDE!!!") (Only "Boop. ")
    putStrLn $ "fmap (^2) (Only 3) == " ++ show x
    putStrLn $ "fmap (++\"I'M INSIDE!!!\") (Only \"Boop. \") == " ++ show y
    return ()

