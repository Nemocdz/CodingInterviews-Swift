import Cocoa

// 面试题 52：两个链表的第一个公共结点
// 题目：输入两个链表，找出它们的第一个公共结点。

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
    }
}

func getIntersectionNode(_ headA:ListNode?, headB:ListNode?) -> ListNode? {
    func length(of head:ListNode?) -> Int {
        var length = 0
        var temp = head
        while temp != nil {
            temp = temp?.next
            length += 1
        }
        return length
    }
    
    let lengthA = length(of: headA)
    let lengthB = length(of: headB)
    
    var longHead = lengthA > lengthB ? headA : headB
    var shortHead = lengthA > lengthB ? headB : headA
    
    let lengthDiff = abs(lengthA - lengthB)
    
    for _ in 0..<lengthDiff {
        longHead = longHead?.next
    }
    
    while longHead != nil && shortHead !== longHead {
        longHead = longHead?.next
        shortHead = shortHead?.next
    }
    
    return longHead
}
