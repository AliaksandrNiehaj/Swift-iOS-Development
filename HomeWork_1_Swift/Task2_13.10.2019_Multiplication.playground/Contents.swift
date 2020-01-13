import UIKit

// Declaration and initialization of two constants, which are multipliers for even and odd numbers.
let evenMultiplier = 8
let oddMultiplier = 9

/*
 Declaration and realization of isValidValue(checkingNumber: Int) -> Bool function, which checks input value of Int type and returns Bool value.
 Function returns true if input value > 0. It returns false in other cases.
 */
func isValidValue(checkingNumber: Int) -> Bool {
    return checkingNumber > 0 ? true : false
}

/*
Declaration and realization of multiplication(number: Int, forEven: Int = evenMultiplier, forOdd: Int = oddMultiplier) -> Int? function, which takes input values of Int type and returns Optional value of Int (Int?).
 Input parameters:
 number - takes digit of Int type as argument.
 forEven - takes Int type argument for multiply even number. Default value is evenMultiplier.
 forOdd - takes Int type argument for multiply odd number. Default value is oddMultiplier.
 Output parameter: Int? as result of function execution.
*/
func multiplication(number: Int, forEven: Int = evenMultiplier, forOdd: Int = oddMultiplier) -> Int? {
    
    var result: Int! = nil
    
    let isValidNumber = isValidValue(checkingNumber: number) ? true : false
    if isValidNumber {
        let isEven = number % 2 == 0
        let evenMultiplication = number * forEven
        let oddMultiplication = number * forOdd
        result = isEven ? evenMultiplication : oddMultiplication
    }
    return result
}

/*
Declaration and realization of printResult(resultNumber: Int?) function, which takes input values of Int? type and returns void (nothing).
 Function uses optional binding for printing result of operation.
*/
func printMuiltiplicationResult(resultNumber: Int?) {
    if let value = resultNumber {
        print("Result is \(value).")
    } else {
        print("Multiplication won't execute: number doesn't valid the task conditions.")
    }
}

// Testing in various ways
let even = 4
let odd = 7
let zero = 0

let evenResult = multiplication(number: even)
let oddResult = multiplication(number: odd)
printMuiltiplicationResult(resultNumber: evenResult)
printMuiltiplicationResult(resultNumber: oddResult)

printMuiltiplicationResult(resultNumber: multiplication(number: zero))
printMuiltiplicationResult(resultNumber: multiplication(number: -17))
