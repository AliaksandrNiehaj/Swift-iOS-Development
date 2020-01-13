import UIKit

/*
Declaration and initialization of four constants:
 childFloorHeight - height of floor where plays child
 motherFloorHeight - height of floor where is child's mother
 bounce - ball rebound coefficient
 areFloorsValid - condition which returns true if child's floor above mother's.
 According the task conditions only one constant have to be Float type (motherFloorHeight). Any constants have to be floating point numbers. We can declare childFloorHeight and bounce as Double type and do cast of types further, but it isn't good for performance, because it takes additional processor time.
 */
let childFloorHeight: Float = 17.36
let motherFloorHeight: Float = 5.18
let bounce: Float = 0.7
let areFloorsValid = childFloorHeight > motherFloorHeight

/*
Declaration and initialization of variable "ballCount", which will be one anyway, because fly by the window at least once. It will be changed by result of countBalls(_:_:_:) function
 */
var ballCount = 1

/*
Declaration and intialization of some Bool constants for checking input parameters:
 isChildFloorValid - returns true if child's floor above zero
 isMotherFloorValid - returns true if mother's floor above zero and below child's floor (between)
 isBounceRangeValid - returns true if bounce value in range from zero to one
 */
let isChildFloorValid = childFloorHeight > 0 && areFloorsValid
let isMotherFloorValid = motherFloorHeight > 0 && areFloorsValid
let isBounceValid = bounce > 0 && bounce < 1

/*
 I did example of checking input parameters by using assert, but I've commented out, because it will be other cheking.
 If haven't worked any assert, we can continue programm execution without any analog checks.
 */
/*
 assert(isChildFloorValid, "Child's floor must be above zero and mother's floor. Check, please this conditions.")
 assert(isMotherFloorValid, "Mother's floor must be above zero and below child's floor. Check, please this conditions.")
 assert(isBounceValid, "Bounce must be more than zero and less than one. Check it, please.")
 */

/*
 Declaration and realization of function countBalls(_:_:_:) which counts balls flying by the window.
 Function takes three parameters: childHeight, motherHeight, bounceCoefficient. All parametres have Float type.
 Function returns value of Int type.
 We have to check input parameters, so declare and initialize constant areArgumentsValid which returns true if all conditions are true or false if any condition returns false
 Declaration and initialization of variable maxHeight, which represent actual max ball height after another bounce.
 */
func countBalls(childHeight: Float, motherHeight: Float, bounceCoefficient: Float) -> Int {
    
    let areArgumentsValid = isChildFloorValid && isMotherFloorValid && isBounceValid
    
    if areArgumentsValid {
        
        var maxHeight = childHeight * bounceCoefficient
        while motherHeight < maxHeight {
            ballCount += 2
            maxHeight *= bounceCoefficient
        }
        
    } else { ballCount = -1 }
    
    return ballCount
}

// Assignment of new value to variable "ballCount" after execution of countBalls(_:_:_:) function
ballCount = countBalls(childHeight: childFloorHeight, motherHeight: motherFloorHeight, bounceCoefficient: bounce)

// Printing result
print("Mother can see the ball \(ballCount) times.")
