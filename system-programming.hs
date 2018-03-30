#!/usr/bin/runhaskell

import System.Directory as D
import System.FilePath as F
import System.IO as IO
import System.Process as P
import System.Posix as OS

main :: IO ()
main = do
    -- System.Directory
    D.copyFile  "FTLOG" "BOOP"          -- cp
    D.renameFile "BOOP" "BEEP"          -- mv 
    D.removeFile "BEEP"                 -- rm
    D.createDirectory "BORP"            -- mkdir
    D.removeDirectory "BORP"            -- rm -r
    D.getPermissions  "FTLOG"           -- ls -l | cut -f1 -d' ' (Kinda)
    D.setCurrentDirectory   "/"         -- cd
    D.getDirectoryContents  "."         -- ls
    D.getCurrentDirectory               -- pwd

    D.setCurrentDirectory "/home/jason/Desktop"
    D.canonicalizePath "../.."                      -- returns "/home"
    D.getTemporaryDirectory                         -- returns "/tmp"
    D.setCurrentDirectory =<< D.getHomeDirectory    -- cd $HOME
    D.getHomeDirectory >>= D.setCurrentDirectory    -- cd $HOME

    D.setCurrentDirectory "/home/jason/Desktop"
    D.doesFileExist "FTLOG"                             -- True
    D.doesFileExist "BWARG"                             -- False
    D.doesDirectoryExist "Stuff"                        -- True
    D.doesDirectoryExist "Bluff"                        -- False
    D.readable <$> D.getPermissions "FTLOG"             -- True
    D.readable <$> D.getPermissions "/etc/shadow"       -- False
    fmap D.readable $ D.getPermissions "FTLOG"          -- True
    fmap D.readable $ D.getPermissions "/etc/shadow"    -- False


    -- System.FilePath
    F.addExtension "FTLOG" ".txt"                   -- "FTLOG.txt"
    F.pathSeparator                                 -- '/'
    F.pathSeparators                                -- "/"
    F.extSeparator                                  -- '.'
    F.searchPathSeparator                           -- ':'
    F.joinPath ["/home", "jason", "boop"]           -- "/home/jason/boop"
    F.hasTrailingPathSeparator "/home/"             -- True
    F.hasTrailingPathSeparator "/home"              -- False
    F.isAbsolute ".."                               -- False
    F.isAbsolute "/home/jason"                      -- True
    F.isPathSeparator '/'                           -- True
    F.isExtSeparator '.'                            -- True
    F.isSearchPathSeparator ':'                     -- True

    F.takeFileName "/home/jason/Desktop/lots.hs"    -- "lots.hs"
    F.takeBaseName "/home/jason/Desktop/lots.hs"    -- "lots"
    F.takeExtension "/home/jason/Desktop/lots.hs"   -- ".hs"
    F.takeDirectory "/home/jason/boop.tar.gz.gpg"   -- "/home/jason"
    F.takeDrive "/home/jason/cake"                  -- "/" (for windows)
    F.takeExtensions "/home/jason/boop.tar.gz.gpg"  -- ".tar.gz.gpg"

    F.dropExtension "boop.tar.gz.gpg"               -- "boop/tar.gz"
    F.dropExtensions "boop.tar.gz.gpg"              -- "boop"
    F.dropTrailingPathSeparator "/home/jason/"      -- "/home/jason"
    F.dropFileName "/home/jason/boop.tar.gz.gpg"    -- "/home/jason"
    F.dropDrive "/home/jason/cake"                  -- "home/jason/cake"

    F.splitFileName "/mnt/home/x.txt"       -- ("/mnt/home/", "x.txt")
    F.splitExtensions "/mnt/x.tar.gz"       -- ("/mnt/x", ".tar.gz")
    F.splitExtension "/mnt/x.tar.gz"        -- ("/mnt/x.tar",".gz")
    F.splitDirectories "/mnt/home/cake"     -- ["/","mnt","home","cake"]
    F.splitSearchPath "/bin:/usr/bin:/opt"  -- ["/bin","/usr/bin","/opt"]
    F.normalise "./cake"                    -- "cake"
    F.combine "/home" "jason"               -- "/home/jason"
    foldl1 F.combine ["/mnt","home","cake"] -- "/mnt/home/cake"

    F.replaceBaseName "/mnt/ho.txt" "hah"   -- "/mnt/hah.txt"
    F.replaceFileName "/mnt/ho.txt" "hah"   -- "/mnt/hah"
    F.replaceExtension "/mnt/ho.txt" "gpg"  -- "/mnt/ho.gpg"
    F.replaceDirectory "/mnt/ho.txt" "/bin" -- "/bin/ho.txt"

    "/home/cake" <.> "txt"                  -- "/home/cake.txt"
    "/home/cake" </> "boop"                 -- "/home/cake/boop"


    -- System.Process (This module replaces System.Cmd)
    P.runCommand  "cowsay boop"             -- Works, but sloppy-looking
    P.callCommand "cowsay boop"             -- Much nicer!
    P.callProcess "cowsay" ["cowsay","hah"] -- Like execv[p]
    P.system "cowsay boop"                  -- Super simple
    exitcode <- P.system "cowsay boop"      -- Can store exitcode too


    -- System.Posix
    OS.changeWorkingDirectory "/home/jason"
    OS.getWorkingDirectory                      -- "/home/jason"
    OS.sigKILL                                  -- 9
    OS.rename "FTLOG" "BOOP"
    OS.rename "BOOP" "FTLOG"
    OS.fdWrite 1 "cake and pie\n"               -- Like print
    OS.fdWrite OS.stdOutput "cake and pie\n"    -- Same as above

    env <- OS.getEnv "TERM"                     -- Just "xterm-256color"
    env <- OS.getEnv "FUCK"                     -- Nothing
    OS.putEnv "FUCK=probably"                   -- Set environ variable
    env <- OS.getEnv "FUCK"                     -- Just "probably"

    OS.mkdtemp "cake"               -- mkdir cakeXXX. Returns fn
    OS.mkstemp "cake"               -- touch cakeXXX. Returns (fn, fd)
    OS.removeDirectory "cakeAa9gAo" -- Like rm -r
    OS.removeLink      "cakeDjhioh" -- This is the "unlink" syscall.

    filestatus <- OS.getFileStatus "FTLOG"
    OS.isDirectory   filestatus     -- False
    OS.isRegularFile filestatus     -- True

    filestatus <- OS.getFileStatus "Stuff"
    OS.isDirectory   filestatus     -- True
    OS.isRegularFile filestatus     -- False

    filestatus <- OS.getFileStatus "/dev/mem"
    OS.isCharacterDevice filestatus -- True

    OS.getLoginName                 -- "jason"
    OS.getProcessID                 -- getpid()

    OS.getTerminalName 0            -- "/dev/pts/1"
    OS.getTerminalName OS.stdInput  -- "/dev/pts/1"

    OS.stdFileMode                  -- 438 == 0o666
    OS.touchFile "FTLOG"            -- Fails is file doesn't exist

    sysid <- OS.getSystemID
    OS.systemName sysid             -- "Linux"


    fd <- OS.createFile "BOOP" OS.stdFileMode
    OS.fdWrite fd "Haha gotcha bitch!\n"
    OS.closeFd fd
