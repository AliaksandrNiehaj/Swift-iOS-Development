import UIKit

/*
 Declaration and initialization of checkMatrix(matrix: [[Int]]) -> Bool function, which takes a matrix of [[Int]] type, checks equality of columns and rows.
 It returns true is number of columns and strings are equality. It returns false otherwise.
 */
func checkMatrix(matrix: [[Int]]) -> Bool {
    return matrix.count == matrix[matrix.endIndex-1].count
}

/*
Declaration and initialization of matrixMultiplication(firstMatrix: [[Int]], secondMatrix: [[Int]]) -> [[Int]] function, which takes two matrixes as parameters and returns new matrix as result of matrixes multiplication.
 Inside the function matrixes check. If checking returns false, function returns default matrix.
*/
func matrixMultiplication(firstMatrix: [[Int]], secondMatrix: [[Int]]) -> [[Int]] {
    var matrix3 = [[0, 0], [0, 0]]
    
    if checkMatrix(matrix: firstMatrix) && checkMatrix(matrix: secondMatrix) {
        for i in 0..<firstMatrix.count {
            for j in 0..<firstMatrix.count {
                for k in 0..<firstMatrix.count {
                    matrix3[i][j] += firstMatrix[i][k] * secondMatrix[k][j]
                }
            }
        }
    }
    return matrix3
}

/*
Declaration and initialization of printMatrix(matrix: [[Int]]) function, which takes multiplicated matrix as parameters and returns nothing.
 It prints matrix's values.
*/
func printMatrix(matrix: [[Int]]) {
    for element in matrix {
        print(element)
    }
}

// Testing
let matrix1 = [[2, 4], [6, 8]]
let matrix2 = [[3, 5], [7, 9]]

let multiplicatedMatrix = matrixMultiplication(firstMatrix: matrix1, secondMatrix: matrix2)
printMatrix(matrix: multiplicatedMatrix)
