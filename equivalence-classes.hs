#!/usr/bin/runhaskell

import qualified Data.List as L

-- The term "nub" means "essence." 
-- Data.List.nub throws away duplicate elements
L.nub [1,2,3,4,5,2,2,2,6,6,6,3,3,3,1]

-- nubBy is a more general form of nub, which lets
-- us define what counts as equivalent
L.nubBy (\x y -> x `mod` 3 == y `mod` 3) [1,2,3,4,5,2,2,2,6,6,6,3,3,3,1,0]
