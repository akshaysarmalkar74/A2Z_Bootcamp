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

func removeAllDuplicates(_ head: ListNode?) -> ListNode? {
    let dummy: ListNode? = ListNode(0)
    dummy?.next = head
    head?.prev = dummy
    
    var prevNode = dummy
    var curNode = head
    
    while curNode != nil {
        if let curVal = curNode?.val, let nextVal = curNode?.next?.val, curVal == nextVal {
            // There are duplicates
            while curNode?.val == curVal {
                curNode = curNode?.next
            }
            prevNode?.next = curNode
            curNode?.prev = prevNode
        } else {
            prevNode = curNode
            curNode = curNode?.next
        }
    }
    
    dummy?.next?.prev = nil
    return dummy?.next
}
