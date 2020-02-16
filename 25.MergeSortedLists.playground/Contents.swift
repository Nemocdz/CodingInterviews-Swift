import Cocoa

// 面试题25：合并两个排序的链表
// 题目：输入两个递增排序的链表，合并这两个链表并使新链表中的结点仍然是按
// 照递增排序的。例如输入图3.11中的链表1和链表2，则合并之后的升序链表如链
// 表3所示。

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let fake = ListNode(-1)
        var temp = fake
        var l1 = l1
        var l2 = l2
        
        while l1 != nil || l2 != nil {
            if l1 == nil {
                temp.next = ListNode(l2!.val)
                l2 = l2?.next
            } else if l2 == nil {
                temp.next = ListNode(l1!.val)
                l1 = l1?.next
            } else {
                if l1!.val < l2!.val {
                    temp.next = ListNode(l1!.val)
                    l1 = l1?.next
                } else {
                    temp.next = ListNode(l2!.val)
                    l2 = l2?.next
                }
            }
            temp = temp.next!
        }
        
        return fake.next
    }
}
