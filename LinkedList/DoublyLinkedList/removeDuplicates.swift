public class ListNode {
    public var val: Int
    public var next: ListNode?
    public var prev: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.prev = nil
    }
}

func removeDuplicates(_ head: ListNode?) -> ListNode? {
    var curNode = head
    while let current = curNode {
        if let nextNode = current.next, nextNode.val == current.val {
            current.next = nextNode.next
            nextNode.prev = current
        } else {
            curNode = current.next
        }
    }
    return head
}

// 1 <-> 2 <-> 2 <-> 2 <-> 3 <-> 4
