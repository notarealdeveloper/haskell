#!/usr/bin/runhaskell

succ 8
min 6 8
max 6 8
['w', 'o'] ++ ['o', 't']
5:[1..9]
"Steve Buscemi" !! 6
[2..9] !! 5
head [1..9]
tail [1..9]
last [1..9]
init [1..9]
length [0..9]
null []
reverse [1..9]
take 9 [1..]
take 9 [1,3..]
take 5 ['l'..'z']
9 `take` [1..]
drop 5 [1..9]
maximum $ [1..9] ++ [8,7..1]
minimum $ [1..9] ++ [8,7..1]
foldl max 0 $ [1..9] ++ [8,7..1]
foldl min 9 $ [1..9] ++ [8,7..1]
sum [0..100]
product [1..10]
elem 4 [1..9]
4 `elem` [1..9]
cycle [1,2,3]
cycle "LOL"
cycle ['L','O','L']
repeat 5
replicate 3 10
[ x *2 | x <- [1..10]]
[ x *2 | x <- [1..10], x *2 >= 12]
[ x | x <- [50..100], x ‘mod ‘ 7 == 3]
[ x | x <- [10..20], x/=13, x/=15, x/=17 ]
[ x * y | x <- [2 ,5 ,10] , y <- [8 ,10 ,11]]

let boomBangs xs = [if x<9 then "BOOM!" else "BANG!" | x <- xs, odd x]
boomBangs [1..15]

let removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z'] ]
let removeUppercase st = [ c | c <- st, not $ c `elem` ['A'..'Z'] ]
removeNonUppercase "ASbjhasbdjAJBHJDB"
removeUppercase "ASbjhasbdjAJBHJDB"

fst (8,11)
snd (8,11)
zip [1, 2, 3, 4, 5] [5, 5, 5, 5, 5]
zip [1, 2, 3, 4, 5] [5, 5..]
zip [1, 2, 3, 4, 5] $ repeat 5

tail . init [1..9]
let x = [1..9] in tail . init $ x

let zipme = zip [1, 2, 3, 4, 5]
zipme $ repeat 5

let first (x,_,_) = x
first (4,7,9)



