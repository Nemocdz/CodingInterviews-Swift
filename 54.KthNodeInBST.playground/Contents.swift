import Cocoa

// 面试题 54：二叉搜索树的第 k 个结点
// 题目：给定一棵二叉搜索树，请找出其中的第 k 大的结点。

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
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        var k = k
        
        func inorder(_ root: TreeNode) -> TreeNode? {
            if let right = root.right, let node = inorder(right) {
                return node
            }
            
            if k == 1 {
                return root
            } else {
                k -= 1
            }
            
            if let left = root.left, let node = inorder(left) {
                return node
            }
            
            return nil
        }
        
        return inorder(root!)?.val ?? -1
    }
}
