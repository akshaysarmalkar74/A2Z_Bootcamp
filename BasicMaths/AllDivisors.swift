import Foundation

// O(n) Time / O(k) Space
func getDivisorBruteForce(num: Int) -> [Int] {
    var result = [Int]()
    for val in stride(from: 1, through: num, by: 1) {
        if num % val == 0 {
            result.append(val)
        }
    }
    return result
}

// O(sqrt(n)) Time / O(k) Space
func getDivisorOptimal(num: Int) -> [Int] {
    var result = [Int]()
    for val in stride(from: 1, through: Int(sqrt(Double(num))), by: 1) {
        if num % val == 0 {
            let quotient = num / val
            result.append(val)
            if quotient != val {
                result.append(quotient)
            }
        }
    }
    return result
}


func getDivisor(num: Int) -> [Int] {
    return getDivisorOptimal(num: num)
}

func runDivisorTest(input: Int, expected: [Int]) {
    let result = getDivisor(num: input)
    
    // Sorting results to ensure comparison works regardless of order
    let sortedResult = result.sorted()
    let sortedExpected = expected.sorted()
    
    let isSuccess = (sortedResult == sortedExpected)
    let status = isSuccess ? "PASS ✅" : "FAIL ❌"
    
    print("Input: \(input)")
    print("Expected Value: \(sortedExpected)")
    print("Current Value:  \(sortedResult)")
    print("Result:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. The Number One (Only has one divisor)
runDivisorTest(input: 1, expected: [1])

// 2. A Prime Number (Only 1 and itself)
runDivisorTest(input: 7, expected: [1, 7])

// 3. A Composite Number (Standard case)
runDivisorTest(input: 10, expected: [1, 2, 5, 10])

// 4. A Perfect Square (Odd number of divisors)
runDivisorTest(input: 16, expected: [1, 2, 4, 8, 16])

// 5. A Larger Number
runDivisorTest(input: 24, expected: [1, 2, 3, 4, 6, 8, 12, 24])