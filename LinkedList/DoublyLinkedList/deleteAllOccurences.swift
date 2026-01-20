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

func deleteAllOccurrences(_ head: ListNode?, _ target: Int) -> ListNode? {
    let dummy: ListNode? = ListNode(0)
    dummy?.next = head
    head?.prev = dummy
    
    var curNode = head
    while let current = curNode {
        let curVal = current.val
        if curVal == target {
            current.prev?.next = current.next
            current.next?.prev = current.prev
        }
        curNode = current.next
    }
    
    dummy?.next?.prev = nil
    return dummy?.next
}
