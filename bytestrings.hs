#!/usr/bin/runhaskell

import qualified Data.ByteString as S
import qualified Data.ByteString.Lazy as B

main = do
    let charstar = B.pack [99,97,110,10]
    B.putStr charstar
    print $ B.unpack charstar
