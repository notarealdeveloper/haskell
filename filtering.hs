#!/usr/bin/runhaskell

-- Here we find the largest number under 100,000 that's divisible by 3829
largestDivisible :: (Integral a) => a  
largestDivisible = head (filter p [100000,99999..])  
    where p x = x `mod` 3829 == 0  
