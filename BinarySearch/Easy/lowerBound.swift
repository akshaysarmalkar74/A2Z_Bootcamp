// O(log n) Time / O(1) Space
func lowerBound(nums: [Int], target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let midIdx = left + ((right - left) / 2)
        let midVal = nums[midIdx]
        
        if midVal >= target {
            right = midIdx - 1
        } else {
            left = midIdx + 1
        }
    }
    
    return left
}

func runLowerBoundTest(nums: [Int], target: Int, expected: Int) {
    let result = lowerBound(nums: nums, target: target)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Array:          \(nums)")
    print("Target:         \(target)")
    print("Expected Index: \(expected)")
    print("Actual Result:  \(result)")
    print("Status:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Target exists in the array (Unique)
runLowerBoundTest(nums: [1, 3, 5, 7, 9], target: 5, expected: 2)

// 2. Target exists (Duplicates - should return the FIRST index)
runLowerBoundTest(nums: [1, 2, 4, 4, 4, 5, 6], target: 4, expected: 2)

// 3. Target doesn't exist (Target is smaller than all elements)
runLowerBoundTest(nums: [10, 20, 30], target: 5, expected: 0)

// 4. Target doesn't exist (Returns index of first element > target)
runLowerBoundTest(nums: [1, 2, 8, 10, 12], target: 5, expected: 2)

// 5. Target doesn't exist (Target is larger than all elements)
// Should return n (the size of the array)
runLowerBoundTest(nums: [1, 2, 3], target: 10, expected: 3)

// 6. Empty Array
runLowerBoundTest(nums: [], target: 5, expected: 0)