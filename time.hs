#!/usr/bin/runhaskell

import Control.Monad
import Control.Applicative
import qualified Data.Time as T

T.getCurrentTime

T.getCurrentTime >>= T.getTimeZone

T.isLeapYear 2000
T.isLeapYear 2001

T.midnight
T.midday
T.utc


-- timezone :: T.TimeZone
timezone <- T.getCurrentTime >>= T.getTimeZone
-- utctime  :: T.UTCTime
utctime <- T.getCurrentTime
-- T.utcToLocalTime :: T.TimeZone -> T.UTCTime -> T.LocalTime
T.utcToLocalTime timezone utctime


fmap T.zonedTimeToLocalTime T.getZonedTime
T.zonedTimeToLocalTime <$> T.getZonedTime

-- This is the short way get the current day and/or current time of day
T.localDay <$> T.zonedTimeToLocalTime <$> T.getZonedTime
T.localTimeOfDay <$> T.zonedTimeToLocalTime <$> T.getZonedTime

-- A longer way to do the same thing
zonedtime <- T.getZonedTime
let localtime = T.zonedTimeToLocalTime zonedtime
T.localDay localtime
T.localTimeOfDay localtime
