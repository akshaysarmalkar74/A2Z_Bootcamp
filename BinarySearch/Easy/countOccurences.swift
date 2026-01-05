func numberOfOccurences(_ nums: [Int], _ target: Int) -> Int {
        let leftMostIdx = numberOfOccurencesHelper(nums, target, true)
        let rightMostIdx: Int
        if leftMostIdx == -1 || leftMostIdx == nums.count - 1 || nums[leftMostIdx + 1] != target {
            rightMostIdx = leftMostIdx
        } else {
            rightMostIdx = numberOfOccurencesHelper(nums, target, false)
        }
        return leftMostIdx == -1 ? 0 : (rightMostIdx - leftMostIdx) + 1
    }

    func numberOfOccurencesHelper(_ nums: [Int], _ target: Int, _ isSearchingLeft: Bool) -> Int {
        var left = 0
        var right = nums.count - 1
        var result = -1

        while left <= right {
            let midIdx = left + ((right - left) / 2)
            let midVal = nums[midIdx]

            if midVal == target {
                result = midIdx
                if isSearchingLeft {
                    right = midIdx - 1
                } else {
                    left = midIdx + 1
                }
            } else if midVal < target {
                left = midIdx + 1
            } else {
                right = midIdx - 1
            }
        }

        return result
    }
    
func runOccurrencesTest(nums: [Int], target: Int, expected: Int) {
    let result = numberOfOccurences(nums, target)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Array:          \(nums)")
    print("Target:         \(target)")
    print("Expected Count: \(expected)")
    print("Actual Result:  \(result)")
    print("Status:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Target appears multiple times
runOccurrencesTest(nums: [1, 2, 4, 4, 4, 4, 5], target: 4, expected: 4)

// 2. Target appears once
runOccurrencesTest(nums: [1, 2, 3, 4, 5], target: 3, expected: 1)

// 3. Target does not exist
runOccurrencesTest(nums: [1, 2, 3, 5, 6], target: 4, expected: 0)

// 4. All elements are the target
runOccurrencesTest(nums: [7, 7, 7, 7], target: 7, expected: 4)

// 5. Target is at the very beginning
runOccurrencesTest(nums: [10, 10, 10, 20, 30], target: 10, expected: 3)

// 6. Target is at the very end
runOccurrencesTest(nums: [1, 2, 5, 5], target: 5, expected: 2)

// 7. Empty Array
runOccurrencesTest(nums: [], target: 5, expected: 0)