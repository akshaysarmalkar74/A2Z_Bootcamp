// O(n^2) Time / O(1) Space
func selectionSortIterative(nums: inout [Int]) {
    for outerIdx in stride(from: 0, to: nums.count - 1, by: 1) {
        var minIdx = outerIdx
        for innerIdx in stride(from: outerIdx + 1, to: nums.count, by: 1) {
            let minNum = nums[minIdx]
            let curNum = nums[innerIdx]
            if curNum < minNum {
                minIdx = innerIdx
            }
        }
        
        if minIdx != outerIdx {
            nums.swapAt(minIdx, outerIdx)
        }
    }
}

func selectionSortRecursive(nums: inout [Int], outerIdx: Int = 0) {
    guard outerIdx < nums.count - 1 else { return }

    var minIdx = outerIdx
    for innerIdx in stride(from: outerIdx + 1, to: nums.count, by: 1) {
        let minNum = nums[minIdx]
        let curNum = nums[innerIdx]
        if curNum < minNum {
            minIdx = innerIdx
        }
    }
        
    if minIdx != outerIdx {
        nums.swapAt(minIdx, outerIdx)
    }
    
    selectionSortRecursive(nums: &nums, outerIdx: outerIdx + 1)
}

func selectionSort(nums: inout [Int]) {
    selectionSortRecursive(nums: &nums)
}

func runSortTest(input: [Int], expected: [Int]) {
    var arrayToSort = input
    selectionSort(nums: &arrayToSort)
    
    let isSuccess = (arrayToSort == expected)
    let status = isSuccess ? "PASS ✅" : "FAIL ❌"
    
    print("Input:          \(input)")
    print("Expected Value: \(expected)")
    print("Current Value:  \(arrayToSort)")
    print("Result:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Unsorted Array
runSortTest(input: [64, 25, 12, 22, 11], expected: [11, 12, 22, 25, 64])

// 2. Already Sorted Array (Best Case)
runSortTest(input: [1, 2, 3, 4, 5], expected: [1, 2, 3, 4, 5])

// 3. Reverse Sorted Array (Worst Case)
runSortTest(input: [5, 4, 3, 2, 1], expected: [1, 2, 3, 4, 5])

// 4. Array with Duplicates
runSortTest(input: [3, 1, 2, 1, 3], expected: [1, 1, 2, 3, 3])

// 5. Single Element & Empty Array
runSortTest(input: [1], expected: [1])
runSortTest(input: [], expected: [])