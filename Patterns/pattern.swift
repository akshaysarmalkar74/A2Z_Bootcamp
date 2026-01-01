// Pattern 1
func pattern1(numOfRows: Int = 5) {
    for _ in stride(from: 1, through: numOfRows, by: 1) {
        for colIdx in stride(from: 1, through: numOfRows, by: 1) {
            print("*", terminator: colIdx == numOfRows ? "\n" : "")
        }
    }
}

// Pattern 2
func pattern2(numOfRows: Int = 5) {
    for rowIdx in stride(from: 1, through: numOfRows, by: 1) {
        for colIdx in stride(from: 1, through: rowIdx, by: 1) {
            print("*", terminator: colIdx == rowIdx ? "\n" : "")
        }
    }
}

// Pattern 3
func pattern3(numOfRows: Int = 5) {
    for rowIdx in stride(from: 1, through: numOfRows, by: 1) {
        for colIdx in stride(from: 1, through: rowIdx, by: 1) {
            print(colIdx, terminator: colIdx == rowIdx ? "\n" : "")
        }
    }
}

// Pattern 4
func pattern4(numOfRows: Int = 5) {
    for rowIdx in stride(from: 1, through: numOfRows, by: 1) {
        for colIdx in stride(from: 1, through: rowIdx, by: 1) {
            print(rowIdx, terminator: colIdx == rowIdx ? "\n" : "")
        }
    }
}

// Pattern 5
func pattern5(numOfRows: Int = 5) {
    for rowIdx in stride(from: numOfRows, through: 1, by: -1) {
        for colIdx in stride(from: 1, through: rowIdx, by: 1) {
            print("*", terminator: colIdx == rowIdx ? "\n" : "")
        }
    }
}

// Pattern 6
func pattern6(numOfRows: Int = 5) {
    for rowIdx in stride(from: numOfRows, through: 1, by: -1) {
        for colIdx in stride(from: 1, through: rowIdx, by: 1) {
            print(colIdx, terminator: colIdx == rowIdx ? "\n" : "")
        }
    }
}

// Pattern 7
func pattern7(numOfRows: Int = 5) {
    for rowIdx in stride(from: 1, through: numOfRows, by: 1) {
        let numOfSpaces = numOfRows - rowIdx
        let numOfStars = (rowIdx * 2) - 1
        
        for _ in stride(from: 1, through: numOfSpaces, by: 1) {
            print(" ", terminator: "")
        }
        
        for colIdx in stride(from: 1, through: numOfStars, by: 1) {
            print("*", terminator: numOfSpaces == 0 && colIdx == numOfStars ? "\n" : "")
        }
        
        for colIdx in stride(from: 1, through: numOfSpaces, by: 1) {
            print(" ", terminator: colIdx == numOfSpaces ? "\n" : "")
        }
    }
}

// Pattern 8
func pattern8(numOfRows: Int = 5) {
    for rowIdx in stride(from: numOfRows, through: 1, by: -1) {
        let numOfSpaces = numOfRows - rowIdx
        let numOfStars = (rowIdx * 2) - 1
        
        for _ in stride(from: 1, through: numOfSpaces, by: 1) {
            print(" ", terminator: "")
        }
        
        for colIdx in stride(from: 1, through: numOfStars, by: 1) {
            print("*", terminator: numOfSpaces == 0 && colIdx == numOfStars ? "\n" : "")
        }
        
        for colIdx in stride(from: 1, through: numOfSpaces, by: 1) {
            print(" ", terminator: colIdx == numOfSpaces ? "\n" : "")
        }
    }
}

// Pattern 9
func pattern9(numOfRows: Int = 5) {
    pattern7(numOfRows: numOfRows)
    pattern8(numOfRows: numOfRows)
}

// Pattern 10
func pattern10(numOfRows: Int = 5) {
    pattern2(numOfRows: numOfRows)
    pattern5(numOfRows: numOfRows - 1)
}

// Pattern 11
func pattern11(numOfRows: Int = 5) {
    for rowIdx in stride(from: 1, through: numOfRows, by: 1) {
        var shouldPrintOne = rowIdx % 2 != 0
        for colIdx in stride(from: 1, through: rowIdx, by: 1) {
            let valToPrint = shouldPrintOne ? 1 : 0
            print(valToPrint, terminator: colIdx == rowIdx ? "\n" : "")
            shouldPrintOne.toggle()
        }
    }
}

// Pattern 12
func pattern12(numOfRows: Int = 4) {
    for rowIdx in stride(from: 1, through: numOfRows, by: 1) {
        let numOfSpaces = (numOfRows - rowIdx) * 2
        
        for colIdx in stride(from: 1, through: rowIdx, by: 1) {
            print(colIdx, terminator: "")
        }
        
        for _ in stride(from: 1, through: numOfSpaces, by: 1) {
            print(" ", terminator: "")
        }
        
        for colIdx in stride(from: rowIdx, through: 1, by: -1) {
            print(colIdx, terminator: colIdx == 1 ? "\n" : "")
        }
    }
}

// Pattern 13
func pattern13(numOfRows: Int = 5) {
    var counter = 1
    for rowIdx in stride(from: 1, through: numOfRows, by: 1) {
        for colIdx in stride(from: 1, through: rowIdx, by: 1) {
            print(counter, terminator: colIdx == rowIdx ? "\n" : " ")
            counter += 1
        }
    }
}

// Pattern 14
func pattern14(numOfRows: Int = 5) {
    for rowIdx in stride(from: 1, through: numOfRows, by: 1) {
        var asciiVal = 65
        for colIdx in stride(from: 1, through: rowIdx, by: 1) {
            let valToPrint = Character(UnicodeScalar(asciiVal)!)
            print(valToPrint, terminator: colIdx == rowIdx ? "\n" : "")
            asciiVal += 1
        }
    }
}

// Pattern 15
func pattern15(numOfRows: Int = 5) {
    for rowIdx in stride(from: numOfRows, through: 1, by: -1) {
        var asciiVal = 65
        for colIdx in stride(from: 1, through: rowIdx, by: 1) {
            let valToPrint = Character(UnicodeScalar(asciiVal)!)
            print(valToPrint, terminator: colIdx == rowIdx ? "\n" : "")
            asciiVal += 1
        }
    }
}

// Pattern 16
func pattern16(numOfRows: Int = 5) {
    var asciiVal = 65
    for rowIdx in stride(from: 1, through: numOfRows, by: 1) {
        for colIdx in stride(from: 1, through: rowIdx, by: 1) {
            let valToPrint = Character(UnicodeScalar(asciiVal)!)
            print(valToPrint, terminator: colIdx == rowIdx ? "\n" : "")
        }
        asciiVal += 1
    }
}

// Pattern 17
func pattern17(numOfRows: Int = 4) {
    for rowIdx in stride(from: 1, through: numOfRows, by: 1) {
        let numOfSpaces = numOfRows - rowIdx
        let asciiStartVal = 65
        
        for _ in stride(from: 1, through: numOfSpaces, by: 1) {
            print(" ", terminator: "")
        }
        
        for colIdx in stride(from: asciiStartVal, to: asciiStartVal + rowIdx, by: 1) {
            let valToPrint = Character(UnicodeScalar(colIdx)!)
            print(valToPrint, terminator: "")
        }
        
        for colIdx in stride(from: (asciiStartVal + rowIdx - 2), through: asciiStartVal, by: -1) {
            let valToPrint = Character(UnicodeScalar(colIdx)!)
            print(valToPrint, terminator: "")
        }
        
        for colIdx in stride(from: 1, through: numOfSpaces, by: 1) {
            print(" ", terminator: colIdx == numOfSpaces ? "\n" : "")
        }
    }
}

// Pattern 18
func pattern18(numOfRows: Int = 5) {
    for rowIdx in stride(from: 1, through: numOfRows, by: 1) {
        var asciiVal = 65 + (numOfRows - rowIdx)
        for colIdx in stride(from: 1, through: rowIdx, by: 1) {
            let valToPrint = Character(UnicodeScalar(asciiVal)!)
            print(valToPrint, terminator: colIdx == rowIdx ? "\n" : "")
            asciiVal += 1
        }
    }
}

// Pattern 19
func pattern19HelperOne(numOfRows: Int = 5) {
    for rowIdx in stride(from: 1, through: numOfRows, by: 1) {
        let numOfSpaces = (numOfRows - rowIdx) * 2
        
        for _ in stride(from: 1, through: rowIdx, by: 1) {
            print("*", terminator: "")
        }
        
        for _ in stride(from: 1, through: numOfSpaces, by: 1) {
            print(" ", terminator: "")
        }
        
        for _ in stride(from: 1, through: rowIdx, by: 1) {
            print("*", terminator: "")
        }
        
        print("\n", terminator: "")
    }
}

func pattern19HelperTwo(numOfRows: Int = 5) {
    for rowIdx in stride(from: numOfRows, through: 1, by: -1) {
        let numOfSpaces = (numOfRows - rowIdx) * 2
        
        for _ in stride(from: 1, through: rowIdx, by: 1) {
            print("*", terminator: "")
        }
        
        for _ in stride(from: 1, through: numOfSpaces, by: 1) {
            print(" ", terminator: "")
        }
        
        for _ in stride(from: 1, through: rowIdx, by: 1) {
            print("*", terminator: "")
        }
        
        print("\n", terminator: "")
    }
}

func pattern19(numOfRows: Int = 5) {
    pattern19HelperTwo(numOfRows: numOfRows)
    pattern19HelperOne(numOfRows: numOfRows)
}

// Pattern 20
func pattern20(numOfRows: Int = 5) {
    pattern19HelperOne(numOfRows: numOfRows)
    pattern19HelperTwo(numOfRows: numOfRows)
}

// Pattern 21
func pattern21(numOfRows: Int = 4) {
    for rowIdx in stride(from: 1, through: numOfRows, by: 1) {
        for colIdx in stride(from: 1, through: numOfRows, by: 1) {
            if rowIdx == 1 || rowIdx == numOfRows || colIdx == 1 || colIdx == numOfRows {
                print("*", terminator: colIdx == numOfRows ? "\n" : "")
            } else {
                print(" ", terminator: "")
            }
            
        }
    }
}

// Pattern 22
func pattern22(numOfRows: Int = 4) {
    let numOfRowsAndCols = (numOfRows * 2) - 1
    for rowIdx in stride(from: 1, through: numOfRowsAndCols, by: 1) {
        for colIdx in stride(from: 1, through: numOfRowsAndCols, by: 1) {
            let xDistance = abs(colIdx - numOfRows)
            let yDistance = abs(rowIdx - numOfRows)
            let maxDistance = max(xDistance, yDistance) + 1
            print(maxDistance, terminator: colIdx == numOfRowsAndCols ? "\n" : "")
        }
    }
}
