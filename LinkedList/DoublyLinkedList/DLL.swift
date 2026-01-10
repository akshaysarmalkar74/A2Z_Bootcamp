import Foundation

class Node {
    var value: Int
    var prev: Node?
    var next: Node?
    
    init(_ value: Int) {
        self.value = value
    }
}

class DoublyLinkedList {
    var head: Node?
    var tail: Node?
    
    func push(_ value: Int) {
        let newNode = Node(value)
        guard let _ = head else {
            self.head = newNode
            self.tail = newNode
            return
        }
        
        self.tail?.next = newNode
        newNode.prev = self.tail
        self.tail = newNode
    }
    
    func pop() -> Int? {
        guard let _ = head else { return nil }
        if head === tail {
            let poppedValue = self.head?.value
            self.head = nil
            self.tail = nil
            return poppedValue
        }
        
        let poppedValue = self.tail?.value
        let newTail = tail?.prev
        newTail?.next = nil
        tail?.prev = nil
        tail = newTail
        return poppedValue
    }
    
    func unshift(_ value: Int) {
        let newNode = Node(value)
        guard let _ = head else {
            self.head = newNode
            self.tail = newNode
            return
        }
        
        self.head?.prev = newNode
        newNode.next = self.head
        self.head = newNode
    } 
    
    func shift() -> Int? {
        guard let _ = head else { return nil }
        if head === tail {
            let poppedValue = self.head?.value
            self.head = nil
            self.tail = nil
            return poppedValue
        }
        
        let poppedValue = self.head?.value
        let newHead = head?.next
        newHead?.prev = nil
        head?.next = nil
        head = newHead
        return poppedValue
    }
    
    func get(idx: Int) -> Int? {
        guard idx >= 0 else { return nil }
        var counter = 0
        var curNode = head
        while curNode != nil {
            if counter == idx {
                return curNode?.value
            }
            
            counter += 1
            curNode = curNode?.next
        }
        
        return nil
    }
    
    func set(idx: Int, value: Int) -> Bool {
        guard idx >= 0 else { return false }
        var counter = 0
        var curNode = head
        while curNode != nil {
            if counter == idx {
                curNode?.value = value
                return true
            }
            
            counter += 1
            curNode = curNode?.next
        }
        
        return false
    }
    
    func insert(idx: Int, value: Int) -> Bool {
        guard idx >= 0 else { return false }
        if idx == 0 {
            self.unshift(value)
            return true
        }
        
        let newNode = Node(value)
        var counter = 0
        var curNode = head
        
        while curNode != nil {
            if counter == idx - 1 {
                newNode.next = curNode?.next
                newNode.next?.prev = newNode
                newNode.prev = curNode
                curNode?.next = newNode
                
                if newNode.next == nil {
                    tail = newNode
                }
                
                return true
            }
            
            counter += 1
            curNode = curNode?.next
        }
        
        return false
    }
    
    func remove(idx: Int) -> Int? {
        guard idx >= 0 else { return nil }
        if idx == 0 {
            return self.shift()
        }
        
        var counter = 0
        var curNode = head
        
        while curNode != nil {
            if counter == idx - 1 {
                guard let nodeToDelete = curNode?.next else { return nil }
                let nextNode = nodeToDelete.next
                
                curNode?.next = nextNode
                nextNode?.prev = curNode
                
                nodeToDelete.prev = nil
                nodeToDelete.next = nil
                
                if nodeToDelete === tail {
                    tail = curNode
                }
                
                return nodeToDelete.value
            }
            
            counter += 1
            curNode = curNode?.next
        }
        
        return nil
    }

    func reverse() {
        let oldHead = head
        var prevNode: Node? = nil
        var curNode = head

        while curNode != nil {
            let nextNode = curNode?.next
            curNode?.next = prevNode
            curNode?.prev = nextNode
            prevNode = curNode
            curNode = nextNode
        }

        head = prevNode
        tail = oldHead
    }
    
    func printList() {
        var curNode = head
        
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
// MARK: - Doubly Linked List Tests
// =======================

print("\n--- Doubly Linked List Tests ---\n")

let list = DoublyLinkedList()

// -----------------------
// Push
// -----------------------
list.push(10)
list.push(20)
list.push(30)

assertEqual(list.head?.value, 10, "Push - Head Value")
assertEqual(list.tail?.value, 30, "Push - Tail Value")
assertEqual(list.tail?.prev?.value, 20, "Push - Tail Prev")

// -----------------------
// Pop
// -----------------------
assertEqual(list.pop(), 30, "Pop - Last Element")
assertEqual(list.tail?.value, 20, "Pop - New Tail")

assertEqual(list.pop(), 20, "Pop - Second Element")
assertEqual(list.pop(), 10, "Pop - Single Element")
assertNil(list.pop(), "Pop - Empty List")

// -----------------------
// Unshift
// -----------------------
list.unshift(5)
list.unshift(3)

assertEqual(list.head?.value, 3, "Unshift - Head Value")
assertEqual(list.head?.next?.value, 5, "Unshift - Next Value")
assertEqual(list.tail?.value, 5, "Unshift - Tail Value")

// -----------------------
// Shift
// -----------------------
assertEqual(list.shift(), 3, "Shift - First Element")
assertEqual(list.head?.value, 5, "Shift - New Head")

assertEqual(list.shift(), 5, "Shift - Last Element")
assertNil(list.shift(), "Shift - Empty List")

// -----------------------
// Push Again
// -----------------------
list.push(10)
list.push(20)
list.push(30)

// -----------------------
// Get
// -----------------------
assertEqual(list.get(idx: 0), 10, "Get - Index 0")
assertEqual(list.get(idx: 1), 20, "Get - Index 1")
assertEqual(list.get(idx: 2), 30, "Get - Index 2")
assertNil(list.get(idx: 3), "Get - Out of Bounds")
assertNil(list.get(idx: -1), "Get - Negative Index")

// -----------------------
// Set
// -----------------------
assertEqual(list.set(idx: 1, value: 25), true, "Set - Valid Index")
assertEqual(list.get(idx: 1), 25, "Set - Updated Value")

assertEqual(list.set(idx: 5, value: 100), false, "Set - Invalid Index")
assertEqual(list.set(idx: -1, value: 100), false, "Set - Negative Index")

// -----------------------
// Insert
// -----------------------
assertEqual(list.insert(idx: 1, value: 15), true, "Insert - Middle")
assertEqual(list.get(idx: 1), 15, "Insert - Verify Middle")

assertEqual(list.insert(idx: 0, value: 5), true, "Insert - At Head")
assertEqual(list.get(idx: 0), 5, "Insert - New Head")
assertEqual(list.head?.next?.prev?.value, 5, "Insert - Prev Pointer Check")

assertEqual(list.insert(idx: 10, value: 100), false, "Insert - Invalid Index")

// -----------------------
// Remove
// -----------------------
assertEqual(list.remove(idx: 0), 5, "Remove - Head")
assertEqual(list.head?.prev?.value, nil, "Remove - Head Prev Nil")

assertEqual(list.remove(idx: 1), 15, "Remove - Middle")
assertEqual(list.get(idx: 1), 25, "Remove - Link Fix")

assertEqual(list.remove(idx: 10), nil, "Remove - Invalid Index")
assertEqual(list.remove(idx: -1), nil, "Remove - Negative Index")

print("\n--- All Tests Completed ---\n")