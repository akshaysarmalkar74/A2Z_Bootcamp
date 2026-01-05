// O(2n) Time / O(1) Space
func isArraySorted1(nums: [Int]) -> Bool {
    var isAscSorted = true
    var isDescSorted = true
    
    for idx in stride(from: 1, to: nums.count, by: 1) {
        if nums[idx] < nums[idx - 1] {
            isAscSorted = false
            break
        }
    }
    
    if isAscSorted { return true }
    
    for idx in stride(from: 1, to: nums.count, by: 1) {
        if nums[idx] > nums[idx - 1] {
            isDescSorted = false
            break
        }
    }
    
    return isDescSorted
}

// O(n) Time / O(1) Space
func isArraySorted2(nums: [Int]) -> Bool {
    var isAscSorted = true
    var isDescSorted = true
    
    for idx in stride(from: 1, to: nums.count, by: 1) {
        if nums[idx] < nums[idx - 1] {
            isAscSorted = false
        } else if nums[idx] > nums[idx - 1] {
            isDescSorted = false
        }
    }
    
    return isAscSorted || isDescSorted
}

func isArraySorted(nums: [Int]) -> Bool {
    return isArraySorted2(nums: nums)
}

func runIsSortedFlexibleTest(input: [Int], expected: Bool) {
    let result = isArraySorted(nums: input)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Input:          \(input)")
    print("Expected Value: \(expected)")
    print("Current Value:  \(result)")
    print("Result:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Ascending Order
runIsSortedFlexibleTest(input: [1, 2, 3, 4, 5], expected: true)

// 2. Descending Order
runIsSortedFlexibleTest(input: [10, 8, 5, 2], expected: true)

// 3. Unsorted (Peak in the middle)
runIsSortedFlexibleTest(input: [1, 5, 2], expected: false)

// 4. Unsorted (Valley in the middle)
runIsSortedFlexibleTest(input: [10, 2, 8], expected: false)

// 5. Sorted with Duplicates (Non-decreasing)
runIsSortedFlexibleTest(input: [1, 2, 2, 3], expected: true)

// 6. Sorted with Duplicates (Non-increasing)
runIsSortedFlexibleTest(input: [5, 5, 3, 1], expected: true)

// 7. All Elements Same
runIsSortedFlexibleTest(input: [7, 7, 7, 7], expected: true)

// 8. Single Element & Empty Array
runIsSortedFlexibleTest(input: [100], expected: true)
runIsSortedFlexibleTest(input: [], expected: true)