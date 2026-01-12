public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func sort3Nums(_ head: ListNode?) -> ListNode? {
    var numOfZeroes = 0
    var numOfOnes = 0
    var numOfTwos = 0
    
    var curNode = head
    while curNode != nil {
        let curNodeVal = curNode?.val ?? 0
        if curNodeVal == 0 {
            numOfZeroes += 1
        } else if curNodeVal == 1 {
            numOfOnes += 1
        } else {
            numOfTwos += 1
        }
        curNode = curNode?.next
    }
    
    curNode = head
    while curNode != nil {
        if numOfZeroes > 0 {
            curNode?.val = 0
            numOfZeroes -= 1
        } else if numOfOnes > 0 {
            curNode?.val = 1
            numOfOnes -= 1
        } else {
            curNode?.val = 2
            numOfTwos -= 1
        }
        curNode = curNode?.next
    }
    
    return head
}

func sort3Nums2(_ head: ListNode?) -> ListNode? {
    let dummyZeroNode: ListNode? = ListNode(-1)
    let dummyOneNode: ListNode? = ListNode(-1)
    let dummyTwoNode: ListNode? = ListNode(-1)
    
    var zeroNodeTail = dummyZeroNode
    var oneNodeTail = dummyOneNode
    var twoNodeTail = dummyTwoNode
    
    var curNode = head
    while curNode != nil {
        let curNodeVal = curNode?.val ?? 0
        let nextNode = curNode?.next
        if curNodeVal == 0 {
            zeroNodeTail?.next = curNode
            zeroNodeTail = curNode
            zeroNodeTail?.next = nil
        } else if curNodeVal == 1 {
            oneNodeTail?.next = curNode
            oneNodeTail = curNode
            oneNodeTail?.next = nil
        } else {
            twoNodeTail?.next = curNode
            twoNodeTail = curNode
            twoNodeTail?.next = nil
        }
        curNode = nextNode
    }
    
    zeroNodeTail?.next = dummyOneNode?.next
    oneNodeTail?.next = dummyTwoNode?.next
    twoNodeTail?.next = nil
    
    return dummyZeroNode?.next ?? dummyOneNode?.next ?? dummyTwoNode?.next
}