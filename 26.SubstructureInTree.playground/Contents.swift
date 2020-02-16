import Cocoa

// 面试题26：树的子结构
// 题目：输入两棵二叉树A和B，判断B是不是A的子结构。

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        var answer = false
        
        func _isSubTree(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
            // B 到了尽头
            if B == nil {
                return true
            }
            
            // A 到尽头但 B 还没到
            if A == nil {
                return false
            }
            
            if A?.val != B?.val {
                return false
            }
            
            return _isSubTree(A?.left, B?.left) && _isSubTree(A?.right, B?.right)
        }
        
        if A != nil && B != nil {
            // 根相同，判断是否下面结构一致
            if A?.val == B?.val {
                answer = _isSubTree(A, B)
            }
            
            // 往下找根相同的位置
            if !answer {
                answer = isSubStructure(A?.left, B) || isSubStructure(A?.right, B)
            }
        }
        
        return answer
    }
}
