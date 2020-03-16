import Cocoa

// 面试题23：链表中环的入口结点
// 题目：一个链表中包含环，如何找出环的入口结点？例如，在图3.8的链表中，
// 环的入口结点是结点3。

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
    }
}

func detectCycle(of head:ListNode?) -> ListNode? {
    var slow = head
    var fast = head
    
    repeat {
        fast = fast?.next
        if fast == nil {
            return nil
        }
        fast = fast?.next
        slow = slow?.next
    } while slow !== fast
    
    // 环外 a，环 b + c，fast = 2 slow，a + b + c + b = 2 * (a + b)
    // a == c 所以环 a + b，当 slow 走 a 时，fast 走 c，fast 和 slow 在入口相遇
    slow = head
    while slow !== fast {
        slow = slow?.next
        fast = fast?.next
    }
    
    return slow
}
