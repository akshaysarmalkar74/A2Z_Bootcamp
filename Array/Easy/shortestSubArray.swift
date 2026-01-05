// O(n^2) Time / O(1) Space
func getShortestSubArrayLength1(nums: [Int], target: Int) -> Int {
    var result = Int.max
    for outerIdx in stride(from: 0, to: nums.count, by: 1) {
        var sum = 0
        for innerIdx in stride(from: outerIdx, to: nums.count, by: 1) {
            let curNum = nums[innerIdx]
            sum += curNum
            if sum == target {
                let curSubArrLength = (innerIdx - outerIdx) + 1
                result = min(result, curSubArrLength)
            }
        }
    }
    return result == Int.max ? 0 : result
}

// Only Positives (O(2n) Time / O(1) Space)
func getShortestSubArrayLength2(nums: [Int], target: Int) -> Int {
    var result = Int.max
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
            result = min(result, curSubArrLength)
        }
        
        iterPtr += 1
    }
    return result == Int.max ? 0 : result
}

func getShortestSubArrayLength(nums: [Int], target: Int) -> Int {
    return getShortestSubArrayLength2(nums: nums, target: target)
}

func runShortestSubarrayTest(nums: [Int], target: Int, expected: Int) {
    let result = getShortestSubArrayLength(nums: nums, target: target)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Array:          \(nums)")
    print("Target Sum:     \(target)")
    print("Expected Len:   \(expected)")
    print("Actual Result:  \(result)")
    print("Status:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Multiple sub-arrays: [1, 2, 3, 4] vs [10]
runShortestSubarrayTest(nums: [1, 2, 3, 4, 10], target: 10, expected: 1)

// 2. Standard Case: Smallest window is in the middle
runShortestSubarrayTest(nums: [2, 3, 1, 2, 4, 3], target: 7, expected: 2)

// 3. Entire Array is the shortest
runShortestSubarrayTest(nums: [1, 4, 4], target: 9, expected: 3)

// 4. No valid Sub-array (Return 0)
runShortestSubarrayTest(nums: [1, 2, 3], target: 20, expected: 0)

// 5. Array with large values
runShortestSubarrayTest(nums: [1, 2, 11, 4], target: 11, expected: 1)

// 6. Multiple dispersed sub-arrays of same length
runShortestSubarrayTest(nums: [3, 4, 1, 1, 7], target: 7, expected: 1)