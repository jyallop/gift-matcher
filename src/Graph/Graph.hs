module Graph.Graph where

import Data.Set

data Edges a = Edges Map String a

data Node = (Status, Set String)

data Status =
  Free
  | InMatch

data Match = Set (String, String)

buildMatch :: Edges -> Match
buildMatch = undefined

