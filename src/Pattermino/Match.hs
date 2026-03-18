module Pattermino.Match
  ( matchesTopLeft
  , contains
  ) where

import Pattermino.Core
import Pattermino.Polyomino
import Pattermino.Grid

-- | Check if a polyomino matches the grid at the top-left position.
--
-- Each case encodes the geometry of the shape directly in the pattern.
-- Comments show the 2D layout, with dots for empty cells in the bounding box.

matchesTopLeft :: Eq a => Polyomino a -> Grid a -> Bool

-- x
matchesTopLeft (Monomino x) ((x':_):_) = x == x'

-- x y
matchesTopLeft (Domino H x y) ((x':y':_):_) = x == x' && y == y'

-- x
-- y
matchesTopLeft (Domino V x y) ((x':_):(y':_):_) = x == x' && y == y'

-- x .
-- y z
matchesTopLeft (LTromino CCW0 x y z) ((x':_):(y':z':_):_) = x == x' && y == y' && z == z'

-- . x
-- y z
matchesTopLeft (LTromino CCW90 x y z) ((_:x':_):(y':z':_):_) = x == x' && y == y' && z == z'

-- x y
-- . z
matchesTopLeft (LTromino CCW180 x y z) ((x':y':_):(_:z':_):_) = x == x' && y == y' && z == z'

-- x y
-- z .
matchesTopLeft (LTromino CCW270 x y z) ((x':y':_):(z':_):_) = x == x' && y == y' && z == z'

-- x y
-- z w
matchesTopLeft (OTetromino x y z w) ((x':y':_):(z':w':_):_) = x == x' && y == y' && z == z' && w == w'

-- . x y
-- z w .
matchesTopLeft (STetromino L H x y z w) ((_:x':y':_):(z':w':_):_) = x == x' && y == y' && z == z' && w == w'

-- x .
-- y z
-- . w
matchesTopLeft (STetromino L V x y z w) ((x':_):(y':z':_):(_:w':_):_) = x == x' && y == y' && z == z' && w == w'

-- x y .
-- . z w
matchesTopLeft (STetromino R H x y z w) ((x':y':_):(_:z':w':_):_) = x == x' && y == y' && z == z' && w == w'

-- . x
-- y z
-- w .
matchesTopLeft (STetromino R V x y z w) ((_:x':_):(y':z':_):(w':_):_) = x == x' && y == y' && z == z' && w == w'

-- x .
-- y .
-- z w
matchesTopLeft (LTetromino L CCW0 x y z w) ((x':_):(y':_):(z':w':_):_) = x == x' && y == y' && z == z' && w == w'

-- . . x
-- y z w
matchesTopLeft (LTetromino L CCW90 x y z w) ((_:_:x':_):(y':z':w':_):_) = x == x' && y == y' && z == z' && w == w'

-- x y
-- . z
-- . w
matchesTopLeft (LTetromino L CCW180 x y z w) ((x':y':_):(_:z':_):(_:w':_):_) = x == x' && y == y' && z == z' && w == w'

-- x y z
-- w . .
matchesTopLeft (LTetromino L CCW270 x y z w) ((x':y':z':_):(w':_):_) = x == x' && y == y' && z == z' && w == w'

-- . x
-- . y
-- z w
matchesTopLeft (LTetromino R CCW0 x y z w) ((_:x':_):(_:y':_):(z':w':_):_) = x == x' && y == y' && z == z' && w == w'

-- x y z
-- . . w
matchesTopLeft (LTetromino R CCW90 x y z w) ((x':y':z':_):(_:_:w':_):_) = x == x' && y == y' && z == z' && w == w'

-- x y
-- z .
-- w .
matchesTopLeft (LTetromino R CCW180 x y z w) ((x':y':_):(z':_):(w':_):_) = x == x' && y == y' && z == z' && w == w'

-- x . .
-- y z w
matchesTopLeft (LTetromino R CCW270 x y z w) ((x':_):(y':z':w':_):_) = x == x' && y == y' && z == z' && w == w'

matchesTopLeft _ _ = False

-- | Check if a grid contains a polyomino anywhere
contains :: Eq a => Polyomino a -> Grid a -> Bool
contains p g = any (matchesTopLeft p) (subGrids g)
