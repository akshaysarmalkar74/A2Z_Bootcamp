// O(n^2) Time / O(1) Space
func getLongestSubArrayLength1(nums: [Int], target: Int) -> Int {
    var result = 0
    for outerIdx in stride(from: 0, to: nums.count, by: 1) {
        var sum = 0
        for innerIdx in stride(from: outerIdx, to: nums.count, by: 1) {
            let curNum = nums[innerIdx]
            sum += curNum
            if sum == target {
                let curSubArrLength = (innerIdx - outerIdx) + 1
                result = max(result, curSubArrLength)
            }
        }
    }
    return result
}

// Only Positives (O(2n) Time / O(1) Space)
func getLongestSubArrayLength2(nums: [Int], target: Int) -> Int {
    var result = 0
    var leftPtr = 0
    var iterPtr = 0
    var curSum = 0
    
    while iterPtr < nums.count {
        let curNum = nums[iterPtr]
        curSum += curNum
    
        while leftPtr <= iterPtr && curSum > target {
            let leftNum = nums[leftPtr]
            curSum -= leftNum
            leftPtr += 1
        }
        
        if curSum == target {
            let curSubArrLength = (iterPtr - leftPtr) + 1
            result = max(result, curSubArrLength)
        }
        
        iterPtr += 1
    }
    return result
}

// O(n) Time / O(n) Space - Handles Negatives Too
func getLongestSubArrayLength3(nums: [Int], target: Int) -> Int {
    var sumAndIdxTracker = [Int: Int]()
    var curSum = 0
    var result = 0
    for (idx, num) in nums.enumerated() {
        curSum += num
        if curSum == target {
            result = max(result, idx + 1)
        } 
        
        let requiredNum = curSum - target
        if let idxRequired = sumAndIdxTracker[requiredNum] {
            let curLength = (idx - idxRequired)
            result = max(result, curLength)
        }
        
        if sumAndIdxTracker[curSum] == nil {
            sumAndIdxTracker[curSum] = idx
        }
    }
    
    return result
}

func getLongestSubArrayLength(nums: [Int], target: Int) -> Int {
    return getLongestSubArrayLength2(nums: nums, target: target)
}

func runLongestSubarrayTest(nums: [Int], target: Int, expected: Int) {
    let result = getLongestSubArrayLength(nums: nums, target: target)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Array:          \(nums)")
    print("Target Sum:     \(target)")
    print("Expected Len:   \(expected)")
    print("Actual Result:  \(result)")
    print("Status:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Case: Multiple sub-arrays sum to 10 ([1, 2, 3, 4] and [4, 6])
runLongestSubarrayTest(nums: [1, 2, 3, 4, 6], target: 10, expected: 4)

// 2. Entire Array is the Sub-array
runLongestSubarrayTest(nums: [1, 1, 1], target: 3, expected: 3)

// 3. Target in the middle with zeros (Zeros increase length)
runLongestSubarrayTest(nums: [1, 0, 0, 2, 3], target: 3, expected: 4)

// 4. No valid Sub-array
runLongestSubarrayTest(nums: [1, 2, 3], target: 100, expected: 0)

// 5. Single element matches target
runLongestSubarrayTest(nums: [5], target: 5, expected: 1)

// 6. Multiple dispersed sub-arrays
runLongestSubarrayTest(nums: [2, 3, 5, 1, 9, 1, 1, 1, 1, 1], target: 5, expected: 5)

// 7. Gemeni Test Case
runLongestSubarrayTest(nums: [10, 2, 3], target: 2, expected: 1)

// 8. 2nd Gemeni Test Case
runLongestSubarrayTest(nums: [1, 2, 3, 10], target: 5, expected: 2)