// O(n) Time / O(n) Space
func fact(num: Int) -> Int {
    guard num >= 1 else { return 1 }
    return num * fact(num: num - 1)
}

func runFactorialTest(input: Int, expected: Int) {
    let result = fact(num: input)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Input (n!):     \(input)")
    print("Expected Value: \(expected)")
    print("Current Value:  \(result)")
    print("Result:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Zero Factorial (Mathematical Definition: 0! = 1)
runFactorialTest(input: 0, expected: 1)

// 2. One Factorial (1! = 1)
runFactorialTest(input: 1, expected: 1)

// 3. Small Integer (3! = 3 * 2 * 1)
runFactorialTest(input: 3, expected: 6)

// 4. Standard Case (5! = 5 * 4 * 3 * 2 * 1)
runFactorialTest(input: 5, expected: 120)

// 5. Larger Case (8! = 40,320)
runFactorialTest(input: 8, expected: 40320)