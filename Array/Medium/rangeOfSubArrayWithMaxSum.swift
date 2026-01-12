func getSubArrayIdxOfMaxSum(_ nums: [Int]) -> [Int] {
    var maxSum = Int.min
    var curSum = 0
    
    var startIndexCopy = -1
    var startIndex = -1
    var endIndex = -1
    
    for (idx, num) in nums.enumerated() {
        if curSum == 0 {
            startIndexCopy = idx
        }
        
        curSum += num
        if curSum > maxSum {
            maxSum = curSum
            startIndex = startIndexCopy
            endIndex = idx
        }
        
        if curSum < 0 {
            curSum = 0
        }
    }
    
    return [startIndex, endIndex]
}

func runKadaneTest(nums: [Int], expectedIndices: [Int]) {
    let result = getSubArrayIdxOfMaxSum(nums)
    let status = (result == expectedIndices) ? "PASS ✅" : "FAIL ❌"
    
    print("Input: \(nums)")
    print("Expected Indices: \(expectedIndices), Actual: \(result)")
    print("Status: \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Case
// Max sum is 6 ([4, -1, 2, 1]) from index 3 to 6
runKadaneTest(nums: [-2, 1, -3, 4, -1, 2, 1, -5, 4], expectedIndices: [3, 6])

// 2. All Positive Numbers
// Max sum is the whole array
runKadaneTest(nums: [1, 2, 3, 4], expectedIndices: [0, 3])

// 3. All Negative Numbers
// Max sum is the "least negative" single element
runKadaneTest(nums: [-5, -1, -8, -3], expectedIndices: [1, 1])

// 4. Single Element
runKadaneTest(nums: [10], expectedIndices: [0, 0])

// 5. Max Sum at the very end
runKadaneTest(nums: [-1, -2, 5], expectedIndices: [2, 2])

// 6. Multiple Subarrays with same Max Sum
// (Logic returns the first one encountered)
runKadaneTest(nums: [1, 2, -10, 1, 2], expectedIndices: [0, 1])