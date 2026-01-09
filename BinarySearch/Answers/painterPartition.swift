import Foundation

..
func painterPartition(numOfPainters: Int, painterStrength: Int, areas: [Int]) -> Int {
    var left = areas.max() ?? 1
    var right = areas.reduce(0, +)
    
    while left <= right {
        let midVal = left + ((right - left) / 2)
        if canPaint(numOfPainters, areas, midVal) {
            right = midVal - 1
        } else {
            left = midVal + 1
        }
    }
    
    return left * painterStrength
}

func canPaint(_ numOfPainters: Int, _ areas: [Int], _ midVal: Int) -> Bool {
    var paintedArea = 0
    var paintersReq = 0
    
    for area in areas {
        let nextPaintedArea = paintedArea + area
        if nextPaintedArea > midVal {
            paintedArea = area
            paintersReq += 1
            if paintedArea == midVal {
                paintedArea = 0
                paintersReq += 1
            }
        } else if nextPaintedArea == midVal {
            paintedArea = 0
            paintersReq += 1
        } else {
            paintedArea = nextPaintedArea
        }
    }
    
    if paintedArea != 0 {
        paintersReq += 1
    }
    
    return paintersReq <= numOfPainters
}

func runPainterTest(painters: Int, strength: Int, areas: [Int], expected: Int) {
    let result = painterPartition(numOfPainters: painters, painterStrength: strength, areas: areas)
    let status = (result == expected) ? "PASS ✅" : "FAIL ❌"
    
    print("Boards: \(areas), Strength: \(strength), Painters: \(painters)")
    print("Expected Time: \(expected), Actual: \(result)")
    print("Status: \(status)")
    print("---------------------------------")
}

// --- Test Cases ---

// 1. Standard Case
// 2 painters, 1 unit/time, boards [10, 20, 30, 40]
// Optimal: [10, 20, 30] and [40] -> Max units is 60. Time = 60 * 1 = 60.
runPainterTest(painters: 2, strength: 1, areas: [10, 20, 30, 40], expected: 60)

// 2. High Strength Factor
// Same boards as above, but strength is 10.
// Max units is 60. Time = 60 * 10 = 600.
runPainterTest(painters: 2, strength: 10, areas: [10, 20, 30, 40], expected: 600)

// 3. More Painters than Boards
// Each painter takes one board. The bottleneck is the largest board.
// Max board is 40. Time = 40 * 1 = 40.
runPainterTest(painters: 5, strength: 1, areas: [10, 20, 30, 40], expected: 40)

// 4. Single Painter
// Must paint everything. Sum = 100. Time = 100 * 1 = 100.
runPainterTest(painters: 1, strength: 1, areas: [10, 20, 30, 40], expected: 100)

// 5. Large Board Variance
// [1, 10, 1, 1], 2 painters.
// Optimal: [1] and [10, 1, 1] is 12. [1, 10] and [1, 1] is 11.
// Max units is 11. Time = 11.
runPainterTest(painters: 2, strength: 1, areas: [1, 10, 1, 1], expected: 11)

/*
// Better Way
func canPaint(_ numOfPainters: Int, _ areas: [Int], _ limit: Int) -> Bool {
    var paintersCount = 1
    var currentSum = 0
    
    for area in areas {
        if currentSum + area <= limit {
            currentSum += area
        } else {
            // Assign to new painter
            paintersCount += 1
            currentSum = area
            if paintersCount > numOfPainters { return false }
        }
    }
    
    return true
}
*/