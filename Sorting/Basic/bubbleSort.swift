// O(n^2) Time / O(1) Space
func bubbleSortOne(nums: inout [Int]) {
    for _ in stride(from: 0, to: nums.count - 1, by: 1) {
        for innerIdx in stride(from: 0, to: nums.count - 1, by: 1) {
            let curNum = nums[innerIdx]
            let nextNum = nums[innerIdx + 1]
            if curNum > nextNum {
                nums.swapAt(innerIdx, innerIdx + 1)
            }
        }
    }
}

// Slightly Better
func bubbleSortTwo(nums: inout [Int]) {
    for outerIdx in stride(from: 0, to: nums.count - 1, by: 1) {
        for innerIdx in stride(from: 0, to: nums.count - 1 - outerIdx, by: 1) {
            let curNum = nums[innerIdx]
            let nextNum = nums[innerIdx + 1]
            if curNum > nextNum {
                nums.swapAt(innerIdx, innerIdx + 1)
            }
        }
    }
}

// Most Optimal
func bubbleSortThree(nums: inout [Int]) {
    for outerIdx in stride(from: 0, to: nums.count - 1, by: 1) {
        var hasSwapped = false
        for innerIdx in stride(from: 0, to: nums.count - 1 - outerIdx, by: 1) {
            let curNum = nums[innerIdx]
            let nextNum = nums[innerIdx + 1]
            if curNum > nextNum {
                nums.swapAt(innerIdx, innerIdx + 1)
                hasSwapped = true
            }
        }
        
        if !hasSwapped { return }
    }
}

// Recursive Solution
func bubbleSortRecursive(nums: inout [Int], counter: Int = 0) {
    guard counter < nums.count - 1 else { return }
    var hasSwapped = false
    for innerIdx in stride(from: 0, to: nums.count - 1 - counter, by: 1) {
        let curNum = nums[innerIdx]
        let nextNum = nums[innerIdx + 1]
        if curNum > nextNum {
            nums.swapAt(innerIdx, innerIdx + 1)
            hasSwapped = true
        }
    }
        
    if !hasSwapped { return }
    bubbleSortRecursive(nums: &nums, counter: counter + 1)
}

func bubbleSort(nums: inout [Int]) {
    bubbleSortRecursive(nums: &nums)
}

func runBubbleSortTest(input: [Int], expected: [Int]) {
    var arrayToTest = input
    bubbleSort(nums: &arrayToTest)
    
    let isSuccess = (arrayToTest == expected)
    let status = isSuccess ? "PASS ✅" : "FAIL ❌"
    
    print("Input:          \(input)")
    print("Expected Value: \(expected)")
    print("Current Value:  \(arrayToTest)")
    print("Result:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Unsorted Array
runBubbleSortTest(input: [5, 1, 4, 2, 8], expected: [1, 2, 4, 5, 8])

// 2. Already Sorted Array (Best Case)
runBubbleSortTest(input: [1, 2, 3, 4, 5], expected: [1, 2, 3, 4, 5])

// 3. Reverse Sorted Array (Worst Case)
runBubbleSortTest(input: [10, 7, 5, 2], expected: [2, 5, 7, 10])

// 4. Array with Duplicates
runBubbleSortTest(input: [3, 1, 3, 2, 1], expected: [1, 1, 2, 3, 3])

// 5. Single Element and Empty Array
runBubbleSortTest(input: [42], expected: [42])
runBubbleSortTest(input: [], expected: [])