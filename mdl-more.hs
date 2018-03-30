#!/usr/bin/runhaskell

-- Pipelines!
(|-) :: a -> (a -> b) -> b
(|-) x f = f x

type Times  = [Int]
type Raw    = [Int]

indexify :: [a] -> [(Int, a)]
indexify = zip [0..]

findIndices' :: (Int -> Bool) -> Raw -> Times
findIndices' p = getVals . getGoodPairs . indexify
    where
    getGoodPairs    = filter isGoodPair
    isGoodPair pair = p (snd pair)
    getVals         = map fst

findIndices'' :: (Int -> Bool) -> [Int] -> [Int]
findIndices'' p xs = xs |- indexify |- getGoodPairs |- getVals
    where
    getGoodPairs    = filter isGoodPair
    isGoodPair pair = p (snd pair)
    getVals         = map fst

main :: IO ()
main = do
    let xs = [0,1,0,0,0,1,0,1]
    putStrLn $ show (findIndices'  (==1) xs)
    putStrLn $ show (findIndices'' (==1) xs)
    return ()
