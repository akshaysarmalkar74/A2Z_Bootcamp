// O(m+n) Time / O(m+n) Space (Worst - assuming all are unique)
func unionOfTwoSortedArrays(n1: [Int], n2: [Int]) -> [Int] {
    var result = [Int]()
    
    var iter1 = 0
    var iter2 = 0
    
    while iter1 < n1.count && iter2 < n2.count {
        let num1 = n1[iter1]
        let num2 = n2[iter2]
        
        if num1 <= num2 {
            if let lastElement = result.last, lastElement == num1 {
                iter1 += 1
            } else {
                result.append(num1)
                iter1 += 1
            }
        } else {
            if let lastElement = result.last, lastElement == num2 {
                iter2 += 1
            } else {
                result.append(num2)
                iter2 += 1
            }
        }
    }
    
    while iter1 < n1.count {
        let num1 = n1[iter1]
        if let lastElement = result.last, lastElement == num1 {
            iter1 += 1
        } else {
            result.append(num1)
            iter1 += 1
        }
    }
    
    while iter2 < n2.count {
        let num2 = n2[iter2]
        if let lastElement = result.last, lastElement == num2 {
            iter2 += 1
        } else {
            result.append(num2)
            iter2 += 1
        }
    }
    
    return result
}

func runUnionTest(n1: [Int], n2: [Int], expected: [Int]) {
    let result = unionOfTwoSortedArrays(n1: n1, n2: n2)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Array 1:        \(n1)")
    print("Array 2:        \(n2)")
    print("Expected Union: \(expected)")
    print("Actual Result:  \(result)")
    print("Status:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Case: Overlapping elements
runUnionTest(n1: [1, 2, 3, 4, 5], n2: [2, 3, 5, 6, 7], expected: [1, 2, 3, 4, 5, 6, 7])

// 2. Disjoint Arrays: No common elements
runUnionTest(n1: [1, 3, 5], n2: [2, 4, 6], expected: [1, 2, 3, 4, 5, 6])

// 3. One Array Empty
runUnionTest(n1: [], n2: [1, 2, 3], expected: [1, 2, 3])

// 4. Duplicate Elements within arrays
runUnionTest(n1: [1, 1, 2], n2: [2, 3, 3], expected: [1, 2, 3])

// 5. Identical Arrays
runUnionTest(n1: [10, 20], n2: [10, 20], expected: [10, 20])