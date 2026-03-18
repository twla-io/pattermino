module Main where

import Pattermino.Core
import Pattermino.Polyomino
import Pattermino.Grid
import Pattermino.Match

-- | The four sticker images in the toddler puzzle
data Sticker = Leaf | Pomegranate | Berries | Pear
  deriving (Show, Eq)

type StickerGrid = Grid Sticker

-- | Pattern pieces from the puzzle image
--
-- x . .
-- y z w
p1 :: Polyomino Sticker
p1 = LTetromino R CCW270 Leaf Berries Pomegranate Berries

-- x y
-- . z
p2 :: Polyomino Sticker
p2 = LTromino CCW180 Pomegranate Berries Pear

-- | The 6x5 sticker grid from the puzzle image
grid :: StickerGrid
grid = [ [Berries,     Pomegranate, Berries,     Pear,        Leaf,    Pear       ]
       , [Leaf,        Pear,        Pomegranate, Leaf,        Pomegranate, Leaf   ]
       , [Pomegranate, Pear,        Leaf,        Pomegranate, Berries, Pear       ]
       , [Leaf,        Berries,     Pomegranate, Leaf,        Pear,    Pomegranate]
       , [Berries,     Pomegranate, Berries,     Pear,        Berries, Leaf       ]
       ]

main :: IO ()
main = do
  putStrLn $ "Grid contains p1: " ++ show (contains p1 grid)
  putStrLn $ "Grid contains p2: " ++ show (contains p2 grid)
