import Foundation

// O(nlogn+nlog(max_dist)).
func aggressiveCows(n: Int, nums: inout [Int], k: Int) -> Int {
    nums.sort { $0 < $1 }
    var left = 1
    var right = nums[nums.count - 1] - nums[0]
    
    while left <= right {
        let midVal = left + ((right - left) / 2)
        if canPlaceCows(nums, k, midVal) {
            left = midVal + 1
        } else {
            right = midVal - 1
        }
    }
    
    return right
}

func canPlaceCows(_ nums: [Int], _ k: Int, _ midVal: Int) -> Bool {
    var cowPlaced = 1
    var lastPositionPlacedAt = nums[0]
    
    for idx in stride(from: 1, to: nums.count, by: 1) {
        let curPosition = nums[idx]
        let distance = curPosition - lastPositionPlacedAt
        if distance >= midVal {
            cowPlaced += 1
            lastPositionPlacedAt = curPosition
        }
        
        if cowPlaced >= k { return true }
    }
    
    return false
}

func runAggressiveCowsTest(nums: [Int], k: Int, expected: Int) {
    var stalls = nums
    let result = aggressiveCows(n: stalls.count, nums: &stalls, k: k)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Stalls:         \(nums.sorted())")
    print("Cows (k):       \(k)")
    print("Expected Dist:  \(expected)")
    print("Actual Result:  \(result)")
    print("Status:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Case
// Stalls at [1, 2, 4, 8, 9], 3 cows. 
// Best positions: 1, 4, 9 (Distances: 3 and 5. Min is 3).
runAggressiveCowsTest(nums: [1, 2, 8, 4, 9], k: 3, expected: 3)

// 2. Cows equal to stalls
// Every stall must be occupied. Min distance is the smallest gap between adjacent stalls.
runAggressiveCowsTest(nums: [1, 2, 3], k: 3, expected: 1)

// 3. Large gap available
runAggressiveCowsTest(nums: [10, 1, 2, 5], k: 2, expected: 9)

// 4. Uniformly distributed stalls
runAggressiveCowsTest(nums: [0, 5, 10, 15], k: 3, expected: 5)

// 5. Only two cows (Maximum distance possible is end-to-end)
runAggressiveCowsTest(nums: [1, 7, 15, 30], k: 2, expected: 29)