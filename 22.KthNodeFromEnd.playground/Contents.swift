import Cocoa

// 面试题22：链表中倒数第k个结点
// 题目：输入一个链表，输出该链表中倒数第k个结点。为了符合大多数人的习惯，
// 本题从1开始计数，即链表的尾结点是倒数第1个结点。例如一个链表有6个结点，
// 从头结点开始它们的值依次是1、2、3、4、5、6。这个链表的倒数第3个结点是
// 值为4的结点。

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || k == 0 {
            return nil
        }
        
        var fast = head
        var slow = head
        
        for _ in 0..<k {
            if fast == nil {
                return nil
            }
            fast = fast?.next
        }
        
        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        return slow
    }
}


