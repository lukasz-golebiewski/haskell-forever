module Main where

import           Control.Monad           (forever)
import           Control.Monad.IO.Class  (MonadIO, liftIO)
import           Control.Monad.Trans.AWS (Credentials (..), newEnv, runAWST,
                                          runResourceT)
import           Data.Function           ((&))

main :: IO ()
main = do
  env <- newEnv Discover
  foo
    & runAWST env
    & runResourceT

foo :: MonadIO m => m ()
foo = do
  liftIO $ putStrLn "Started the app..."
  forever $ pure ()
