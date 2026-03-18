module Main where

import Pattermino.Core
import Pattermino.Polyomino
import Pattermino.Grid
import Pattermino.Match

-- Simple test runner
assert :: String -> Bool -> IO ()
assert name True  = putStrLn $ "  PASS: " ++ name
assert name False = putStrLn $ "  FAIL: " ++ name

main :: IO ()
main = do
  putStrLn "Monomino"
  assert "matches"     $ matchesTopLeft (Monomino 1) [[1,2],[3,4]]
  assert "no match"    $ not $ matchesTopLeft (Monomino 2) [[1,2],[3,4]]

  putStrLn "Domino H"
  assert "matches"     $ matchesTopLeft (Domino H 1 2) [[1,2,3],[4,5,6]]
  assert "no match"    $ not $ matchesTopLeft (Domino H 1 3) [[1,2,3],[4,5,6]]

  putStrLn "Domino V"
  assert "matches"     $ matchesTopLeft (Domino V 1 4) [[1,2],[4,5]]
  assert "no match"    $ not $ matchesTopLeft (Domino V 1 5) [[1,2],[4,5]]

  putStrLn "LTromino CCW0"
  assert "matches"     $ matchesTopLeft (LTromino CCW0 1 2 3) [[1,0],[2,3]]
  assert "no match"    $ not $ matchesTopLeft (LTromino CCW0 1 2 4) [[1,0],[2,3]]

  putStrLn "OTetromino"
  assert "matches"     $ matchesTopLeft (OTetromino 1 2 3 4) [[1,2],[3,4]]
  assert "no match"    $ not $ matchesTopLeft (OTetromino 1 2 3 5) [[1,2],[3,4]]

  putStrLn "contains"
  assert "p1 in grid"  $ contains (LTromino CCW180 1 2 3) [[0,0,0],[1,2,0],[0,3,0]]
  assert "not present" $ not $ contains (Monomino 9) [[1,2],[3,4]]
