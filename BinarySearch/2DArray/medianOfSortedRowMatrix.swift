func medianOfRowSortedMatrix1(_ mat: [[Int]]) -> Int {
    var result = [Int]()
    for row in mat {
        result.append(contentsOf: row)
    }
    result.sort { $0 < $1 }
    return result[result.count / 2]
}

// O(log(range) * n*logm) Time / O(1) Space
func medianOfRowSortedMatrix2(_ mat: [[Int]]) -> Int {
    let halfNumCount = (mat.count * (mat.first?.count ?? 1)) / 2
    var left = Int.max
    var right = Int.min
    
    for row in mat {
        if let firstNum = row.first, firstNum < left {
            left = firstNum
        }
        
        if let lastNum = row.last, lastNum > right {
            right = lastNum
        }
    }
    
    while left <= right {
        let midNum = left + ((right - left) / 2)
        if getNumSmallerOrEqualThan(mat,midNum) <= halfNumCount {
            left = midNum + 1
        } else {
            right = midNum - 1
        }
    }
    
    return left
}

func getNumSmallerOrEqualThan(_ mat: [[Int]], _ midNum: Int) -> Int {
    var result = 0
    for row in mat {
        result += getUpperBound(row, midNum)
    }
    return result
}

func getUpperBound(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let midIdx = left + ((right - left) / 2)
        let midNum = nums[midIdx]
        if midNum <= target {
            left = midIdx + 1
        } else {
            right = midIdx - 1
        }
    }
    
    return left
}

func runMedianTest(mat: [[Int]], expected: Int) {
    let result = medianOfRowSortedMatrix2(mat)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Matrix: \(mat)")
    print("Expected Median: \(expected), Actual: \(result)")
    print("Status: \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Case (3x3)
// Sorted flattened: [1, 2, 3, 3, 5, 6, 6, 9, 9] -> Median is 5
runMedianTest(mat: [
    [1, 3, 5],
    [2, 6, 9],
    [3, 6, 9]
], expected: 5)

// 2. All elements identical
runMedianTest(mat: [
    [1, 1, 1],
    [1, 1, 1],
    [1, 1, 1]
], expected: 1)

// 3. Sequential Matrix
runMedianTest(mat: [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
], expected: 5)

// 4. Large Range
runMedianTest(mat: [
    [3, 30, 300],
    [1, 10, 100],
    [2, 20, 200]
], expected: 20)