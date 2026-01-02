import Foundation

// O(n) Time / O(1) Space
func isPrimeBruteForce(num: Int) -> Bool {
    if num <= 1 { return false }
    var numOfDivisors = 0
    for val in stride(from: 2, through: num, by: 1) {
        if num % val == 0 {
            numOfDivisors += 1
        }
    }
    return numOfDivisors <= 1
}

// O(sqrt(n)) Time / O(1) Space
func isPrimeOptimal(num: Int) -> Bool {
    if num <= 1 { return false }
    for val in stride(from: 2, through: Int(sqrt(Double(num))), by: 1) {
        if num % val == 0 {
            return false
        }
    }
    return true
}

func isPrime(num: Int) -> Bool {
    return isPrimeOptimal(num: num)
}

// Array of test data: (input, expectedValue, description)
let testCases = [
    // --- Edge Cases ---
    (input: -5,  expected: false, desc: "Negative numbers are not prime"),
    (input: 0,   expected: false, desc: "Zero is not prime"),
    (input: 1,   expected: false, desc: "One is not prime (unit)"),
    
    // --- Small Primes ---
    (input: 2,   expected: true,  desc: "Two is the only even prime"),
    (input: 3,   expected: true,  desc: "Small odd prime"),
    (input: 5,   expected: true,  desc: "Small odd prime"),
    
    // --- Small Composites ---
    (input: 4,   expected: false, desc: "Small even composite"),
    (input: 9,   expected: false, desc: "Perfect square (3x3)"),
    (input: 15,  expected: false, desc: "Product of two primes (3x5)"),
    
    // --- Larger Numbers ---
    (input: 17,  expected: true,  desc: "Medium prime"),
    (input: 25,  expected: false, desc: "Perfect square (5x5)"),
    (input: 97,  expected: true,  desc: "Largest two-digit prime"),
    (input: 100, expected: false, desc: "Large even composite"),
    
    // --- Potential "Gotchas" ---
    (input: 21,  expected: false, desc: "Commonly mistaken for prime (3x7)"),
    (input: 49,  expected: false, desc: "Square of a prime (7x7)")
]

print("--- Starting Prime Number Tests ---")

for test in testCases {
    let result = isPrime(num: test.input)
    let isSuccess = (result == test.expected)
    let status = isSuccess ? "PASS ✅" : "FAIL ❌"
    
    print("Input: \(test.input) (\(test.desc))")
    print("Result: \(status) (Got: \(result))")
    print("---------------------------------")
}