import Foundation

// O(d) Time / O(1) Space
func isArmStrong(num: Int) -> Bool {
    guard num > 0 else { return num == 0 }
    let numOfDigits = floor(log10(Double(num))) + 1
    var result = 0
    var numCopy = num
    
    while numCopy != 0 {
        let remainder = numCopy % 10
        let quotient = numCopy / 10
        let valToAdd = pow(Double(remainder), numOfDigits)
        result += Int(valToAdd)
        numCopy = quotient
    }
    
    return result == num
}

func runArmstrongTest(input: Int, expected: Bool) {
    let result = isArmStrong(num: input)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Input: \(input)")
    print("Expected Value: \(expected)")
    print("Current Value:  \(result)")
    print("Result:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Single Digit (All single digits are Armstrong numbers: n^1 = n)
runArmstrongTest(input: 5, expected: true)

// 2. 3-Digit Armstrong Number (3^3 + 7^3 + 1^3 = 27 + 343 + 1 = 371)
runArmstrongTest(input: 371, expected: true)

// 3. 3-Digit Non-Armstrong Number
runArmstrongTest(input: 123, expected: false)

// 4. 4-Digit Armstrong Number (9^4 + 4^4 + 7^4 + 4^4 = 9474)
runArmstrongTest(input: 9474, expected: true)

// 5. Large Non-Armstrong Number
runArmstrongTest(input: 1000, expected: false)

// 6. Another famous 3-digit Armstrong
runArmstrongTest(input: 153, expected: true)