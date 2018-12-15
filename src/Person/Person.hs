module Person.Person where

type Name = String
type Groups = [String]

data Person = Person Name Groups deriving (Show)

makePerson :: String -> [String] -> Person
makePerson x y = Person x y

instance Eq Person where
    (Person name groups) == (Person name2 groups2) = any (\x -> x `elem` groups2) groups

canGive :: Eq a => (a, a) -> Bool
canGive (x, y) = x /= y

cannotGive :: Eq a => (a, a) -> Bool
cannotGive (x, y) = x == y
