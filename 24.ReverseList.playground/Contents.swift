import Cocoa

// 面试题24：反转链表
// 题目：定义一个函数，输入一个链表的头结点，反转该链表并输出反转后链表的
// 头结点。
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre:ListNode? = nil
        var cur = head
        
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        
        return pre
    }
}
