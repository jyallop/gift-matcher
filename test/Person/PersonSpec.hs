module Person.PersonSpec (spec) where

import Test.Hspec
import Person.Person
import qualified Data.Map as Map
import Data.Set


spec :: Spec
spec = do
  describe "build empty recipient" $ do
    it "tests people who cannot give to one another" $ do
        canGive ((makePerson "Callie" ["Law", "Blake"]), (makePerson "Tucker" ["Blake"])) `shouldBe` False

    it "Jonathon and Cody can give to one another" $ do
        canGive ((makePerson "Jonathon" ["Yallop"]), (makePerson "Cody" ["Law", "Boone"])) `shouldBe` True

    it "Cody and Callie shouldn't be able to give" $ do
        canGive ((makePerson "Cody" ["Law", "Boone"]), (makePerson "Callie" ["Law", "Blake"])) `shouldBe` False

    it "Kendell and Callie should be able to give" $ do
        canGive ((makePerson "Kendell" ["Marine", "Peterson"]), (makePerson "Callie" ["Law", "Blake"])) `shouldBe` True

    it "Kendell and Kinsey shouldn't be able to give to one another" $ do
        canGive ((makePerson "Kendell" ["Marine", "Peterson"]), (makePerson "Kinsey" ["Marine"])) `shouldBe` False
