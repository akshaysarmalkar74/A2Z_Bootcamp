// O(n+m) Time / O(n+m) Space
func kThElementOfTwoSortedArray1(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int? {
    var result = [Int]()
    var num1Iter = 0
    var num2Iter = 0
    let totalElements = nums1.count + nums2.count
    
    guard k > 0 && k <= totalElements else { return nil }
    
    while num1Iter < nums1.count && num2Iter < nums2.count {
        let num1 = nums1[num1Iter]
        let num2 = nums2[num2Iter]
        
        if num1 <= num2 {
            result.append(num1)
            num1Iter += 1
        } else {
            result.append(num2)
            num2Iter += 1
        }
    }
    
    while num1Iter < nums1.count {
        let num1 = nums1[num1Iter]
        result.append(num1)
        num1Iter += 1
    }
    
    while num2Iter < nums2.count {
        let num2 = nums2[num2Iter]
        result.append(num2)
        num2Iter += 1
    }
    
    return result[k - 1]
}

// O(m + n) Time / O(1) Space
func kThElementOfTwoSortedArray2(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int? {
    var curNum: Int? = nil
    var num1Iter = 0
    var num2Iter = 0
    var counter = 0
    let totalElements = nums1.count + nums2.count
    
    guard k > 0 && k <= totalElements else { return nil }
    
    while num1Iter < nums1.count && num2Iter < nums2.count {
        let num1 = nums1[num1Iter]
        let num2 = nums2[num2Iter]
        
        if num1 <= num2 {
            curNum = num1
            counter += 1
            num1Iter += 1
        } else {
            curNum = num2
            counter += 1
            num2Iter += 1
        }
        
        if counter == k {
            return curNum
        }
    }
    
    if num1Iter == nums1.count {
        let remainingElements = k - counter
        return nums2[remainingElements - 1]
    } else {
        let remainingElements = k - counter
        return nums1[remainingElements - 1]
    }
}

// O(log(n+m) Time) / O(1) Space
func kThElementOfTwoSortedArray3(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int? {
    let totalNumOfElements = nums1.count + nums2.count
    guard k > 0 && k <= totalNumOfElements else { return nil }
    if nums1.count > nums2.count {
        return kThElementOfTwoSortedArray3(nums2, nums1, k)
    }

    var left = 0
    var right = min(k, nums1.count)

    while left <= right {
        let midIdx = left + ((right - left) / 2)
        let numsRequiredFromOtherArray = k - midIdx
        if numsRequiredFromOtherArray > nums2.count {
            left = midIdx + 1
            continue
        }
        
        let l1 = midIdx == 0 ? Int.min : nums1[midIdx - 1]
        let l2 = numsRequiredFromOtherArray == 0 ? Int.min : nums2[numsRequiredFromOtherArray - 1]
        let r1 = midIdx == nums1.count ? Int.max : nums1[midIdx]
        let r2 = numsRequiredFromOtherArray == nums2.count ? Int.max : nums2[numsRequiredFromOtherArray]

        if ((l1 <= r2) && (l2 <= r1)) {
            return max(l1, l2)
        } else if l1 <= r2 {
            left = midIdx + 1
        } else {
            right = midIdx - 1
        }
    }

    return 0
}

func runKthElementTest(nums1: [Int], nums2: [Int], k: Int, expected: Int?) {
    let result = kThElementOfTwoSortedArray3(nums1, nums2, k)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Arr1: \(nums1), Arr2: \(nums2), k: \(k)")
    print("Expected: \(expected ?? -1), Actual: \(result ?? -1)")
    print("Status:   \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Case
// Combined: [1, 2, 3, 4, 7, 8, 10], k=5 is 7
runKthElementTest(nums1: [2, 3, 7, 10], nums2: [1, 4, 8], k: 5, expected: 7)

// 2. K is the first element
runKthElementTest(nums1: [1, 3], nums2: [2, 4], k: 1, expected: 1)

// 3. K is the last element
runKthElementTest(nums1: [1, 2], nums2: [3, 4], k: 4, expected: 4)

// 4. One array is empty
runKthElementTest(nums1: [], nums2: [1, 5, 9], k: 2, expected: 5)

// 5. K out of bounds
runKthElementTest(nums1: [1, 2], nums2: [3, 4], k: 6, expected: nil)

// Custom Test Case
runKthElementTest(nums1: [1, 5], nums2: [2, 3, 4, 6, 7], k: 5, expected: 5)