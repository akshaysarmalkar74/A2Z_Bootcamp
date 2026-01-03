// O(n^2) Time / O(1) Space
func insertionSortIterative(nums: inout [Int]) {
    for outerIdx in stride(from: 1, to: nums.count, by: 1) {
        let curNum = nums[outerIdx]
        var innerIdx = outerIdx - 1
        while innerIdx >= 0 && nums[innerIdx] > curNum {
            nums[innerIdx + 1] = nums[innerIdx]
            innerIdx -= 1
        }
        nums[innerIdx + 1] = curNum
    }
}

func insertionSortRecursive(nums: inout [Int], counter: Int = 1) {
    guard counter < nums.count else { return }
    let curNum = nums[counter]
    var innerIdx = counter - 1
    while innerIdx >= 0 && nums[innerIdx] > curNum {
        nums[innerIdx + 1] = nums[innerIdx]
        innerIdx -= 1
    }
    nums[innerIdx + 1] = curNum
    insertionSortRecursive(nums: &nums, counter: counter + 1)
}

func insertionSort(nums: inout [Int]) {
    insertionSortRecursive(nums: &nums)
}

func runInsertionSortTest(input: [Int], expected: [Int]) {
    var arrayToTest = input
    insertionSort(nums: &arrayToTest)
    
    let isSuccess = (arrayToTest == expected)
    let status = isSuccess ? "PASS ✅" : "FAIL ❌"
    
    print("Input:          \(input)")
    print("Expected Value: \(expected)")
    print("Current Value:  \(arrayToTest)")
    print("Result:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Case
runInsertionSortTest(input: [12, 11, 13, 5, 6], expected: [5, 6, 11, 12, 13])

// 2. Already Sorted (Best Case: O(n))
runInsertionSortTest(input: [1, 2, 3, 4, 5], expected: [1, 2, 3, 4, 5])

// 3. Reverse Sorted (Worst Case: O(n^2))
runInsertionSortTest(input: [5, 4, 3, 2, 1], expected: [1, 2, 3, 4, 5])

// 4. Array with Duplicates
runInsertionSortTest(input: [4, 2, 4, 3, 1], expected: [1, 2, 3, 4, 4])

// 5. Small Collections
runInsertionSortTest(input: [10], expected: [10])
runInsertionSortTest(input: [], expected: [])