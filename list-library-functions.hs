#!/usr/bin/runhaskell

import qualified Data.List as L

L.cycle [1,2,3]
L.concat [[1,2,3],[4,5,6],[7,8,9]]
L.permutations [1,2,3]
L.partition odd [0..9]  -- L.break seems like a counterintuitive version of this
L.insert 4 [1,2,3]
L.groupBy (>) [1,2,3,4,5,4,3,2,1]
L.groupBy (\x y -> (odd x) && (even y)) [1,2,3,4,5,4,3,2,1]
L.intersect [1,2,3,4,5] [3,4,5,6,7]
L.lines "one\ntwo\nthwar"
L.unlines ["one","two","thwar"]
L.intercalate [666,69] [[1,2,3], [4,5,6], [7,8,9]]
L.intersperse 'f' "cake"
L.last [3,6,9]
L.length [6,7,8]
take 4 $ L.repeat [1,2,3]
L.span even [0,2,4,5,4,3,2,1]
L.nub [1,2,3,1,1,2,2,3,3]
L.nubBy (\x y -> x `mod` 10 == y `mod` 10) [7,17,27,13,63,93]
L.splitAt 4 [1..9]
L.splitAt 5 "cake and pie"

let indexed = zip [0..] "cake and pie"
L.lookup 3 indexed
L.lookup (L.length indexed - 1) indexed
L.lookup (L.length indexed - 0) indexed

L.group $ L.sort [1,2,3,1,2,4,1,2,3,1]
L.replicate 3 [1,2,3]
L.repeat [1,2,3]
L.cycle [1,2,3]
L.sum [0..100]
L.product [1..5]
L.subsequences [0..2]

let powersetTautology l = (length $ L.subsequences l) == (2^(length l))
powersetTautology [2,3,4,5,6]

L.head [4,5,6,7,8]
L.tail [4,5,6,7,8]
L.init [1,2,3,4,5]
L.genericReplicate 3 [1,2,3]
L.delete 3 [1,2,3,4,5,4,3,2,1]
L.transpose [[1,2,3], [4,5,6], [7,8,9]]
