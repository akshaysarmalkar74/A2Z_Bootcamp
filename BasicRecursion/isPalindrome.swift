func isPalindrome(str: String) -> Bool {
    let chars = Array(str)
    return isPalindromeHelper(chars: chars, leftPtr: 0, rightPtr: chars.count - 1)
}

// O(n^2) Time / O(n/2) Space
func isPalindromeHelper(str: String, leftPtr: Int, rightPtr: Int) -> Bool {
    guard leftPtr < rightPtr else { return true }
    let leftIdx = str.index(str.startIndex, offsetBy: leftPtr)
    let rightIdx = str.index(str.startIndex, offsetBy: rightPtr)
    
    let leftChar = str[leftIdx]
    let rightChar = str[rightIdx]
    if leftChar != rightChar { return false }
    return isPalindromeHelper(str: str, leftPtr: leftPtr + 1, rightPtr: rightPtr - 1)
}

// O(n) Time / O(2n) Space
func isPalindromeHelper(chars: [Character], leftPtr: Int, rightPtr: Int) -> Bool {
    guard leftPtr < rightPtr else { return true }
    let leftChar = chars[leftPtr]
    let rightChar = chars[rightPtr]
    if leftChar != rightChar { return false }
    return isPalindromeHelper(chars: chars, leftPtr: leftPtr + 1, rightPtr: rightPtr - 1)
}

func runPalindromeTest(input: String, expected: Bool) {
    let result = isPalindrome(str: input)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Input:          \"\(input)\"")
    print("Expected Value: \(expected)")
    print("Current Value:  \(result)")
    print("Result:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Simple Palindrome
runPalindromeTest(input: "madam", expected: true)

// 2. Non-Palindrome
runPalindromeTest(input: "swift", expected: false)

// 3. Single Character (Technically a palindrome)
runPalindromeTest(input: "a", expected: true)

// 4. Empty String
runPalindromeTest(input: "", expected: true)

// 5. Case Sensitivity (Check if your logic handles "N" vs "n")
runPalindromeTest(input: "Noon", expected: false) 

// 6. Numbers as Strings
runPalindromeTest(input: "12321", expected: true)