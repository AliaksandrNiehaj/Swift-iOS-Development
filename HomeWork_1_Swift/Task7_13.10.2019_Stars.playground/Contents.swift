import UIKit

// Declaration and initialization of variable number with default value - 0. If input argument for triangular(_:) function is above zero (correct), variable simpleNumber will be changed.
var simpleNumber = 0

/*
 Declaration and implementation of triangular(stars: Int) -> Int function, which takes Int type of triangular number and returns simple value of it in Int type.
 */
func triangular(point: Int) -> Int {
    var result = 0
    
    if point > 0 {
        var number = point
        
        while number != 0 {
            result += number
            number -= 1
        }
    }
    return result
}

// Testing
simpleNumber = triangular(point: 0)
print("Simple number is \(simpleNumber).")

simpleNumber = triangular(point: 2)
print("Simple number is \(simpleNumber).")

simpleNumber = triangular(point: 3)
print("Simple number is \(simpleNumber).")

simpleNumber = triangular(point: -10)
print("Simple number is \(simpleNumber).")

simpleNumber = triangular(point: 7)
print("Simple number is \(simpleNumber).")
