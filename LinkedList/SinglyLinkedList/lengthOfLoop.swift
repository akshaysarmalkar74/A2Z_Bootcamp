/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

 func lengthOfLoop(_ head: ListNode?) -> Int {
    var slowPtr = head
    var fastPtr = head

    while fastPtr != nil && fastPtr?.next != nil {
        slowPtr = slowPtr?.next
        fastPtr = fastPtr?.next?.next

        if slowPtr === fastPtr {
            // There is a loop
            var count = 1
            slowPtr = slowPtr?.next

            while slowPtr !== fastPtr {
                count += 1
                slowPtr = slowPtr?.next
            }

            return count
        }
    }
    return 0
 }