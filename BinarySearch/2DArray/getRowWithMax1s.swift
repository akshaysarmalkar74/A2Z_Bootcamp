// (mLogn) Time / O(1) Space
func getRowIdxWithMax1s(mat: [[Int]]) -> Int {
    var result = -1
    var maxRowCount = 0
    
    for (idx, row) in mat.enumerated() {
        let curNumOf1s = getCountOf1s(row)
        if curNumOf1s > maxRowCount {
            result = idx
            maxRowCount = curNumOf1s
        }
    }
    
    return result
}

func getCountOf1s(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let midIdx = left + ((right - left) / 2)
        let midVal = nums[midIdx]
        
        if midVal == 1 {
            right = midIdx - 1
        } else {
            left = midIdx + 1
        }
    }
    
    return nums.count - left
}

func runMaxOnesTest(mat: [[Int]], expected: Int) {
    let result = getRowIdxWithMax1s(mat: mat)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Matrix Rows:    \(mat.count)")
    print("Matrix Cols:    \(mat.first?.count ?? 0)")
    print("Expected Index: \(expected)")
    print("Actual Result:  \(result)")
    print("Status:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Case: Different amounts of 1s
// Row 0: one 1, Row 1: three 1s, Row 2: two 1s
runMaxOnesTest(mat: [
    [0, 1, 1],
    [1, 1, 1],
    [0, 0, 1]
], expected: 1)

// 2. Tie Case: Rows 1 and 2 both have two 1s
// Should return the smaller index (1)
runMaxOnesTest(mat: [
    [0, 0, 0],
    [0, 1, 1],
    [0, 1, 1]
], expected: 1)

// 3. No 1s in the matrix
// Problem says if no row has at least 1 zero (likely meaning at least one '1'), return -1
runMaxOnesTest(mat: [
    [0, 0, 0],
    [0, 0, 0]
], expected: -1)

// 4. All 1s in the matrix
// Smallest index with max 1s is 0
runMaxOnesTest(mat: [
    [1, 1],
    [1, 1]
], expected: 0)

// 5. Single Row Matrix
runMaxOnesTest(mat: [[0, 1, 1]], expected: 0)

// 6. Varying positions of first 1
runMaxOnesTest(mat: [
    [0, 0, 0, 1],
    [0, 1, 1, 1],
    [0, 0, 1, 1]
], expected: 1)