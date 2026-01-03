// O(n) Time / O(n) Space
func highestFreq(nums: [Int]) -> Int? {
    var highest: Int?
    var freq = [Int: Int]()
    for num in nums {
        freq[num] = freq[num, default: 0] + 1
        if let highestNum = highest {
            if ((freq[num] ?? 0) > (freq[highestNum] ?? 0)) {
                highest = num
            }
        } else {
            highest = num
        }
    }
    return highest
}

func runHighestFreqTest(input: [Int], expected: Int?) {
    let result = highestFreq(nums: input)
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

// 1. Clear Winner
runHighestFreqTest(input: [1, 3, 1, 3, 2, 1], expected: 1)

// 2. All Unique (Returns any one of them, usually the first encountered)
// Note: If your logic picks the first, expected should be 10.
runHighestFreqTest(input: [10, 20, 30], expected: 10)

// 3. Empty Array (Should return nil)
runHighestFreqTest(input: [], expected: nil)

// 4. Negative Numbers
runHighestFreqTest(input: [-5, -5, 2, -5, 2], expected: -5)

// 5. Large Tie (Testing logic for multiple elements with same frequency)
runHighestFreqTest(input: [1, 1, 2, 2], expected: 1)