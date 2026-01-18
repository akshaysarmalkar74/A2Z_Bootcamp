func countNumOfSubStrings(_ str: String, _ k: Int) -> Int {
    var result = 0
    let chars = Array(str)
    
    for outerIdx in stride(from: 0, to: chars.count, by: 1) {
        var uniqueNums: Set<Character> = []
        for innerIdx in stride(from: outerIdx, to: chars.count, by: 1) {
            let curVal = chars[innerIdx]
            uniqueNums.insert(curVal)
            if uniqueNums.count == k {
                result += 1
            } else if uniqueNums.count > k {
                break
            }
        }
    }
    
    return result
   
}

func runSubstrTest(s: String, k: Int, expected: Int) {
    let result = countNumOfSubStrings(s, k)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("String: \"\(s)\", k: \(k)")
    print("Expected: \(expected), Actual: \(result) | \(status)")
    print("--------------------------------------------------")
}

// --- 1. Standard Case ---
// "p", "pa", "apa", "a", "ap", "p" (6 substrings)
runSubstrTest(s: "pappa", k: 2, expected: 9)

// --- 2. All Characters Distinct ---
// "a", "b", "c" (3 substrings)
runSubstrTest(s: "abc", k: 1, expected: 3)

// --- 3. k Larger than String Length ---
runSubstrTest(s: "abc", k: 4, expected: 0)

// --- 4. Single Repeated Character ---
// Only k=1 is possible. "a", "aa", "aaa", "a", "aa", "a"
runSubstrTest(s: "aaaa", k: 1, expected: 10) // Calculation: n*(n+1)/2

// --- 5. k = 1 in Multi-char String ---
// "a", "b", "a"
runSubstrTest(s: "aba", k: 1, expected: 3)