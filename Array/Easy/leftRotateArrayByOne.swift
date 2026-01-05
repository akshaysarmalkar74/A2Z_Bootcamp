// O(n) Time / O(1) Space
func leftRotateArrayByOne(nums: inout [Int]) {
    guard nums.count > 1 else { return }
    let firstNum = nums[0]
    
    for idx in stride(from: 0, to: nums.count - 1, by: 1) {
        nums[idx] = nums[idx + 1]
    }
    
    nums[nums.count - 1] = firstNum
}

func runLeftRotateTest(input: [Int], expected: [Int]) {
    var arrayToRotate = input
    leftRotateArrayByOne(nums: &arrayToRotate)
    
    let isSuccess = (arrayToRotate == expected)
    let status = isSuccess ? "PASS ✅" : "FAIL ❌"
    
    print("Input:          \(input)")
    print("Expected Value: \(expected)")
    print("Current Value:  \(arrayToRotate)")
    print("Result:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Case
runLeftRotateTest(input: [1, 2, 3, 4, 5], expected: [2, 3, 4, 5, 1])

// 2. Two Elements (Swaps positions)
runLeftRotateTest(input: [10, 20], expected: [20, 10])

// 3. Single Element (Remains unchanged)
runLeftRotateTest(input: [7], expected: [7])

// 4. Empty Array (Should not crash)
runLeftRotateTest(input: [], expected: [])

// 5. All Elements Identical
runLeftRotateTest(input: [5, 5, 5], expected: [5, 5, 5])