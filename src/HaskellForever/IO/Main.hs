module Main where

import           Control.Monad (forever)

main :: IO ()
main = do
  putStrLn "Started the app..."
  forever $ pure ()
