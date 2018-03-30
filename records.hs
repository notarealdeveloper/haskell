#!/usr/bin/runhaskell

data Person = Person {firstName  :: String
                    , middleName :: Maybe String
                    , lastName   :: String
                    , isMale     :: Bool
                    , isGay      :: Maybe Bool} deriving (Show)

dave = Person { firstName   = "Dave"
              , middleName  = Nothing
              , lastName    = "Boopenstein"
              , isMale      = True
              , isGay       = Just False
              }

main = do
    putStrLn $ show dave
