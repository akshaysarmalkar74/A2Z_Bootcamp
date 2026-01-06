// O(log n) time | O(1) space
func numOfTimeArrIsRotated(_ nums: [Int]) -> Int {
  guard nums.count > 1 else { return 0 }

  var left = 0
  var right = nums.count - 1

  while left <= right {
    let midIdx = left + ((right - left) / 2)
    let midVal = nums[midIdx]
    let rightVal = nums[right]
    if isMinElement(nums, midIdx) {
      return midIdx
    } else if midVal < rightVal {
      right = midIdx - 1
    } else {
      left = midIdx + 1
    }
  }

  return -1  // Won't run
}

func isMinElement(_ nums: [Int], _ midIdx: Int) -> Bool {
  let midVal = nums[midIdx]
  if midIdx == 0 {
    let nextVal = nums[midIdx + 1]
    return midVal < nextVal
  } else if midIdx == nums.count - 1 {
    let prevVal = nums[midIdx - 1]
    return midVal < prevVal
  } else {
    let prevVal = nums[midIdx - 1]
    let nextVal = nums[midIdx + 1]
    return midVal < prevVal && midVal < nextVal
  }
}

func runRotationCountTest(nums: [Int], expected: Int) {
    let result = numOfTimeArrIsRotated(nums)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Array:          \(nums)")
    print("Expected Count: \(expected)")
    print("Actual Result:  \(result)")
    print("Status:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Rotation (Middle pivot)
runRotationCountTest(nums: [4, 5, 6, 7, 0, 1, 2], expected: 4)

// 2. Small Rotation (Pivot near the end)
runRotationCountTest(nums: [2, 3, 4, 5, 1], expected: 4)

// 3. Large Rotation (Pivot near the start)
runRotationCountTest(nums: [5, 1, 2, 3, 4], expected: 1)

// 4. Not Rotated at all (Sorted)
runRotationCountTest(nums: [1, 2, 3, 4, 5], expected: 0)

// 5. Fully Rotated (Returns back to 0)
// Note: In most implementations, index 0 is the same as index N
runRotationCountTest(nums: [1, 2, 3, 4, 5], expected: 0)

// 6. Two Elements
runRotationCountTest(nums: [2, 1], expected: 1)

// 7. Single Element
runRotationCountTest(nums: [10], expected: 0)