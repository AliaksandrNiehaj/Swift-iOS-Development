import UIKit

/*
 Declaration and realization of determineSum(array: [Any]) -> Int function. Function takes the [Any] array as parameter and return Int as result of addition of all array's elements.
 Inside the function variable sum creates and initializes by zero (default value).
 If array is empty value -1 will assign to sum variable and returned as result.
 Inside for loop is going on cast of types, optional binding and changing the sum variable.
 */
func determineSum(array: [Any]) -> Int {
    var sum = 0
    
    if array.isEmpty {
        sum = -1
    }
    
    for element in array {
        if let intNumber = element as? Int {
            sum += intNumber
        }
        if let stringNumber = element as? String {
            if let intNumber = Int(stringNumber) {
                sum += intNumber }
        }
    }
    return sum
}

// Method printResult(result: Int) returns void (). It print info about result of addition of all array's elements - sum only.
func printResult(result: Int) {
    print("Result of is: \(result)")
}

// Creating three different arrays of [Any] type
let array1: [Any] = ["3", 6, 6, 0, "5", 8, 5, "6", 2, "0"]
let array2: [Any] = ["3s", "6l", 6, "0x", "5y", "d8", "0u5", "6", 2, "0"]
let emptyArray: [Any] = []


// Addition of all elements of array1 and printing result.
var arrayFirstResult = determineSum(array: array1)
printResult(result: arrayFirstResult)

// Addition of all elements of array2 and printing result.
var arraySecondResult = determineSum(array: array2)
printResult(result: arraySecondResult)

// Addition of all elements of emptyArray and printing result.
var emptyArrayResult = determineSum(array: emptyArray)
printResult(result: emptyArrayResult)
