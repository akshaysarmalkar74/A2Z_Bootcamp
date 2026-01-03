// O(n) Time / O(n) Space
func countFrequency(nums: [Int]) -> [Int: Int] {
    var result = [Int: Int]()
    for num in nums {
        result[num] = result[num, default: 0] + 1
    }
    return result
}

func runFrequencyTest(input: [Int], expected: [Int: Int]) {
    let result = countFrequency(nums: input)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Input:          \(input)")
    print("Expected Value: \(expected)")
    print("Current Value:  \(result)")
    print("Result:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Case: Multiple repeats
runFrequencyTest(input: [1, 2, 2, 3, 3, 3], expected: [1: 1, 2: 2, 3: 3])

// 2. No Repeats: All elements unique
runFrequencyTest(input: [10, 20, 30], expected: [10: 1, 20: 1, 30: 1])

// 3. All Same: Every element is the same
runFrequencyTest(input: [5, 5, 5, 5], expected: [5: 4])

// 4. Empty Array
runFrequencyTest(input: [], expected: [:])

// 5. Negative Numbers
runFrequencyTest(input: [-1, -1, 0, 1], expected: [-1: 2, 0: 1, 1: 1])