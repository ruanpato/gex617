-- Pattern Match to convert nat2integer
module NAT where

-- data NAT = Zero | Suc Zero | Suc Suc
data NAT = Zero | Suc NAT
    deriving (Show, Eq)

-- natToInteger (Suc (Suc (Suc (Zero)))) == 3
natToInteger :: NAT -> Integer
natToInteger natural =
    case natural of
        Suc sucNat -> 1 + natToInteger sucNat
        Zero -> 0

-- integerToNat 20 == Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc Zero)))))))))))))))))))
integerToNat :: Integer -> NAT
integerToNat 0 = Zero
integerToNat integer = Suc (integerToNat (integer - 1))

-- natAdd (Suc (Suc Zero)) (Suc Zero) == Suc (Suc (Suc Zero))
natAdd :: NAT -> NAT -> NAT
natAdd firstNatural secondNatural =
    case firstNatural of
        Suc sucFirst -> Suc (natAdd sucFirst secondNatural)
        Zero -> secondNatural
(+++) :: NAT -> NAT -> NAT
firstNatural +++ secondNatural = (natAdd firstNatural secondNatural)

-- natSub (Suc (Suc Zero)) (Suc (Suc (Suc Zero))) == Zero
natSub :: NAT -> NAT -> NAT
natSub firstNatural secondNatural =
    case secondNatural of
        Suc sucSecond -> (natSub (removeOneSuc firstNatural) (removeOneSuc secondNatural))
        Zero -> firstNatural
(-=-) :: NAT -> NAT -> NAT
firstNatural -=- secondNatural = (natSub firstNatural secondNatural)

-- removeOneSuc (Suc Zero) == Zero
removeOneSuc :: NAT -> NAT
removeOneSuc natural =
    case natural of
        Suc sucNat -> sucNat
        Zero -> Zero

-- natMul (Suc (Suc Zero)) (Suc (Suc Zero))
natMul :: NAT -> NAT -> NAT
natMul firstNatural secondNatural =
    case firstNatural of
        Zero -> Zero
        Suc Zero -> secondNatural
        Suc sucFirst -> (natAdd secondNatural (natMul sucFirst secondNatural))
(***) :: NAT -> NAT -> NAT
firstNatural *** secondNatural = (natMul firstNatural secondNatural)

-- natDiv (Suc (Suc Zero)) (Suc (Suc Zero))
-- natDiv :: NAT -> NAT -> NAT
-- natDiv firstNatural Zero = Zero
-- natDiv firstNatural (Suc Zero) = firstNatural
-- natDiv firstNatural secondNatural =
--     case firstNatural of
--         Zero -> Zero
--         Suc sucFirst -> (natDiv (natSub firstNatural secondNatural) secondNatural)

-- natToInteger (natPot (Suc (Suc Zero)) (Suc (Suc (Suc (Suc Zero))))) == Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc Zero)))))))))))))))
natPot :: NAT -> NAT -> NAT
natPot firstNatural secondNatural =
    case secondNatural of
        Zero -> Suc Zero
        Suc Zero -> firstNatural
        Suc sucSecond -> (natMul firstNatural (natPot firstNatural sucSecond))
(^^^) :: NAT -> NAT -> NAT
firstNatural ^^^ secondNatural = (natPot firstNatural secondNatural)

-- natBiggerThan Zero (Suc Zero) == False
natBiggerThan :: NAT -> NAT -> Bool
natBiggerThan firstNatural secondNatural =
    case firstNatural of
        Zero -> False
        Suc Zero -> (firstBiggerThanSecond firstNatural secondNatural)
        Suc sucFirst -> (natBiggerThan (natSub firstNatural oneInNat) (natSub secondNatural oneInNat))
(>>>) :: NAT -> NAT -> Bool
firstNatural >>> secondNatural = (natBiggerThan firstNatural secondNatural)

-- natLessThan Zero (Suc Zero == True
natLessThan :: NAT -> NAT -> Bool
natLessThan firstNatural secondNatural = natBiggerThan secondNatural firstNatural
(<<<) :: NAT -> NAT -> Bool
firstNatural <<< secondNatural = (natLessThan firstNatural secondNatural)

firstBiggerThanSecond :: NAT -> NAT -> Bool
firstBiggerThanSecond first second = not (natIsZero first) && natIsZero second

oneInNat :: NAT
oneInNat = Suc Zero

natIsZero :: NAT -> Bool
natIsZero Zero = True
natIsZero natural = False
