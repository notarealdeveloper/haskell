#!/usr/bin/runhaskell

lucky :: (Integral a) => a -> String
lucky 7 = "Rucky numba sheven happy mirrion darra!"
lucky x = "You're outta luck, pal."

addVectors :: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectors (x1 ,y1) (x2, y2) = (x1 + x2, y1 + y2)

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
	where	(f:_) = firstname
		(l:_) = lastname
