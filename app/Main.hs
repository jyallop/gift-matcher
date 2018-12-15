module Main where

import Lib
import Person.Person
import System.Random
import System.Random.Shuffle
import Text.ParserCombinators.ReadP
import System.IO
import Data.Char

main :: IO ()
main = do 
    outh <- openFile "src/Data/output.txt" WriteMode
    input <- readFile "src/Data/people.txt"
    let line = lines input
    let p = map (\x -> let name:groups = words x in (name, groups)) line
    let people = map (\(x, y) -> makePerson x y) p
    putStrLn $ show people
    putStrLn input
    g <- newStdGen
    let len = length people
    let pairs = head . dropWhile (\x -> any cannotGive x) $ generatePairs $ shuffle' people len g
    putStrLn $ show pairs
    let output = map (\((Person x _), (Person y _)) -> x ++ " -> " ++ y) pairs
    putStrLn $ show output
    mapM_ (\x -> hPutStrLn outh x) output
    hClose outh

generatePairs :: Eq a => [a] -> [[(a, a)]]
generatePairs [] = []
generatePairs x = 
    let newList = tail x ++ [head x]
    in
    generatePairs' x newList

generatePairs' :: Eq a => [a] -> [a] -> [[(a, a)]]
generatePairs' x y =
    if (x == y)
      then [(zip x y)]
      else let newList = (tail y) ++ [head y]
              in 
              (zip x y) : (generatePairs' x newList)

