import Foundation

class Node {
    var value: Int
    var next: Node?
    
    init(_ value: Int) {
        self.value = value
    }
}

class SinglyLinkedList {
    var head: Node?
    var tail: Node?
    
    func push(_ value: Int) {
        let newNode = Node(value)
        guard let _ = self.tail else {
            self.head = newNode
            self.tail = newNode
            return
        }
        
        self.tail?.next = newNode
        self.tail = newNode
    }
    
    func pop() -> Int? {
        guard let _ = self.head else { return nil }
        if self.head === self.tail {
            let poppedNodeVal = self.head?.value
            self.head = nil
            self.tail = nil
            return poppedNodeVal
        } else {
            var prevNode = self.head
            var curNode = self.head
            
            while let nextNode = curNode?.next {
                prevNode = curNode
                curNode = nextNode
            }
            
            let poppedNodeVal = curNode?.value
            prevNode?.next = nil
            self.tail = prevNode
            return poppedNodeVal
        }
    }
    
    func unshift(_ value: Int) {
        let newNode = Node(value)
        guard let _ = self.head else {
            self.head = newNode
            self.tail = newNode
            return
        }
        
        newNode.next = head
        self.head = newNode
    }
    
    func shift() -> Int? {
        guard let _ = self.head else { return nil }
        if self.head === self.tail {
            let poppedNodeVal = self.head?.value
            self.head = nil
            self.tail = nil
            return poppedNodeVal
        } else {
            let poppedNode = self.head
            self.head = poppedNode?.next
            poppedNode?.next = nil
            return poppedNode?.value
        }
    }
    
    func set(idx: Int, value: Int) -> Bool {
        var counter = 0
        var iterNode = self.head
        while iterNode != nil {
            if counter == idx {
                iterNode?.value = value
                return true
            }
            counter += 1
            iterNode = iterNode?.next
        }
        
        return false
    }
    
    func get(idx: Int) -> Int? {
        var counter = 0
        var iterNode = self.head
        while iterNode != nil {
            if counter == idx {
                return iterNode?.value
            }
            counter += 1
            iterNode = iterNode?.next
        }
        
        return nil
    }
    
    func insert(idx: Int, value: Int) -> Bool {
        guard idx >= 0 else { return false }
        if idx == 0 {
            self.unshift(value)
            return true
        }
        
        let newNode = Node(value)
        var counter = 0
        var iterNode = self.head
        while iterNode != nil {
            if counter == idx - 1 {
                newNode.next = iterNode?.next
                iterNode?.next = newNode
                
                if newNode.next == nil {
                    tail = newNode
                }
                
                return true
            }
            counter += 1
            iterNode = iterNode?.next
        }
        
        return false
    }
    
    func remove(idx: Int) -> Int? {
        guard idx >= 0 else { return nil }
        if idx == 0 {
            return self.shift()
        }
        
        var counter = 0
        var iterNode = self.head
        while iterNode != nil {
            if counter == idx - 1 {
                let nodeToPopped = iterNode?.next
                iterNode?.next = nodeToPopped?.next
                
                if nodeToPopped === self.tail {
                    self.tail = iterNode
                }
                
                return nodeToPopped?.value
            }
            counter += 1
            iterNode = iterNode?.next
        }
        
        return nil
    }
    
    func printList() {
        var curNode = self.head
        while curNode != nil {
            print(curNode?.value ?? 0)
            curNode = curNode?.next
        }
    }
}

// =======================
// MARK: - Test Helpers
// =======================

func assertEqual<T: Equatable>(_ actual: T, _ expected: T, _ name: String) {
    if actual == expected {
        print("✅ PASS: \(name)")
    } else {
        print("❌ FAIL: \(name) | Expected: \(expected), Got: \(actual)")
    }
}

func assertNil<T>(_ actual: T?, _ name: String) {
    if actual == nil {
        print("✅ PASS: \(name)")
    } else {
        print("❌ FAIL: \(name) | Expected: nil, Got: \(actual!)")
    }
}

// =======================
// MARK: - Tests
// =======================

print("\n--- Linked List Tests ---\n")

let list = SinglyLinkedList()

// Push
list.push(10)
list.push(20)
list.push(30)
assertEqual(list.head?.value, 10, "Push - Head")
assertEqual(list.tail?.value, 30, "Push - Tail")

// Pop
assertEqual(list.pop(), 30, "Pop - Last")
assertEqual(list.pop(), 20, "Pop - Middle")
assertEqual(list.pop(), 10, "Pop - Single")
assertNil(list.pop(), "Pop - Empty")

// Unshift
list.unshift(5)
list.unshift(3)
assertEqual(list.head?.value, 3, "Unshift - Head")
assertEqual(list.tail?.value, 5, "Unshift - Tail")

// Shift
assertEqual(list.shift(), 3, "Shift - First")
assertEqual(list.shift(), 5, "Shift - Last")
assertNil(list.shift(), "Shift - Empty")

// Push again
list.push(10)
list.push(20)
list.push(30)

// Get
assertEqual(list.get(idx: 0), 10, "Get - Index 0")
assertEqual(list.get(idx: 1), 20, "Get - Index 1")
assertEqual(list.get(idx: 2), 30, "Get - Index 2")
assertNil(list.get(idx: 3), "Get - Out of Bounds")

// Set
assertEqual(list.set(idx: 1, value: 25), true, "Set - Valid Index")
assertEqual(list.get(idx: 1), 25, "Set - Verify Value")
assertEqual(list.set(idx: 10, value: 100), false, "Set - Invalid Index")

// Insert
assertEqual(list.insert(idx: 1, value: 15), true, "Insert - Middle")
assertEqual(list.get(idx: 1), 15, "Insert - Verify")
assertEqual(list.insert(idx: 0, value: 5), true, "Insert - Head")
assertEqual(list.get(idx: 0), 5, "Insert - New Head")
assertEqual(list.insert(idx: 10, value: 100), false, "Insert - Invalid")

// Remove
assertEqual(list.remove(idx: 0), 5, "Remove - Head")
assertEqual(list.remove(idx: 1), 15, "Remove - Middle")
assertNil(list.remove(idx: 10), "Remove - Invalid")

print("\n--- Tests Completed ---\n")