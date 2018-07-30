let fizzbuzz x = string_of_int x;;
(*
import Control.Monad (mapM_)

fizzbuzz :: (Show a, Integral a) => a -> String
fizzbuzz n = if null s then (show n) else s
  where
    s = (if (n `mod` 3) == 0 then "Fizz" else "") ++ (if (n `mod` 5) == 0 then "Buzz" else "")

main :: IO ()
main = mapM_ putStrLn $ map fizzbuzz [1..100]
*)
