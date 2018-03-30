#!/usr/bin/runhaskell

-- This is just a silly exercize from about halfway through lyah's higher-order functions chapter.
-- The first two function definitions are just background.
-- The 3rd function definition shows us how we can use lambdas to save some space in the 2nd function definition.

-- THIS IS USED BY BOTH FUNCTIONS BELOW
-- Define the chain algorithm thingy. 
-- Even numbers get halved. 
-- Odd numbers get (3x+1)-ified.
chain :: (Integral a) => a -> [a]  
chain 1 = [1]  
chain n  
    | even n =  n:chain (n `div` 2)  
    | odd n  =  n:chain (3*n + 1)

-- Compute number of long chains by using where syntax
numLongChains :: Int -> Int  
numLongChains num = length (filter isLong (map chain [1..num]))  
    where isLong xs = length xs > 15  

-- Compute number of long chains by using lambdas
-- Allow us to define the isLong function right hurr, 
-- instead of using the where shmoopy as above.
numLongChains' :: Int -> Int  
numLongChains' num = length (filter (\xs -> length xs > 15) (map chain [1..num])) 

-- Here's another use of where
bmiTell' :: (RealFloat a) => a -> a -> String
bmiTell' weight height
	| bmi <= 18.5 = "You underweight."
	| bmi <= 25.0 = "You regular but probly boring."
	| bmi <= 30.0 = "Pretty fat."
	| otherwise = "Fatty fat fat fat."
	where bmi = weight / height ^ 2
