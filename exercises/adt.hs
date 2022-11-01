module ADT where

data Client = OrgGov String -- OrgGov "UFFS"
            | Company String Integer String String -- Company "Name" 2022 "City" "Mission"
            | Individual Person Bool -- Individual (Person "Name" "Surname" Other) False
            deriving (Show, Eq)

data Person = Person String String Gender -- Person "Name" "Surname" Other
            deriving (Show, Eq)

data Gender = Male | Female | Other -- Other
            deriving (Show, Eq)
