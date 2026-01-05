// O(LogN) Time / O(1) Space
func getFloor(nums: [Int], target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let midIdx = left + ((right - left) / 2)
        let midVal = nums[midIdx]
        
        if midVal == target {
            return midVal
        } else if midVal > target {
            right = midIdx - 1
        } else {
            left = midIdx + 1
        }
    }
    
    return right >= 0 && right < nums.count ? nums[right] : -1
}

// O(LogN) Time / O(1) Space
func getCeil(nums: [Int], target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let midIdx = left + ((right - left) / 2)
        let midVal = nums[midIdx]
        
        if midVal == target {
            return midVal
        } else if midVal > target {
            right = midIdx - 1
        } else {
            left = midIdx + 1
        }
    }
    
    return left >= 0 && left < nums.count ? nums[left] : -1
}

// O(LogN) Time / O(1) Space
func getFloorAndCeilOptimised(nums: [Int], target: Int) -> (Int, Int) {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let midIdx = left + ((right - left) / 2)
        let midVal = nums[midIdx]
        
        if midVal == target {
            return (midVal, midVal)
        } else if midVal < target {
            left = midIdx + 1
        } else {
            right = midIdx - 1
        }
    }
    
    let leftVal = left < nums.count ? nums[left] : -1
    let rightVal = right >= 0 ? nums[right] : -1
    return (rightVal, leftVal)
}

func getFloorAndCeil(nums: [Int], target: Int) -> (Int, Int) {
    return getFloorAndCeilOptimised(nums: nums, target: target)
    /*
    let floorVal = getFloor(nums: nums, target: target)
    let ceilVal = getCeil(nums: nums, target: target)
    return (floorVal, ceilVal)
    */
}


func runFloorCeilTest(nums: [Int], target: Int, expected: (Int, Int)) {
    let result = getFloorAndCeil(nums: nums, target: target)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Array:          \(nums)")
    print("Target:         \(target)")
    print("Expected (F,C): \(expected)")
    print("Actual (F,C):   \(result)")
    print("Status:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Target exists in the array
// Floor and Ceil are both the target itself.
runFloorCeilTest(nums: [1, 2, 8, 10, 11, 12, 19], target: 8, expected: (8, 8))

// 2. Target does not exist (Middle of a gap)
// Floor is 2, Ceil is 8.
runFloorCeilTest(nums: [1, 2, 8, 10, 11, 12, 19], target: 5, expected: (2, 8))

// 3. Target is smaller than the smallest element
// Floor doesn't exist (-1), Ceil is 1.
runFloorCeilTest(nums: [1, 2, 8, 10], target: 0, expected: (-1, 1))

// 4. Target is larger than the largest element
// Floor is 10, Ceil doesn't exist (-1).
runFloorCeilTest(nums: [1, 2, 8, 10], target: 15, expected: (10, -1))

// 5. Array with Duplicates
runFloorCeilTest(nums: [1, 2, 4, 4, 4, 6, 7], target: 4, expected: (4, 4))

// 6. Empty Array
runFloorCeilTest(nums: [], target: 5, expected: (-1, -1))