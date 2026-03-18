# Pattermino

Polyomino pattern matching on grids — a journey from a toddler's puzzle to type-driven design in Haskell.

> A journey from a toddler's puzzle to type-driven design in Haskell.

## What is it?

Pattermino models polyomino shapes as typed patterns and matches them against grids using Haskell's algebraic data types and pattern matching.

The key insight: a toddler's sticker puzzle and a Haskell type system are solving the same problem.

## The Model

Three orthogonal geometric dimensions:

```haskell
data Orientation = H | V                         -- for straight shapes
data Rotation    = CCW0 | CCW90 | CCW180 | CCW270  -- CCW by mathematical convention
data Chirality   = L | R                         -- for shapes whose mirror is not reachable by rotation
```

Six polyomino constructors — a minimal, orthogonal set where each introduces exactly one new concept:

```haskell
data Polyomino a
  = Monomino a                               -- nothing
  | Domino Orientation a a                   -- Orientation
  | LTromino Rotation a a a                  -- Rotation
  | OTetromino a a a a                       -- neither (fully symmetric)
  | STetromino Chirality Orientation a a a a -- Chirality + Orientation
  | LTetromino Chirality Rotation a a a a    -- Chirality + Rotation
```

## Pattern Matching

Geometry encoded directly as structure — comments show the 2D layout:

```haskell
-- x .
-- y z
matchesTopLeft (LTromino CCW0 x y z) ((x':_):(y':z':_):_) = x == x' && y == y' && z == z'

-- x y
-- z w
matchesTopLeft (OTetromino x y z w) ((x':y':_):(z':w':_):_) = x == x' && y == y' && z == z' && w == w'
```

## Grid Traversal

Clean separation between matching and traversal:

```haskell
subGrids :: Grid a -> [Grid a]
subGrids g = concatMap colSubGrids (tails g)
  where
    colSubGrids []   = []
    colSubGrids rows = transpose $ map (init . tails) rows

contains :: Eq a => Polyomino a -> Grid a -> Bool
contains p g = any (matchesTopLeft p) (subGrids g)
```

## The Toddler Puzzle

```haskell
data Sticker = Leaf | Pomegranate | Berries | Pear
  deriving (Show, Eq)

p1 :: Polyomino Sticker
p1 = LTetromino R CCW270 Leaf Berries Pomegranate Berries

contains p1 stickerGrid  -- True
```

## Building

```bash
cabal build
cabal test
cabal run sticker-example
```


