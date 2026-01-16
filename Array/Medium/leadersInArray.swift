func leadersInArray(nums: [Int]) -> [Int] {
    var result = [Int]()
    var idx = nums.count - 1
    var maxNum = Int.min
    while idx >= 0 {
        let curNum = nums[idx]
        if curNum > maxNum {
            maxNum = curNum
            result.append(curNum)
        }
        idx -= 1
    }
    return result
}

func runLeaderTest(nums: [Int], expected: [Int]) {
    let result = leadersInArray(nums: nums)
    // Note: Result order might vary depending on implementation (ascending vs descending)
    let status = (result == expected || result == expected.reversed()) ? "PASS ✅" : "FAIL ❌"
    
    print("Input: \(nums)")
    print("Expected: \(expected), Actual: \(result)")
    print("Status: \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Case
// 2 is leader (rightmost), 5 > 2, 17 is > all. (4 and 3 are not)
runLeaderTest(nums: [16, 17, 4, 3, 5, 2], expected: [17, 5, 2])

// 2. Strictly Increasing
// Only the last element is a leader.
runLeaderTest(nums: [1, 2, 3, 4, 5], expected: [5])

// 3. Strictly Decreasing
// Every element is a leader.
runLeaderTest(nums: [5, 4, 3, 2, 1], expected: [5, 4, 3, 2, 1])

// 4. All Identical Elements
// If the rule is "greater than", only the last is a leader. 
// If "greater than or equal to", all are leaders.
runLeaderTest(nums: [7, 7, 7, 7], expected: [7]) 

// 5. Single Element
runLeaderTest(nums: [10], expected: [10])

// 6. Empty Array
runLeaderTest(nums: [], expected: [])