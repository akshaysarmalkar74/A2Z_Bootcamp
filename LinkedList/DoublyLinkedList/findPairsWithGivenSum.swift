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

func findPairsWithGivenSum(_ head: ListNode?, _ target: Int) -> [[Int]] {
    guard let _ = head else { return [] }
    var result = [[Int]]()
    var startNode = head
    var endNode = head
    var curNode = head
    while curNode != nil {
        endNode = curNode
        curNode = curNode?.next
    }
    
    while startNode !== endNode && startNode?.prev !== endNode {
        let startVal = startNode?.val ?? 0
        let endVal = endNode?.val ?? 0
        let sum = startVal + endVal
        if sum == target {
            result.append([startVal, endVal])
            startNode = startNode?.next
            endNode = endNode?.prev
        } else if sum < target {
            startNode = startNode?.next
        } else {
            endNode = endNode?.prev
        }
    }
    
    return result
}
