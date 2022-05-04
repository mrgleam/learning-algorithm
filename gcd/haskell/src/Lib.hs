module Lib
    ( someFunc,
      gcd'
    ) where

gcd' :: Int -> Int -> Int
gcd' 0 y = abs y
gcd' x 0 = abs x
gcd' x y = case divisors a b of
        [] -> -1
        (x:y) -> x
    where a = abs x
          b = abs y

divisors :: Int -> Int -> [Int]
divisors x y =  filter (\z -> (mod x z + mod y z) == 0) (reverse [1..a])
    where a = min x y

someFunc :: IO ()
someFunc = putStrLn "someFunc"
