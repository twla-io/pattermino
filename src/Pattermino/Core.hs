module Pattermino.Core
  ( Orientation(..)
  , Rotation(..)
  , Chirality(..)
  ) where

-- | Orientation for straight shapes (horizontal or vertical)
data Orientation = H | V
  deriving (Show, Eq, Ord, Enum, Bounded)

-- | Rotation in degrees, CCW by mathematical convention
data Rotation = CCW0 | CCW90 | CCW180 | CCW270
  deriving (Show, Eq, Ord, Enum, Bounded)

-- | Chirality for shapes whose mirror image is not reachable by rotation
data Chirality = L | R
  deriving (Show, Eq, Ord, Enum, Bounded)
