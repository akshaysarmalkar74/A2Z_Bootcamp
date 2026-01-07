import Foundation

// O(LogN) Time / O(1) Space
func nThRoot(order: Int, num: Int) -> Int {
    guard num != 0 else { return 0 }
    let target = Double(num)
    var left = 1
    var right = num
    
    while left <= right {
        let midNum = left + ((right - left) / 2)
        let poweredVal = pow(Double(midNum), Double(order))
        
        if poweredVal == target {
            return midNum
        } else if poweredVal < target {
            left = midNum + 1
        } else {
            right = midNum - 1
        }
    }
    
    return -1
}

func runNthRootStrictTest(order: Int, num: Int, expected: Int) {
    let result = nThRoot(order: order, num: num)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Num: \(num), Order: \(order)")
    print("Expected: \(expected)")
    print("Actual:   \(result)")
    print("Status:   \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Perfect Cube (Success)
// 2^3 = 8
runNthRootStrictTest(order: 3, num: 8, expected: 2)

// 2. Not a Perfect Cube (Failure)
// 2^3 = 8, 3^3 = 27. 20 is in between.
runNthRootStrictTest(order: 3, num: 20, expected: -1)

// 3. Perfect 4th Root (Success)
// 3^4 = 81
runNthRootStrictTest(order: 4, num: 81, expected: 3)

// 4. Large Perfect Root (Success)
// 2^10 = 1024
runNthRootStrictTest(order: 10, num: 1024, expected: 2)

// 5. Not a Perfect 10th Root (Failure)
runNthRootStrictTest(order: 10, num: 1025, expected: -1)

// 6. Base Case (1 is always a perfect root)
runNthRootStrictTest(order: 5, num: 1, expected: 1)

// 7. Small number, Order too high
// No integer > 1 raised to power 3 can be 5
runNthRootStrictTest(order: 3, num: 5, expected: -1)