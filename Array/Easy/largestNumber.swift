// O(n) Time / O(1) Space
func largestElement(in nums: [Int]) -> Int? {
    var largestNum: Int?
    for num in nums {
        if let largest = largestNum {
            if num > largest {
                largestNum = num
            }
        } else {
            largestNum = num
        }
    }
    
    return largestNum
}

func runLargestElementTest(input: [Int], expected: Int?) {
    let result = largestElement(in: input)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    let displayInput = input.isEmpty ? "[]" : "\(input)"
    let displayExpected = expected == nil ? "nil" : "\(expected!)"
    let displayResult = result == nil ? "nil" : "\(result!)"
    
    print("Input:          \(displayInput)")
    print("Expected Value: \(displayExpected)")
    print("Current Value:  \(displayResult)")
    print("Result:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Positive Numbers
runLargestElementTest(input: [1, 5, 3, 9, 2], expected: 9)

// 2. All Negative Numbers
runLargestElementTest(input: [-10, -2, -35, -1], expected: -1)

// 3. Array with Duplicates
runLargestElementTest(input: [7, 7, 7, 7], expected: 7)

// 4. Single Element
runLargestElementTest(input: [42], expected: 42)

// 5. Empty Array (Should return nil)
runLargestElementTest(input: [], expected: nil)

// 6. Max at the Start/End
runLargestElementTest(input: [100, 50, 20], expected: 100)
runLargestElementTest(input: [20, 50, 100], expected: 100)