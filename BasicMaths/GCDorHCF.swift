import Foundation

// O(n + m) Time / O(n + m) Space
func gcdOrHcfUsingMultipleLoops(n1: Int, n2: Int) -> Int {
    var factorsOfN1 = [Int]()
    var factorsOfN2 = [Int]()
    
    for num in stride(from: 1, through: n1, by: 1) {
        if n1 % num == 0 {
            factorsOfN1.append(num)
        }
    }
    
    for num in stride(from: 1, through: n2, by: 1) {
        if n2 % num == 0 {
            factorsOfN2.append(num)
        }
    }
    
    var n1Iter = factorsOfN1.count - 1
    var n2Iter = factorsOfN2.count - 1
    
    while n1Iter >= 0 && n2Iter >= 0 {
        let n1Num = factorsOfN1[n1Iter]
        let n2Num = factorsOfN2[n2Iter]
        
        if n1Num == n2Num {
            return n1Num
        } else if n1Num > n2Num {
            n1Iter -= 1
        } else {
            n2Iter -= 1
        }
    }
    
    return 1
}

// O(min(m, n)) Time / O(1) Space
func gcdOrHcfUsingSingleLoop(n1: Int, n2: Int) -> Int {
    let minNum = min(n1, n2)
    
    for num in stride(from: minNum, through: 1, by: -1) {
        if n1 % num == 0 && n2 % num == 0 {
            return num
        }
    }
    
    return 1
}

// O(max(m, n)) Time / O(1) Space
func gcdOrHcfUsingMaths(n1: Int, n2: Int) -> Int {
    var n1Copy = n1
    var n2Copy = n2
    
    while n1Copy != 0 && n2Copy != 0 {
        if n1Copy > n2Copy {
            n1Copy -= n2Copy
        } else {
            n2Copy -= n1Copy
        }
    }
    
    return n1Copy == 0 ? n2Copy : n1Copy
}

// O(log(min(m, n))) Time / O(1) Space
func gcdOrHcfUsingModulo(n1: Int, n2: Int) -> Int {
    var n1Copy = n1
    var n2Copy = n2
    
    while n1Copy != 0 {
        let remainder = n2Copy % n1Copy
        n2Copy = n1Copy
        n1Copy = remainder
    }
    
    return n2Copy
}

func gcdOrHcf(n1: Int, n2: Int) -> Int {
    return gcdOrHcfUsingModulo(n1: n1, n2: n2)
}

func runGcdTest(n1: Int, n2: Int, expected: Int) {
    let result = gcdOrHcfUsingMultipleLoops(n1: n1, n2: n2)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Inputs: (\(n1), \(n2))")
    print("Expected Value: \(expected)")
    print("Current Value:  \(result)")
    print("Result:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Case: Common factors present
runGcdTest(n1: 12, n2: 18, expected: 6)

// 2. One number is a multiple of the other
runGcdTest(n1: 5, n2: 25, expected: 5)

// 3. Both numbers are the same
runGcdTest(n1: 13, n2: 13, expected: 13)

// 4. Prime Numbers (No common factor other than 1)
runGcdTest(n1: 7, n2: 11, expected: 1)

// 5. Large Common Factor
runGcdTest(n1: 100, n2: 75, expected: 25)

// 6. One of the numbers is 1
runGcdTest(n1: 1, n2: 50, expected: 1)

// 7. Co-prime Numbers
runGcdTest(n1: 8, n2: 9, expected: 1)