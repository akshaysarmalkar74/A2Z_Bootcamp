// O(logn) Time / O(1) Space
func upperBound(nums: [Int], target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let midIdx = left + ((right - left) / 2)
        let midVal = nums[midIdx]
        
        if midVal > target {
            right = midIdx - 1
        } else {
            left = midIdx + 1
        }
    }
    
    return left
}

func runUpperBoundTest(nums: [Int], target: Int, expected: Int) {
    let result = upperBound(nums: nums, target: target)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Array:          \(nums)")
    print("Target:         \(target)")
    print("Expected Index: \(expected)")
    print("Actual Result:  \(result)")
    print("Status:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Target exists (Should return the index AFTER the last occurrence)
runUpperBoundTest(nums: [1, 2, 4, 4, 4, 5, 6], target: 4, expected: 5)

// 2. Target exists (Unique element)
runUpperBoundTest(nums: [1, 3, 5, 7, 9], target: 5, expected: 3)

// 3. Target doesn't exist (Middle of array)
runUpperBoundTest(nums: [1, 2, 8, 10, 12], target: 5, expected: 2)

// 4. Target is smaller than all elements
runUpperBoundTest(nums: [10, 20, 30], target: 5, expected: 0)

// 5. Target is larger than all elements (Returns n)
runUpperBoundTest(nums: [1, 2, 3], target: 10, expected: 3)

// 6. Target is equal to the last element
runUpperBoundTest(nums: [1, 2, 5], target: 5, expected: 3)

// 7. Empty Array
runUpperBoundTest(nums: [], target: 5, expected: 0)