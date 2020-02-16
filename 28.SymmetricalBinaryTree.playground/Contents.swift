import Cocoa

// 面试题28：对称的二叉树
// 题目：请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和
// 它的镜像一样，那么它是对称的。

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        func isSameTree(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
            if A == nil && B == nil {
                return true
            }
            
            if A == nil || B == nil {
                return false
            }
            
            if A?.val != B?.val {
                return false
            }
            
            return isSameTree(A?.left, B?.right) && isSameTree(A?.right, B?.left)
        }
        
        return isSameTree(root, root)
    }
}
