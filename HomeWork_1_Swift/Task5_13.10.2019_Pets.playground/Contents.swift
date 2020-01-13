import UIKit

/*
 Declaration and initialization of five constants:
 firstYear - the number of years the pet is in the first year of life.
 secondYear - the number of years the pet is in the second year of life.
 twoYears - general number of pet's years for the 2 human years.
 nextCatYear - the number of cat's years in the next years of life after two real years.
 nextDogYear - the number of dog's years in the next years of life after two real years.
 */
let firstYear = 15
let secondYear = 9
let twoYears = firstYear + secondYear
let nextCatYear = 4
let nextDogYear = 5

/*
 Declaration and implementation of determineAnimalAge(age: Int, nextYear: Int) -> Int, which takes real pet's age and next years of life as parameters and return real age (human) in Int type.
 Inside the function constant threeYears has created and initialized by sum of twoYears and nextYear constants to help determine bounce of range in third case.
 */
func determineAnimalAge(age: Int, nextYear: Int) -> Int {
    
    let threeYears = twoYears + nextYear
    var counter = 0
    
    switch age {
    case 0..<firstYear: break
    case firstYear..<twoYears: counter = 1
    case twoYears..<threeYears: counter = 2
    case threeYears...: counter = 2 + (age - twoYears) / nextYear
    default: counter = age <= 0 ? -1 : counter
    }
    
    return counter
}

/*
 Declaration and implementation of fillTuple(catAge: Int, dogAge: Int) -> (Int, Int), which takes animal's age as parameters and return tuple of real ages (human) in Int type.
 Inside the function determineAnimalAge(_:_:) function works.
 */
func fillTuple(catAge: Int, dogAge: Int) -> (Int, Int) {
    let cat = determineAnimalAge(age: catAge, nextYear: nextCatYear)
    let dog = determineAnimalAge(age: dogAge, nextYear: nextDogYear)
    let tuple = (cat, dog)
    return tuple
}

/*
 Declaration and implementation of printResults(tuple:(cat: Int, dog: Int)), which takes tuple with animal's age as parameters and return nothing.
 It only prints result.
 */
func printResults(tuple:(cat: Int, dog: Int)) {
    print("Real age of cat is \(tuple.cat) years, real age of dog is \(tuple.dog) years.")
}


// Testing
let catAge = 48
let dogAge = 79

let realPetsAges = fillTuple(catAge: catAge, dogAge: dogAge)
printResults(tuple: realPetsAges)
