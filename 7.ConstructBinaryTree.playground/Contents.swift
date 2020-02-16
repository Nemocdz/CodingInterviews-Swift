import Cocoa

// 面试题 7：重建二叉树
// 题目：输入某二叉树的前序遍历和中序遍历的结果，请重建出该二叉树。假设输
// 入的前序遍历和中序遍历的结果中都不含重复的数字。例如输入前序遍历序列 {1,
// 2, 4, 7, 3, 5, 6, 8} 和中序遍历序列 {4, 7, 2, 1, 5, 3, 8, 6}，则重建出
// 图 2.6 所示的二叉树并输出它的头结点。

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count != inorder.count || preorder.isEmpty {
            return nil
        }
        
        let rootValue = preorder.first!
        let root = TreeNode(rootValue)
        
        let leftLength = inorder.firstIndex(of: rootValue)!
        
        root.left = buildTree(Array(preorder[1..<(1 + leftLength)]), Array(inorder[0..<leftLength]))
        root.right = buildTree(Array(preorder[(1 + leftLength)...]), Array(inorder[(leftLength + 1)...]))
        return root
    }
}


