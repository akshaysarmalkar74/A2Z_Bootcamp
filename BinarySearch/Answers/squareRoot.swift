// O(logN) Time / O(1) Space
func sqrt(num: Int) -> Int {
    var left = 1
    var right = num 
    
    while left <= right {
        let midNum = left + ((right - left) / 2)
        let squaredNum = midNum * midNum
        if squaredNum == num {
            return midNum
        } else if squaredNum < num {
            left = midNum + 1
        } else {
            right = midNum - 1
        }
    }
    
    return right
}

func runSqrtTest(num: Int, expected: Int) {
    let result = sqrt(num: num)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Input (n):      \(num)")
    print("Expected Sqrt:  \(expected)")
    print("Actual Result:  \(result)")
    print("Status:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Perfect Square (Small)
runSqrtTest(num: 4, expected: 2)

// 2. Perfect Square (Large)
runSqrtTest(num: 100, expected: 10)

// 3. Not a Perfect Square (Floor value)
// sqrt(8) ≈ 2.82, floor is 2
runSqrtTest(num: 8, expected: 2)

// 4. Not a Perfect Square (Just below a square)
// sqrt(24) ≈ 4.89, floor is 4
runSqrtTest(num: 24, expected: 4)

// 5. Smallest Input
runSqrtTest(num: 1, expected: 1)

// 6. Zero
runSqrtTest(num: 0, expected: 0)

// 7. Large Number
runSqrtTest(num: 1000000, expected: 1000)