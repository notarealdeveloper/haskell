#!/usr/bin/runhaskell

data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)
area :: Shape -> Float
area (Rectangle x1 y1 x2 y2) = (abs $ x1 - x2) * (abs $ y1 - y2)
area (Circle _ _ r) = pi * r^2
