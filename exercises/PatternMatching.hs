module PatternMatching where

import ADT

-- Pattern Matching
clientName' :: Client -> String
clientName' client =
    case client of
        OrgGov name                             -> name
        Company name _ _ _                      -> name
        Individual (Person pName pSurname _) _  -> pName ++ " " ++ pSurname
-- clientName' (OrgGov "Test Potato")
-- clientName' (Company "Test Potato" 10 "Manchester" "Trial")
-- clientName' (Individual (Person "Test" "Potato" Male) True)
