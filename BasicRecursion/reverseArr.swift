// O(n/2) Time / O(n/2) Space
func reverseArr(nums: inout [Int]) {
    reverseArrHelper(nums: &nums, leftPtr: 0, rightPtr: nums.count - 1)
}

func reverseArrHelper(nums: inout [Int], leftPtr: Int, rightPtr: Int) {
    guard leftPtr < rightPtr else { return }
    nums.swapAt(leftPtr, rightPtr)
    reverseArrHelper(nums: &nums, leftPtr: leftPtr + 1, rightPtr: rightPtr - 1)
}

func runReverseTest(input: [Int], expected: [Int]) {
    var arrayToModify = input
    reverseArr(nums: &arrayToModify)
    
    let isSuccess = (arrayToModify == expected)
    let status = isSuccess ? "PASS ✅" : "FAIL ❌"
    
    print("Original:       \(input)")
    print("Expected Value: \(expected)")
    print("Current Value:  \(arrayToModify)")
    print("Result:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Odd-Length Array
runReverseTest(input: [1, 2, 3, 4, 5], expected: [5, 4, 3, 2, 1])

// 2. Standard Even-Length Array
runReverseTest(input: [10, 20, 30, 40], expected: [40, 30, 20, 10])

// 3. Single Element Array
runReverseTest(input: [7], expected: [7])

// 4. Empty Array
runReverseTest(input: [], expected: [])

// 5. Array with Duplicate Values
runReverseTest(input: [1, 1, 2, 1], expected: [1, 2, 1, 1])