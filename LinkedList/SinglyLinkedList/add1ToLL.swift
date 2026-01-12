public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func add1ToLinkedList(_ head: ListNode?) -> ListNode? {
    guard let head else { return nil }
    let reversedLLHead = getReverseLinkedList(head)
    var prevNode: ListNode? = nil
    var curNode = reversedLLHead
    var carry = 1
    
    while curNode != nil {
        let curVal = curNode?.val ?? 0
        if carry == 1 {
            let newVal = curVal + 1
            if newVal == 10 {
                curNode?.val = 0
                carry = 1
            } else {
                curNode?.val = newVal
                carry = 0
            }
        } else {
            break
        }
        prevNode = curNode
        curNode = curNode?.next
    }
    
    if carry == 1 {
        let newNode = ListNode(1)
        prevNode?.next = newNode
    }

    return getReverseLinkedList(reversedLLHead)
}

func getReverseLinkedList(_ head: ListNode?) -> ListNode? {
    var prevNode: ListNode? = nil
    var curNode = head
    
    while curNode != nil {
        let nextNode = curNode?.next
        curNode?.next = prevNode
        prevNode = curNode
        curNode = nextNode
    }
    
    return prevNode
}