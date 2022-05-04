import Test.Hspec
import Lib

main :: IO ()
main = hspec $ do
    describe "gcd'" $ do
        it "return y when input 0, y" $ do
            gcd' 0 5 `shouldBe` 5

        it "return x when input x, 0" $ do
            gcd' 5 0 `shouldBe` 5

        it "return 1 when input 1, 1" $ do
            gcd' 1 1 `shouldBe` 1

        it "return 14 when input 56, 42" $ do
            gcd' 56 42 `shouldBe` 14

        it "return 18 when input 461952, 116298" $ do
            gcd' 461952 116298 `shouldBe` 18

        it "return 32 when input 7966496, 314080416" $ do
            gcd' 7966496 314080416 `shouldBe` 32

        it "return 526 when input 24826148, 45296490" $ do
            gcd' 24826148 45296490 `shouldBe` 526

    describe "gcd''" $ do
        it "return y when input 0, y" $ do
            gcd'' 0 5 `shouldBe` 5

        it "return x when input x, 0" $ do
            gcd'' 5 0 `shouldBe` 5

        it "return 1 when input 1, 1" $ do
            gcd'' 1 1 `shouldBe` 1

        it "return 14 when input 56, 42" $ do
            gcd'' 56 42 `shouldBe` 14

        it "return 18 when input 461952, 116298" $ do
            gcd'' 461952 116298 `shouldBe` 18

        it "return 32 when input 7966496, 314080416" $ do
            gcd'' 7966496 314080416 `shouldBe` 32

        it "return 526 when input 24826148, 45296490" $ do
            gcd'' 24826148 45296490 `shouldBe` 526
