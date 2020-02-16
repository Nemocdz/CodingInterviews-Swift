import Cocoa

// 面试题27：二叉树的镜像
// 题目：请完成一个函数，输入一个二叉树，该函数输出它的镜像。

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        let node = TreeNode(root!.val)
        node.left = mirrorTree(root?.right)
        node.right = mirrorTree(root?.left)
        return node
    }
}
