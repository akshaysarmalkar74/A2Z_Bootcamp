import Foundation

func allocateMinBooks(_ pages: [Int], _ students: Int) -> Int {
    guard students <= pages.count else { return -1 }
    var left = pages.max() ?? 1
    var right = pages.reduce(0, +)
    
    while left <= right {
        let midVal = left + ((right - left) / 2)
        if canAllocateBooks(pages, students, midVal) {
            right = midVal - 1
        } else {
            left = midVal + 1
        }
    }
    
    return left
}

func canAllocateBooks(_ pages: [Int], _ students: Int, _ midVal: Int) -> Bool {
    var curPages = 0
    var studentsAllocated = 0
    
    for page in pages {
        let newPageCount = curPages + page
        if newPageCount > midVal {
            curPages = page
            studentsAllocated += 1
            if curPages == midVal {
                curPages = 0
                studentsAllocated += 1
            }
        } else if newPageCount == midVal {
            curPages = 0
            studentsAllocated += 1
        } else {
            curPages = newPageCount
        }
    }
    
    if curPages != 0 {
        studentsAllocated += 1
    }
    
    return studentsAllocated <= students
}

func runBookAllocationTest(pages: [Int], students: Int, expected: Int) {
    let result = allocateMinBooks(pages, students)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Books (Pages):  \(pages)")
    print("Students (m):   \(students)")
    print("Expected Min:   \(expected)")
    print("Actual Result:  \(result)")
    print("Status:         \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Case
// Possible: [12], [34, 67, 90] (Max 191) or [12, 34], [67, 90] (Max 157)
runBookAllocationTest(pages: [12, 34, 67, 90], students: 2, expected: 113) 
// Correction: For [12, 34, 67] and [90], Max is 113.

// 2. More students than books
// Allocation impossible because each student needs at least one book.
runBookAllocationTest(pages: [25, 46, 28, 49], students: 5, expected: -1)

// 3. One book per student (Max pages is the largest book)
runBookAllocationTest(pages: [10, 20, 30, 40], students: 4, expected: 40)

// 4. Only one student
// Student must read all books.
runBookAllocationTest(pages: [15, 17, 20], students: 1, expected: 52)

// 5. Already balanced books
runBookAllocationTest(pages: [10, 10, 10, 10], students: 2, expected: 20)