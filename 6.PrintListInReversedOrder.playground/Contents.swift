import Cocoa

// 面试题 6：从尾到头打印链表
// 题目：输入一个链表的头结点，从尾到头反过来打印出每个结点的值。

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func reversePrint(_ head: ListNode?) -> [Int] {
        var node = head
        var stack = [ListNode]()
        while node != nil {
            stack.append(node!)
            node = node?.next
        }
        
        return stack.map { $0.val }.reversed()
    }
}

