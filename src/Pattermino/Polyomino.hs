module Pattermino.Polyomino
  ( Polyomino(..)
  ) where

import Pattermino.Core

-- | A polyomino shape filled with values of type a.
--
-- Each constructor introduces exactly one new geometric concept:
--
--   Monomino   - single cell,          no orientation, no rotation, no chirality
--   Domino     - 2 cells, straight,    Orientation only
--   LTromino   - 3 cells, L-shaped,    Rotation only
--   OTetromino - 4 cells, square,      neither (fully symmetric)
--   STetromino - 4 cells, S/Z-shaped,  Chirality + Orientation
--   LTetromino - 4 cells, L/J-shaped,  Chirality + Rotation
--
-- Cell labels x, y, z, w follow reading order (left-to-right, top-to-bottom)
-- within the rotated/oriented shape. Rotation names describe shape geometry,
-- not data transformation.
--
-- All rotations are CCW by mathematical convention.

data Polyomino a
  = Monomino a
  | Domino Orientation a a
  | LTromino Rotation a a a
  | OTetromino a a a a
  | STetromino Chirality Orientation a a a a
  | LTetromino Chirality Rotation a a a a
  deriving (Show, Eq)
