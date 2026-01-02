import Foundation

// O(d) Time / O(1) Space
func countDigitsByDividing(num: Int) -> Int {
    guard num != 0 else { return 1 }
    var absNum = abs(num)
    var digits = 0
    while absNum != 0 {
        digits += 1
        absNum /= 10
    }
    return digits
}

// O(1) Time / O(1) Space
func countDigitByLog(num: Int) -> Int {
    guard num != 0 else { return 1 }
    let absNum = Double(abs(num))
    return Int(floor(log10(absNum)) + 1)
}

func countDigits(num: Int) -> Int {
    return countDigitByLog(num: num)
}

// Array of test data: (input, expectedValue)
let testCases = [
    (input: 123, expected: 3),
    (input: 0, expected: 1),
    (input: -45, expected: 2),
    (input: 1000, expected: 4),
    (input: 10000, expected: 5),
    (input: 7, expected: 1)
]

print("--- Starting Digit Count Tests ---")

for test in testCases {
    let currentValue = countDigits(num: test.input)
    let isSuccess = (currentValue == test.expected)
    let status = isSuccess ? "PASS ✅" : "FAIL ❌"
    
    print("Input: \(test.input)")
    print("Expected Value: \(test.expected)")
    print("Current Value:  \(currentValue)")
    print("Result:         \(status)")
    print("---------------------------------")
}