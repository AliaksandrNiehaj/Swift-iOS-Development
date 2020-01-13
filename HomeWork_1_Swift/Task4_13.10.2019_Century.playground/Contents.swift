import UIKit

// Declaring and initialization of constant yearsInCentury - quantity years in one century
let yearsInCentury = 100

/*
 Declaration and implementation of determineCentury(_ year: Int) -> Int, which takes year as parameter of Int type and returns century as Int type.
 If division by % of year into yearsInCentury != 0, we have to add 1, because data after point will be deleted. For example: 1999 year / 100 = 19.99, but it will return as Int type with value 19. To get correct century need add one: 19 + 1 = 20.
 */
func determineCentury(_ year: Int) -> Int {
    var result = 0
    if year > 0 {
        let flag = year % yearsInCentury == 0
        result = flag ? (year / yearsInCentury) : (year / yearsInCentury + 1)
    }
    return result
}

// Declaration and implementation of printResult(_ year: Int, _ century: Int), which prints result of program execution.
func printResult(_ year: Int, _ century: Int) {
    print("Year is \(year), century is \(century).")
}


// Testing
var year = 1
var century = determineCentury(year)
printResult(year, century)

year = 1457
century = determineCentury(year)
printResult(year, century)

year = 1999
century = determineCentury(year)
printResult(year, century)

year = 700
century = determineCentury(year)
printResult(year, century)

year = 2019
century = determineCentury(year)
printResult(year, century)
