module Pattermino.Grid
  ( Grid
  , subGrids
  ) where

import Data.List (tails, transpose)

-- | A grid is a list of rows, each row a list of cells
type Grid a = [[a]]

-- | Generate all sub-grids of a grid, one per possible top-left position
--
-- For each row-suffix (tails), generate all column-shifted suffixes.
-- No explicit recursion - traversal in both dimensions via tails and transpose.
subGrids :: Grid a -> [Grid a]
subGrids g = concatMap colSubGrids (tails g)
  where
    colSubGrids []   = []
    colSubGrids rows = transpose $ map (init . tails) rows
