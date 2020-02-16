import Cocoa

// 面试题 18（一）：在 O (1) 时间删除链表结点
// 题目：给定单向链表的头指针和一个结点指针，定义一个函数在 O (1) 时间删除该
// 结点。

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        let fake = ListNode(-1)
        fake.next = head
        var temp:ListNode? = fake
        
        while temp?.next != nil {
            if temp?.next?.val == val {
                temp?.next = temp?.next?.next
            } else {
                temp = temp?.next
            }
        }
        
        return fake.next
    }
}
