-- Recursion algorithms samples
module Recursion where

-- Return the factorial of n - with Pattern Matching
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Recursion to multiply an value
mul :: Int -> Int -> Int
mul firstValue secondValue
    | secondValue == 0  = 0
    | secondValue > 0   = firstValue + mul firstValue (secondValue - 1)

-- Get list legth recursively
lengthList :: Num p => [a] -> p
lengthList list = if null list
    then 0
    else 1 + lengthList (tail list)

-- Get list length recursively with pattern matching
lengthList' :: Num p => [a] -> p
lengthList' [] = 0
lengthList' (x:xs) = 1 + lengthList' xs

--- Pattern Matching concat list
(++++) :: [a] -> [a] -> [a]
[] ++++ secondList = secondList
(head:tail) ++++ secondList = head : (tail ++++ secondList)

reverse'' :: [a] -> [a]
reverse'' [] = []
reverse'' (head:tail) = reverse'' tail ++++ [head]
