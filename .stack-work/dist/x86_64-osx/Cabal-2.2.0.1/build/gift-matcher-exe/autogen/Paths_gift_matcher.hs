{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_gift_matcher (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/jyallop/Documents/gift-matcher/.stack-work/install/x86_64-osx/c291579f480bf0c3631d1f17c61cc2eebd86946cc181e0516ae65c54210453b9/8.4.4/bin"
libdir     = "/Users/jyallop/Documents/gift-matcher/.stack-work/install/x86_64-osx/c291579f480bf0c3631d1f17c61cc2eebd86946cc181e0516ae65c54210453b9/8.4.4/lib/x86_64-osx-ghc-8.4.4/gift-matcher-0.1.0.0-F2K3vXsx43s38auCaulnCW-gift-matcher-exe"
dynlibdir  = "/Users/jyallop/Documents/gift-matcher/.stack-work/install/x86_64-osx/c291579f480bf0c3631d1f17c61cc2eebd86946cc181e0516ae65c54210453b9/8.4.4/lib/x86_64-osx-ghc-8.4.4"
datadir    = "/Users/jyallop/Documents/gift-matcher/.stack-work/install/x86_64-osx/c291579f480bf0c3631d1f17c61cc2eebd86946cc181e0516ae65c54210453b9/8.4.4/share/x86_64-osx-ghc-8.4.4/gift-matcher-0.1.0.0"
libexecdir = "/Users/jyallop/Documents/gift-matcher/.stack-work/install/x86_64-osx/c291579f480bf0c3631d1f17c61cc2eebd86946cc181e0516ae65c54210453b9/8.4.4/libexec/x86_64-osx-ghc-8.4.4/gift-matcher-0.1.0.0"
sysconfdir = "/Users/jyallop/Documents/gift-matcher/.stack-work/install/x86_64-osx/c291579f480bf0c3631d1f17c61cc2eebd86946cc181e0516ae65c54210453b9/8.4.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "gift_matcher_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "gift_matcher_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "gift_matcher_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "gift_matcher_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "gift_matcher_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "gift_matcher_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
