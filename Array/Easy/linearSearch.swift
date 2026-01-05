// O(n) Time / O(1) Space
func linearSearch(nums: [Int], target: Int) -> Int {
    for (idx, num) in nums.enumerated() {
        if num == target { return idx }
    }
    return -1
}

func runLinearSearchTest(nums: [Int], target: Int, expected: Int) {
    let result = linearSearch(nums: nums, target: target)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Array:          \(nums)")
    print("Target:         \(target)")
    print("Expected Index: \(expected)")
    print("Actual Result:  \(result)")
    print("Status:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Target in the middle
runLinearSearchTest(nums: [10, 20, 30, 40], target: 30, expected: 2)

// 2. Target at the first position (Index 0)
runLinearSearchTest(nums: [5, 1, 9], target: 5, expected: 0)

// 3. Target at the last position
runLinearSearchTest(nums: [8, 4, 12, 7], target: 7, expected: 3)

// 4. Target not present (Should return -1)
runLinearSearchTest(nums: [1, 2, 3], target: 99, expected: -1)

// 5. Empty array
runLinearSearchTest(nums: [], target: 10, expected: -1)

// 6. Multiple occurrences (Should return the FIRST match found)
runLinearSearchTest(nums: [5, 2, 5, 8], target: 5, expected: 0)