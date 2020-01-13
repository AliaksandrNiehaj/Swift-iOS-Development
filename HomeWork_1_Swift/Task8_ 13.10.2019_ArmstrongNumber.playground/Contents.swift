import UIKit

// Declaration and initialization of type alias for readability
typealias DigitAndPower = (array: [Int], power: Int)

/*
 Declaration and implementation of getDigitsAndPower(number: Int) -> DigitAndPower, which takes value of Int type as parameter and returns array of individual values of Int type by first and power info by second.
 */
func getDigitsAndPower(number: Int) -> DigitAndPower {
    var temporaryArray: [Int] = []
    var temp = number
    var power = 1
    
    if temp < 10 && temp >= 0 {
        temporaryArray.append(temp)
    } else {
        while temp > 10 {
            temporaryArray.append(temp % 10)
            temp /= 10
            if temp < 10 { temporaryArray.append(temp) }
        }
        power = temporaryArray.count
    }
    
    return (temporaryArray, power)
}

/*
Declaration and implementation of getNumber(tuple: DigitAndPower) -> Int, which takes tuple returned from getDigitAndPower(_:) function and after processing returns value of Int type.
*/
func getNumber(tuple: DigitAndPower) -> Int {
    var sum: Double = 0
    for element in tuple.array {
        sum += pow(Double(element), Double(tuple.power))
    }
    
    return Int(sum)
}

/*
Declaration and implementation of isArmstrongNumber(sourceValue: Int) -> Bool, which takes source value of Int type as parameter. Inside the function is going on processing of input information by functions and finding compared value. The function returns result of comparing input parameter and received value and returns true or false.
*/
func isArmstrongNumber(sourceValue: Int) -> Bool {
    let temporaryTuple = getDigitsAndPower(number: sourceValue)
    let receivedValue = getNumber(tuple: temporaryTuple)
    
    return sourceValue == receivedValue
}

// Testing
let isArmstrongFirst = isArmstrongNumber(sourceValue: 0)
let isArmstrongSecond = isArmstrongNumber(sourceValue: 1)
let isArmstrongThird = isArmstrongNumber(sourceValue: 153)
let isArmstrongFourth = isArmstrongNumber(sourceValue: 777)
let isArmstrongFifth = isArmstrongNumber(sourceValue: 306)
let isArmstrongSix = isArmstrongNumber(sourceValue: 407)
let isArmstrongSeventh = isArmstrongNumber(sourceValue: 1634)
