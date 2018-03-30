#!/usr/bin/runhaskell

import System.Posix.Unistd as S
import System.Posix as P
main = do
    S.nodeName   <$> S.getSystemID
    S.systemName <$> S.getSystemID
    S.version    <$> S.getSystemID
    S.machine    <$> S.getSystemID
    S.release    <$> S.getSystemID
    S.nanosleep $ 10^9
    S.usleep     (10^6)

    P.getLoginName
    P.mkdtemp "cake"
