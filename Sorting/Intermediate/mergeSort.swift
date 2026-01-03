func mergeSort(nums: inout [Int]) {
    mergeSortHelper(&nums, 0, nums.count - 1)
}

func mergeSortHelper(_ nums: inout [Int], _ leftPtr: Int, _ rightPtr: Int) {
    guard leftPtr < rightPtr else { return }
    let midPointIdx = (leftPtr + rightPtr) / 2
    mergeSortHelper(&nums, leftPtr, midPointIdx)
    mergeSortHelper(&nums, midPointIdx + 1, rightPtr)
    merge(&nums, leftPtr, midPointIdx, rightPtr)
}

func merge(_ nums: inout [Int], _ leftPtr: Int, _ midPointIdx: Int , _ rightPtr: Int) {
    var result = [Int]()
    var iter1 = leftPtr
    var iter2 = midPointIdx + 1
    
    while iter1 <= midPointIdx && iter2 <= rightPtr {
        let iter1Num = nums[iter1]
        let iter2Num = nums[iter2]
        
        if iter1Num <= iter2Num {
            result.append(iter1Num)
            iter1 += 1
        } else {
            result.append(iter2Num)
            iter2 += 1
        }
    }
    
    while iter1 <= midPointIdx {
        let iter1Num = nums[iter1]
        result.append(iter1Num)
        iter1 += 1
    }
    
    while iter2 <= rightPtr {
        let iter2Num = nums[iter2]
        result.append(iter2Num)
        iter2 += 1
    }
    
    for idx in stride(from: leftPtr, through: rightPtr, by: 1) {
        nums[idx] = result[idx - leftPtr]
    }
}

func runMergeSortTest(input: [Int], expected: [Int]) {
    var arrayToTest = input
    mergeSort(nums: &arrayToTest)
    
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
runMergeSortTest(input: [38, 27, 43, 3, 9, 82, 10], expected: [3, 9, 10, 27, 38, 43, 82])

// 2. Already Sorted Array
runMergeSortTest(input: [1, 2, 3, 4, 5], expected: [1, 2, 3, 4, 5])

// 3. Reverse Sorted Array
runMergeSortTest(input: [10, 9, 8, 7, 6], expected: [6, 7, 8, 9, 10])

// 4. Array with Duplicates
runMergeSortTest(input: [4, 1, 3, 1, 4], expected: [1, 1, 3, 4, 4])

// 5. Odd Number of Elements
runMergeSortTest(input: [5, 2, 9], expected: [2, 5, 9])

// 6. Minimal Arrays
runMergeSortTest(input: [100], expected: [100])
runMergeSortTest(input: [], expected: [])