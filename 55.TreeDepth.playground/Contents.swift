import Cocoa

// 面试题 55（一）：二叉树的深度
// 题目：输入一棵二叉树的根结点，求该树的深度。从根结点到叶结点依次经过的
// 结点（含根、叶结点）形成树的一条路径，最长路径的长度为树的深度。

// 面试题 55（二）：平衡二叉树
// 题目：输入一棵二叉树的根结点，判断该树是不是平衡二叉树。如果某二叉树中
// 任意结点的左右子树的深度相差不超过 1，那么它就是一棵平衡二叉树。

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    var parent: TreeNode?
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        return root == nil ? 0 : max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        func balancedDepth(_ root: TreeNode?) -> Int? {
            if root == nil {
                return 0
            }
            
            if let leftDepth = balancedDepth(root?.left), let rightDepth = balancedDepth(root?.right), abs(leftDepth - rightDepth) <= 1 {
                return 1 + max(leftDepth, rightDepth)
            }
            
            return nil
        }
        
        return balancedDepth(root) != nil
    }
}
