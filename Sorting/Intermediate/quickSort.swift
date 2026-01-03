func quickSort(nums: inout [Int]) {
    quickSortHelper(&nums, 0, nums.count - 1)
}

func quickSortHelper(_ nums: inout [Int], _ leftPtr: Int, _ rightPtr: Int) {
    guard leftPtr <= rightPtr else { return }
    let pivotIdx = getPivotIdx(&nums, leftPtr, rightPtr)
    quickSortHelper(&nums, leftPtr, pivotIdx - 1)
    quickSortHelper(&nums, pivotIdx + 1, rightPtr)
}

func getPivotIdx(_ nums: inout [Int], _ leftPtr: Int, _ rightPtr: Int) -> Int {
    let randomIdx = Int.random(in: leftPtr...rightPtr)
    nums.swapAt(leftPtr, randomIdx)
    
    var iterIdx = leftPtr + 1
    var idxToSwap = leftPtr
    
    while iterIdx <= rightPtr {
        let curNum = nums[iterIdx]
        let pivotVal = nums[leftPtr]
        if curNum < pivotVal {
            idxToSwap += 1
            nums.swapAt(idxToSwap, iterIdx)
        }
        iterIdx += 1
    }
    
    if leftPtr != idxToSwap {
        nums.swapAt(idxToSwap, leftPtr)   
    }
    
    return idxToSwap
}

func runQuickSortTest(input: [Int], expected: [Int]) {
    var arrayToTest = input
    quickSort(nums: &arrayToTest)
    
    let isSuccess = (arrayToTest == expected)
    let status = isSuccess ? "PASS ✅" : "FAIL ❌"
    
    print("Input:          \(input)")
    print("Expected Value: \(expected)")
    print("Current Value:  \(arrayToTest)")
    print("Result:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Case (Random elements)
runQuickSortTest(input: [10, 80, 30, 90, 40, 50, 70], expected: [10, 30, 40, 50, 70, 80, 90])

// 2. Already Sorted (Checks for recursion depth/efficiency)
runQuickSortTest(input: [1, 2, 3, 4, 5], expected: [1, 2, 3, 4, 5])

// 3. Reverse Sorted
runQuickSortTest(input: [5, 4, 3, 2, 1], expected: [1, 2, 3, 4, 5])

// 4. All Elements Identical (Edge case for partitioning logic)
runQuickSortTest(input: [7, 7, 7, 7], expected: [7, 7, 7, 7])

// 5. Array with Duplicates
runQuickSortTest(input: [3, 5, 8, 1, 2, 9, 4, 7, 6, 5], expected: [1, 2, 3, 4, 5, 5, 6, 7, 8, 9])

// 6. Minimal Arrays
runQuickSortTest(input: [1], expected: [1])
runQuickSortTest(input: [], expected: [])