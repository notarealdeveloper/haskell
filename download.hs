import Network.Curl         -- cabal install curl
import System.Environment   -- for getArgs
import System.IO            -- for everything else

-- usage: 
-- runhaskell download.hs <url>

writePage :: String -> IO ()
writePage page = do
    handle <- openFile "webfile" WriteMode
    hPutStrLn handle page
    hClose handle

main :: IO ()
main = do
    (url:args) <- getArgs
    putStrLn $ "Downloading: " ++ url
    (_, page) <- curlGetString url []
    writePage page

