#!/usr/bin/runhaskell

import qualified Data.List as L

-- This function finds elements of a where p(b) == True
-- EXAMPLES
-- let x = [1,2,3,4,5,6,7,8]
-- let y = [5,0,6,0,0,7,0,9]
-- findFstWhenSndPred (==0) x y == [2,4,5,7]
-- findFstWhenSndPred (/=0) x y == [1,3,6,8]
-- findFstWhenSndPred (odd) x y == [1,6,8]
findFstWhenSndPred p x y = map (x !!) (L.findIndices p y)
