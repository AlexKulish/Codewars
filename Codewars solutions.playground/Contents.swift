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

