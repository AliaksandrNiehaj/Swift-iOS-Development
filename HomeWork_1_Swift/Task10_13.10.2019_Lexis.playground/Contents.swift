import UIKit

/*
 Declaration and implementation of sortSubstringsLexicographically(stringArray: [String], subStringArray: [String]) -> [String], which takes two arrays of String type ([String]):
 stringArray - array contains full lines
 subStringArray - array of substrings
 Inside the functions temporary set creates and gets name temporarySet. It contains nothing.
 If any array or arrays isn't empty, loops for execute and insert temporarySet.
 if any array or arrays is empty, function just returns temporarySet (without addition of elements).
 Function returns lexicographically sorted array of String type ([String]).
 */
func sortSubstringsLexicographically(stringArray: [String], subStringArray: [String]) -> [String] {
    
    var temporarySet: Set<String> = Set()
    
    if !stringArray.isEmpty && !subStringArray.isEmpty {
        
        for string in stringArray {
            for sub in subStringArray {
                if string.contains(sub) { temporarySet.insert(sub) }
            }
        }
    }
    return temporarySet.sorted()
}

/*
Declaration and implementation of printSortedArray(array: [String]), which takes array of String type ([String]) and returns nothing.
 If array is empty, appropriate message prints. If array isn't empty, function prints all elements of array.
*/
func printSortedArray(array: [String]) {
    
    if array.isEmpty { print("Sorted array hasn't elements.\n") }
    else {
        print("Sorted array contains:")
        for element in array {
            print(element)
        }
    }
}

// Testing
/*
 variable a1 stores array of substrings
 constant a2 stores array of strings
 variable r gets result of sortSubstringsLexicographically(_:_:) function and displayed by printSortedArray() function
 */
var a1: [String] = []
let a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
var r = sortSubstringsLexicographically(stringArray: a2, subStringArray: a1)
printSortedArray(array: r)

a1 = ["tarp", "mice", "bull"]
r = sortSubstringsLexicographically(stringArray: a2, subStringArray: a1)
printSortedArray(array: r)

a1 = ["arp", "live", "strong"]
r = sortSubstringsLexicographically(stringArray: a2, subStringArray: a1)
printSortedArray(array: r)
