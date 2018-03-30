#!/usr/bin/runhaskell

import Control.Monad

fMaybe :: (a -> a) -> a -> Maybe a
fMaybe f x = Just (f x)

square :: (Num a) => a -> a
square = (^2)

double :: (Num a) => a -> a
double = (*2)

squareM :: (Num a) => a -> Maybe a
squareM = fMaybe square

doubleM :: (Num a) => a -> Maybe a
doubleM = fMaybe double

sqrdblM :: (Num a) => a -> Maybe a
sqrdblM = (squareM >=> doubleM)

sqrdblM' :: (Num a) => a -> Maybe a
sqrdblM' x = squareM x >>= doubleM
