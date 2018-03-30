#!/usr/bin/runhaskell

-- A good way to experiment in ghci, if you don't
-- care about making Simon Peyton-Jones sad.
import System.IO.Unsafe
main = do
    print $ unsafePerformIO . readFile $ "/etc/hosts"
