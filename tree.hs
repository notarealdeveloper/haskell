data Tree = Empty
          | Leaf Int
          | Node Tree Tree
          deriving (Show, Eq)

depth :: Tree -> Int
depth Empty = 0
depth (Leaf n) = 1
depth (Node l r) = 1 + max (depth l) (depth r)

nodes :: Tree -> Int
nodes Empty = 0
nodes (Leaf n) = 1
nodes (Node l r) = 1 + (nodes l) + (nodes r)

sum_t :: Tree -> Int
sum_t Empty = 0
sum_t (Leaf n) = n
sum_t (Node l r) = (sum_t l) + (sum_t r)

joeTheTree  :: Int -> Tree
joeTheTree n = Node gimpy (Node Empty gimpy) where
    gimpy    = Node Empty leaf
    leaf     = Leaf n

main = do
    let t = Node (Node Empty (Leaf 3)) (Node Empty (Node Empty $ Leaf 3))
    print $ "depth t == " ++ (show $ depth t)
    print $ "nodes t == " ++ (show $ nodes t)
    print $ "sum_t t == " ++ (show $ sum_t t)
    print $ "(t == joeTheTree 3) returns: " ++ show (t == joeTheTree 3)
    print $ "(t == joeTheTree 4) returns: " ++ show (t == joeTheTree 4)
