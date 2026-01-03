func sumOfNNumbers(num: Int) -> Int {
    return sumOfNNumbers(num: num, sum: 0)
}

func sumOfNNumbers(num: Int, sum: Int) -> Int {
    guard num > 0 else { return sum }
    return sumOfNNumbers(num: num - 1, sum: sum + num)
}

func runSumTest(input: Int, expected: Int) {
    let result = sumOfNNumbers(num: input)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Input (n):      \(input)")
    print("Expected Value: \(expected)")
    print("Current Value:  \(result)")
    print("Result:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Base Case / Boundary (n = 0)
// The sum of zero numbers should be 0
runSumTest(input: 0, expected: 0)

// 2. Single Number (n = 1)
runSumTest(input: 1, expected: 1)

// 3. Small Integer (n = 5)
// 1 + 2 + 3 + 4 + 5 = 15
runSumTest(input: 5, expected: 15)

// 4. Standard Case (n = 10)
// (10 * 11) / 2 = 55
runSumTest(input: 10, expected: 55)

// 5. Larger Case (n = 100)
runSumTest(input: 100, expected: 5050)