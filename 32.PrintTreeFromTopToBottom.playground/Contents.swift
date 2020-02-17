import Cocoa

// 面试题 32（一）：不分行从上往下打印二叉树
// 题目：从上往下打印出二叉树的每个结点，同一层的结点按照从左到右的顺序打印。

// 面试题 32（二）：分行从上到下打印二叉树
// 题目：从上到下按层打印二叉树，同一层的结点按从左到右的顺序打印，每一层
// 打印到一行。

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
    }
}


class Solution {
    func levelOrder(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        
        var queue = [root!]
        var answers = [Int]()
        
        while !queue.isEmpty {
            let first = queue.removeFirst()
            answers.append(first.val)
            if let left = first.left {
                queue.append(left)
            }
            
            if let right = first.right {
                queue.append(right)
            }
        }
        
        return answers
    }
    
    func levelOrder2(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        
        var queue = [root!]
        var answers = [[Int]]()
        
        // 当前层剩余
        var cur = 1
        // 下层应有
        var next = 0
        var temp = [Int]()
        while !queue.isEmpty {
            let first = queue.removeFirst()
            temp.append(first.val)
            
            if let left = first.left {
                queue.append(left)
                next += 1
            }
            
            if let right = first.right {
                queue.append(right)
                next += 1
            }
            
            cur -= 1
            
            if cur == 0 {
                answers.append(temp)
                temp.removeAll()
                cur = next
                next = 0
            }
        }
        
        return answers
    }
    
    func levelOrder3(_ root: TreeNode?) -> [[Int]] {
        return levelOrder2(root).enumerated().map{ $0.offset % 2 == 1 ? $0.element.reversed() : $0.element }
    }
}
