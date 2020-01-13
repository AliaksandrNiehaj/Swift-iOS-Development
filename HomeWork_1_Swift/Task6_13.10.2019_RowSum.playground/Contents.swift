import UIKit

/*
 Declaration and implementation of rowSumOddNumbers(_ rowNumber: Int) -> Int, which takes value of Int type with name rowNumber as parameter for row number, and returns summ of all numbers in this row.
 Note: each row contains the number of digits corresponding to its number. The sum of all row digits is number of line in the third degree.
 */
func rowSumOddNumbers(_ rowNumber: Int) -> Int {
    let power: Double = 3
    let result = pow(Double(rowNumber), power)
    return Int(result)
}

//Testing
var rowNumber = 1
print("The sum of \(rowNumber) row is \(rowSumOddNumbers(rowNumber)).")

rowNumber = 2
print("The sum of \(rowNumber) row is \(rowSumOddNumbers(rowNumber)).")

rowNumber = 5
print("The sum of \(rowNumber) row is \(rowSumOddNumbers(rowNumber)).")

rowNumber = 15
print("The sum of \(rowNumber) row is \(rowSumOddNumbers(rowNumber)).")

rowNumber = 407
print("The sum of \(rowNumber) row is \(rowSumOddNumbers(rowNumber)).")
