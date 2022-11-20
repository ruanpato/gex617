module Basics where

import Data.Bool
import Data.Foldable

-- Receives an int and return this value summed with itself
double :: Int -> Int
double x = x + x

-- Receives an int an return this value quadrupled
quadruple :: Int -> Int
quadruple x = double(x) + double(x)

-- Calculates the circle area
circleArea :: Floating a => a -> a
circleArea r = pi * r^2

-- Returns an abs of integer
vAbs :: Integer -> Integer
vAbs n | n > 0 = n
       | n < 0 = -n

-- Return -1 if n is negative, 0 if n is zero, otherwise returns 1
signal :: Int -> Int
signal n | n < 0 = -1     -- conditional guards |
         | n == 0 = 0     -- conditional guards |
         | otherwise = 1  -- conditional guards default | otherwise

-- Verify if list is empty, or if the first element is an list that is empty
verifyIfListOrFirstListIsEmpty :: Foldable t => [t a] -> Bool
verifyIfListOrFirstListIsEmpty x = (null x) || (null (head x))

-- Verify if list has only one element
lengthEqualOne :: [a] -> Bool
lengthEqualOne x = not (null x) && null (tail x)

-- Fixation Exercise 1: Define a function to calculate the square of twice your argument
quadrupledSquare :: Int -> Int
quadrupledSquare x = (x * 2) ^ 2

-- Fixation Exercise 2: Define a function to calculate the twice of square your argument
squareQuadrupled :: Int -> Int
squareQuadrupled x = (x ^ 2) * 2

-- Fixation Exercise 3: Create a function to receive three grades of an student returns the average.
averageGrades :: Fractional a => a -> a -> a -> a
averageGrades grade1 grade2 grade3 = (grade1 + grade2 + grade3)/3

{- Fixation exercise 4: Is know that the value of a killowatt is 1/5 of minimun wage.
  Define a function to receive the value of minimun wage and the killowatts consumed
  by an residence and calculate the value to be paid with 15% of discount.
-}
calculateKillowatts :: Fractional a => a -> a -> a
calculateKillowatts minimunWage killowatt = (killowatt * (minimunWage / 5)) * 0.85

-- let scope in expression
triangleAreaIn :: Floating a => a -> a -> a -> a
triangleAreaIn a b c = let s = (a + b + c) / 2
  in sqrt (s * (s - a) * (s - b) * (s - c))

-- where scope in function
-- triangleAreaWhere :: Floating genericNum => genericNumA -> genericNumB -> genericNumC -> genericNumReturn
triangleAreaWhere :: Floating a => a -> a -> a -> a
triangleAreaWhere a b c = sqrt (s * (s - a) * (s - b) * (s - c))
  where
    s = (a + b + c) / 2

-- Where with more clausules usage
whereUsage :: Num genericNum => genericNum -> genericNum
whereUsage x = 3 + sumWithCMultipliedBySeven x + sumWithCMultipliedBySeven a + sumWithCMultipliedBySeven b
  where sumWithCMultipliedBySeven x = x + 7 * c
        a = 3 * c
        b = sumWithCMultipliedBySeven 2
        c = x * 20
