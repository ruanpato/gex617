module FirstExam where

type Registration = Integer
type Name = String
type Grades = (Double, Double, Double)
type Student = (Registration, Name, Grades)
type ClassStudents = [ Student ]

type StudentAverageList = (Name, Double)
type ClassStudentsAverageList = [StudentAverageList]

q1 = case not (1 /= 2) of 
    True -> "inicio"
    False -> "fim"

q2 = if 2 == 2 then "abc" else ['d', 'e', 'f']

-- q3 = let pot_dois x | x <= 0 = 1
--                     | otherwise = 2 * pot_dois (x - 1)
--     in pot_dois 7

q4 = filter (not . odd . (+3)) [5, 6 ,7, 8, 9]

q5 = sum (map (logBase 4) [16, 256, 4096])

sampleData :: ClassStudents
sampleData = [(1, "Peter", (5.0, 7.5, 4.5)), (2, "Mary", (9.0, 8.0, 10.0)), (3, "John", (3.0, 7.0, 4.5)), (4, "Paul", (7.0, 5.0, 9.5)), (5, "Annah", (8.5, 8.0, 9.0))]


sampleData2 :: ClassStudents
sampleData2 = [(1, "Peter", (8.0, 7.5, 4.5)), (2, "Mary", (9.0, 8.0, 10.0)), (3, "John", (3.0, 7.0, 4.5)), (4, "Paul", (7.0, 5.0, 9.5)), (5, "Annah", (8.5, 8.0, 9.0))]

-- a) Write an function classAverage :: ClassStudents -> Double, that will receive an student Class
--and will return the geral average.
--
-- b) Use an High order to return only the students with average above 6.0
--
-- c) Create an function that receive two student classes and return the one with biggest geral average
-- 
-- d) Create an function that receive an student class and return the student and their average in a list like [("Peter", 5.5), ("Mary", 9.0), ...]

-- Calculate Grades Average
calculateGradesAverageWithLambda :: Grades -> Double
calculateGradesAverageWithLambda grades = ((\(firstGrade, secondGrade, thirdGrade) -> (firstGrade+secondGrade+thirdGrade)) grades) / 3

-- Calculate Grades Average
calculateGradesAverageWithPatternMatching :: Grades -> Double
calculateGradesAverageWithPatternMatching grades = 
    case grades of
        (firstGrade, secondGrade, thirdGrade) -> (firstGrade + secondGrade + thirdGrade) / 3

returnStudentAverageList :: Student -> StudentAverageList
returnStudentAverageList student =
    case student of
        (_, name, (firstGrade, secondGrade, thirdGrade)) -> (name, (calculateGradesAverageWithPatternMatching (firstGrade, secondGrade, thirdGrade)))

returnStudentAverage :: Student -> Double
returnStudentAverage student =
    case student of
        (_, _, (firstGrade, secondGrade, thirdGrade)) -> (calculateGradesAverageWithPatternMatching (firstGrade, secondGrade, thirdGrade))

returnStudentsAverage :: ClassStudents -> ClassStudentsAverageList
returnStudentsAverage students = map returnStudentAverageList students

returnStudentsGradesAveragesSum :: ClassStudents -> Double
returnStudentsGradesAveragesSum students = if null students
    then 0
    else (returnStudentAverage (head students)) + returnStudentsGradesAveragesSum (tail students)

returnStudentsAmount :: ClassStudents -> Double
returnStudentsAmount students = if null students
    then 0
    else 1 + returnStudentsAmount (tail students)

returnClassAverage :: ClassStudents -> Double
returnClassAverage students = (returnStudentsGradesAveragesSum students) / (returnStudentsAmount students)

returnApprovedStudents :: ClassStudents -> ClassStudents
returnApprovedStudents students = filter (\x -> (returnStudentAverage x) > 6) students

returnClassWithBiggestAverage :: ClassStudents -> ClassStudents -> ClassStudents
returnClassWithBiggestAverage classA classB = if classBAverage > classAAverage
    then classB
    else classA
    where
        classAAverage = returnClassAverage classA
        classBAverage = returnClassAverage classB
