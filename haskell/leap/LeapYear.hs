module LeapYear where

isEvenlyDivisible :: Int -> Int -> Bool
isEvenlyDivisible x y = mod x y == 0

isLeapYear :: Int -> Bool
isLeapYear x =
  isEvenlyDivisible x 4 &&
  (not (isEvenlyDivisible x 100) || isEvenlyDivisible x 400)
