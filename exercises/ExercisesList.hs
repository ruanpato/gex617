module ExercisesList where

import Data.Bool

-- Ex 1
salaryCalculate :: Fractional a => a -> a
salaryCalculate salary = salary*1.1 - salary*0.07

-- Ex 2
triangle :: Double -> Double -> Double -> Bool
triangle x y z  | x + y > z = True
                | x + z > y = True
                | y + z > x = True
                | otherwise = False

-- Ex 3
averageGrades :: Double -> Double -> Double -> Double
averageGrades laboratoryGrade semesterExam finalExam = laboratoryGrade*0.2 + semesterExam*0.3 + finalExam * 0.5

studentGradeAsConcept :: Double -> Double -> Double -> Char
studentGradeAsConcept laboratoryGrade semesterExam finalExam    | grade >= 8 && grade <= 10 = 'A'
                                                                | grade >= 7 = 'B'
                                                                | grade >= 6 = 'C'
                                                                | grade >= 5 = 'D'
                                                                | otherwise = 'E'
    where
        grade = averageGrades laboratoryGrade semesterExam finalExam

-- Ex 24
type Contact = (String, String)
contacts :: [Contact]
contacts = [("Samuel", "1111"), ("Maria", "2222"), ("Sandra", "3333")]
filterContactsNames :: [Contact] -> String -> [Contact]
filterContactsNames list specificName = filter (\(contactName, contactId) -> contactName == specificName) list
