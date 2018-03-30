#!/usr/bin/runhaskell

-- Basic usage of guards
bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
	| bmi <= 18.5 = "You underweight."
	| bmi <= 25.0 = "You regular but probly boring."
	| bmi <= 30.0 = "Pretty fat."
	| otherwise = "Fatty fat fat fat."

-- Here's a use of guards with where
bmiTell' :: (RealFloat a) => a -> a -> String
bmiTell' weight height
	| bmi <= 18.5 = "You underweight."
	| bmi <= 25.0 = "You regular but probly boring."
	| bmi <= 30.0 = "Pretty fat."
	| otherwise = "Fatty fat fat fat."
	where bmi = weight / height ^ 2
