//: [Previous](@previous)

import Darwin

/*
 Two sum
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
 */

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        
        for (index, number) in nums.enumerated() {
            // проверяем есть ли у нас по ключу dict[target - number] значение
            if let num = dict[target - number] { // если есть возвращаем значение num и индекс соответствующей итерации
                return [num, index] }
            // если нет записываем ключу number значение индекса
            dict[number] = index
        }
        
        return []
    }
}

let solution = Solution()

solution.twoSum([2, 4, 7, -2], 11)

/*
 Given an integer x, return true if x is palindrome integer.

 An integer is a palindrome when it reads the same backward as forward.

 For example, 121 is a palindrome while 123 is not.
 */

func isPalindrome(_ x: Int) -> Bool {
    
    var y = x
    
    // проверяем если число < 0 или число с остатком деления и не равно 0, возвращаем false (отсекаем отрицательные числа и отсекаем числа, которые заканчиваются на 0, но не равно 0)
    if y < 0 || (y % 10 == 0 && y != 0) {
        return false
    }
    
    var revertedNumber = 0
    
    // пока наше число больше перевернутого делаем блок кода в цикле while
    while y > revertedNumber {
        // даем нашей новой переменной новое значение из умноженного на 10 и прибавления остатка от деления на 10 от числа y
        revertedNumber = revertedNumber * 10 + y % 10
        // уменьшаем число y, деля на 10
        y /= 10
    }
    
    // возвращаем true если 0 или число y равно revertedNumber
    return y == revertedNumber || y == revertedNumber / 10
    
}

isPalindrome(1224)

// Даны римские цифры -> вывести десятичное число

func solution(_ string: String) -> Int {
    // массив тюплов со значениями римских цифр к арабским
    let dict: [(letter: String, quantity: Int)] = [
        ("CM", 900), ("M", 1000), ("CD", 400), ("D", 500),
        ("XC", 90), ("C", 100), ("XL", 40), ("L", 50),
        ("IX", 9), ("X", 10), ("IV", 4), ("V", 5),
        ("I", 1)
    ]
    
    var result = 0
    // стартовый индекс входящей строки
    var pos = string.startIndex
    // пока стартовый индекс не равен конечному индексу выполняем цикл
    while pos != string.endIndex {
        // делаем последовательность от индекса pos до окончания индекса строки
        let subString = string[pos...]
//        print(subString)
        // проверяем можем ли мы извлечь по индексу букву и число из нашего массива тюплов
        guard let (letter, quantity) = dict.first(where: { subString.hasPrefix($0.letter) }) else { return 0 }
        // если да прибавляем к результату значение
        result += quantity
        // сдвигаем наш индекс на количество букв в полученном letter (это может быть как один, так и два и тд)
        pos = string.index(pos, offsetBy: letter.count)
    }
    return result
}
                
solution("CMCD")
solution("XIV")

func maxMultiple(_ d: Int, _ b: Int) -> Int {
    
    var result = 0
    
    if d == 0 {
        return 0
    }
    
    for i in 0...b {
        if i % d == 0 {
            result = i
        }
    }
    
    return result
}

maxMultiple(4, 7)

// Вернуть самое маленькое слово в строке

func find_short(_ str: String) -> Int {
    // создаем массив строк из основной строки с сепоратором пустой строки -> сортируем по возрастанию -> вытягиваем первый элемент из коллекции и количество его знаков
    str.split(separator: " ").sorted { $0.count < $1.count }.first?.count ?? 0
}

find_short("орлорвфы фыоврофырв флыврфлыорв лфлыврфы фыврфы")

// Convert number to reversed array of digits. Given a random non-negative number, you have to return the digits of this number within an array in reverse order.

func digitize(_ num: Int) -> [Int] {
    
    var array: [Int] = []
    let stringNum = String(num)
    
    if num < 0 {
        return array
    }
    
//    print(num)
    
    stringNum.map { char in
        let str = String(char)
        array.append(Int(str) ?? 0)
    }
    
//    for i in stringNum {
//        let str = String(i)
//        array.append(Int(str)!)
//    }

    return array.reversed()
}

digitize(6112123)

/*
 Given three integers a ,b ,c, return the largest number obtained after inserting the following operators and brackets: +, *, ()
 In other words , try every combination of a,b,c with [*+()] , and return the Maximum Obtained
 */

func expressionMatter(_ a: Int, _ b: Int, _ c: Int) -> Int {
    
    var values: [Int] = []

    let one = a * b * c
    let two = a + b + c
    let three = a * (b + c)
    let four = (a + b) * c
    let five = a + b * c
    let six = a * b + c

    for i in 1...6 {
        switch i {
        case 1:
            values.append(one)
        case 2:
            values.append(two)
        case 3:
            values.append(three)
        case 4:
            values.append(four)
        case 5:
            values.append(five)
        default:
            values.append(six)
        }
    }

    return values.sorted().last ?? 0
    
    // return max(one, two, three, four, five, six) - решение в одну строку
    
}

expressionMatter(5, 2, 1)

/*
 The first century spans from the year 1 up to and including the year 100, the second century - from the year 101 up to and including the year 200, etc.
 Given a year, return the century it is in
 */

func century(_ year: Int) -> Int {
    
    if year <= 0 {
        return 0
    }

    switch year {
    case 1...100:
        return 1
    case 101... where year % 100 == 0:
        return year / 100
    default:
        return year / 100 + 1
    }
    
    // return year % 100 == 0 ? (year / 100) : (year / 100 + 1) - решение в одну строку
    
}

century(2001)

/*
 Clock shows h hours, m minutes and s seconds after midnight.
 Your task is to write a function which returns the time since midnight in milliseconds.
 */

func past(_ h: Int, _ m: Int, _ s: Int) -> Int {
    
    if h < 0 || h > 23 || m < 0 || m > 59 || s < 0 || s > 59 {
        return 0
    }
    
    return (s * 1000) + (m * 60000) + (h * 3600000)
}

past(-12, 1, 1)

/*
 Given an array of integers as strings and numbers, return the sum of the array values as if all were numbers.
 Return your answer as a number
 */

func sumMix(_ arr: [Any]) -> Int {
    
    var sum = 0
    
    for value in arr {
        if let str = value as? String,
           let int = Int(str) {
            sum += int
        } else if let int = value as? Int {
            sum += int
        }
    }
    return sum
}

sumMix(["1as", true])

/*
 Complete the function which get an input number n such that n >= 10 and n < 10000, then:
 Sum all the digits of n.
 Subtract the sum from n, and it is your new n.
 If the new n is in the list below return the associated fruit, otherwise return back to task 1
 */

func subtractSum(_ n: Int) -> String {
    
    if n < 10 || n >= 10000 {
        return "Can't find a fruit"
    }
    
    let dict = [1: "kiwi", 2: "pear", 3: "kiwi", 4: "banana", 5: "melon", 6: "banana", 7: "melon",
                8: "pineapple", 9: "apple", 10: "pineapple", 11: "cucumber", 12: "pineapple", 13: "cucumber",
                14: "orange", 15: "grape", 16: "orange", 17: "grape", 18: "apple", 19: "grape", 20: "cherry",
                21: "pear", 22: "cherry", 23: "pear", 24: "kiwi", 25: "banana", 26: "kiwi", 27: "apple",
                28: "melon", 29: "banana", 30: "melon", 31: "pineapple", 32: "melon", 33: "pineapple",
                34: "cucumber", 35: "orange", 36: "apple", 37: "orange", 38: "grape", 39: "orange",
                40: "grape", 41: "cherry", 42: "pear", 43: "cherry", 44: "pear", 45: "apple",
                46: "pear", 47: "kiwi", 48: "banana", 49: "kiwi", 50: "banana", 51: "melon",
                52: "pineapple", 53: "melon", 54: "apple", 55: "cucumber", 56: "pineapple",
                57: "cucumber", 58: "orange", 59: "cucumber", 60: "orange", 61: "grape", 62: "cherry",
                63: "apple", 64: "cherry", 65: "pear", 66: "cherry", 67: "pear", 68: "kiwi", 69: "pear",
                70: "kiwi", 71: "banana", 72: "apple", 73: "banana", 74: "melon", 75: "pineapple",
                76: "melon", 77: "pineapple", 78: "cucumber", 79: "pineapple", 80: "cucumber",
                81: "apple", 82: "grape", 83: "orange", 84: "grape", 85: "cherry", 86: "grape",
                87: "cherry", 88: "pear", 89: "cherry", 90: "apple", 91: "kiwi", 92: "banana",
                93: "kiwi", 94: "banana", 95: "melon", 96: "banana", 97: "melon", 98: "pineapple",
                99: "apple", 100: "pineapple"]
    
    var newN = n

    repeat {
        
        var array: [Int] = []
        var sum = 0
        let nString = String(newN)
        
        nString.map { char in
            let strChar = String(char)
            array.append(Int(strChar) ?? 0)
        }
        
        for i in array {
            sum += i
        }
        
        newN -= sum
        
    } while !dict.keys.contains(newN)
    
    return dict[newN] ?? ""
}

subtractSum(85)

/*
 Given a non-empty array of integers, return the result of multiplying the values together in order
 */

func grow(_ arr: [Int]) -> Int {
    arr.reduce(1) { $0 * $1 }
}

grow([1, 2, 3, 4])

/*
 Удвоение каждого элемента массива
 */

func maps(a : Array<Int>) -> Array<Int> {
    
    a.map { $0 * 2 }
    
//    var array = [Int]()
//
//    for i in a {
//        array.append(i * 2)
//    }
//
//    return array
}

maps(a: [1, 2, 4])

/*
 Return the Nth Even Number
 1 --> 0 (the first even number is 0)
 3 --> 4 (the 3rd even number is 4 (0, 2, 4))
 100 --> 198
 */

func nthEven(_ n: Int) -> Int {
    2 * n - 2
}

nthEven(100)

/*
 Complete the solution so that it reverses the string passed into it.
 */

func reverse(_ str: String) -> String {
    var someString = ""
    str.reversed().map { someString.append($0) }
    return someString

//    String(str.reversed()) - решение в одну строку
}

reverse("world")

/*
 Write a function that accepts an integer n and a string s as parameters, and returns a string of s repeated exactly n times.
 */

func repeatStr(_ n: Int, _ string: String) -> String {
    String(repeating: string, count: n)
}

repeatStr(5, "As")

/*
 Write a method, that will get an integer array as parameter and will process every number from this array.
 Return a new array with processing every number of the input-array like this:
 If the number has an integer square root, take this, otherwise square the number.
 */

func squareOrSquareRoot(_ input: [Int]) -> [Int] {
    
    var array: [Int] = []

    for i in input {
        let number = Int(sqrt(Double(i)))
        if number * number == i {
            array.append(number)
        } else {
            array.append(i * i)
        }
    }

    return array
}

squareOrSquareRoot([4, 2, 9])

/*
 Create a function that gives a personalized greeting. This function takes two parameters: name and owner.
 Use conditionals to return the proper message:
 case    return
 name equals owner    'Hello boss'
 otherwise    'Hello guest'
 */

func great(_ name: String, _ owner: String) -> String {
    name == owner ? "Hello boss" : "Hello guest"
}

great("1", "2")

/*
 This kata is about multiplying a given number by eight if it is an even number and by nine otherwise.
 */

func simpleMultiplication(_ num: Int) -> Int {
    num % 2 == 0 ? num * 8 : num * 9
}

/*
 Complete the function so that it finds the average of the three scores passed to it and returns the letter value associated with that grade
 Numerical Score    Letter Grade
 90 <= score <= 100    'A'
 80 <= score < 90    'B'
 70 <= score < 80    'C'
 60 <= score < 70    'D'
 0 <= score < 60    'F
 */

func getGrade(_ s1: Int, _ s2: Int, _ s3: Int) -> String {
    
    let average = (s1 + s2 + s3) / 3
    
    switch average {
    case 90...100:
        return "A"
    case 80..<90:
        return "B"
    case 70..<80:
        return "C"
    case 60..<70:
        return "D"
    default:
        return "F"
    }
}

/*
 Your goal is to return multiplication table for number that is always an integer from 1 to 10
 */

func multi_table(_ number: Int) -> String {
    
    var multiTable = ""
    
    for num in 1...10 {
        multiTable += "\(num) * \(number) = \(num * number)\(num != 10 ? "\n" : "")"
    }
    
    return multiTable
}

/*
 Given a month as an integer from 1 to 12, return to which quarter of the year it belongs as an integer number.

 For example: month 2 (February), is part of the first quarter; month 6 (June), is part of the second quarter; and month 11 (November), is part of the fourth quarter.
 */

func quarter(of month: Int) -> Int {
    switch month {
    case 1...3:
        return 1
    case 4...6:
        return 2
    case 7...9:
        return 3
    default:
        return 4
    }
}

/*
 Your task is to find the first element of an array that is not consecutive.

 By not consecutive we mean not exactly 1 larger than the previous element of the array.

 E.g. If we have an array [1,2,3,4,6,7,8] then 1 then 2 then 3 then 4 are all consecutive but 6 is not, so that's the first non-consecutive number.
 */


func firstNonConsecutive (_ arr: [Int]) -> Int? {
    
    if arr.isEmpty || arr.count == 1 {
        return nil
    }
    
    let newArray = Set(arr).sorted()
    
    let seq = newArray.first!...newArray.last!
    
    let zipArr = Array(zip(newArray, seq))
    
    return zipArr.first { $0.0 != $0.1 }?.0

}

firstNonConsecutive([1, 3])

/*
 Given a string of digits, you should replace any digit below 5 with '0' and any digit 5 and above with '1'. Return the resulting string
 */

func fakeBin(digits: String) -> String {
    
    var returnString = ""
    
    for digit in digits {
        switch digit {
        case "0"..<"5":
            returnString.append("0")
        default:
            returnString.append("1")
        }
    }
    
    return returnString
    
    // решение в одну строку
    //digits.map { $0 < "5" ? "0" : "1"}.joined()
}

fakeBin(digits: "")

/*
 2 пули на одного дракона. Выиграет ли герой?
 */

func hero(bullets: Int, dragons: Int) -> Bool {
    
    bullets / dragons > 1
    
}

hero(bullets: 5, dragons: 3)

/*
 Complete the square sum function so that it squares each number passed into it and then sums the results together.
 */

func squareSum(_ vals: [Int]) -> Int {
    
    vals.reduce(0) { partialResult, num in
        partialResult + num * num
    }
  
}

squareSum([1, 2, 3, 4])

//: [Next](@next)
