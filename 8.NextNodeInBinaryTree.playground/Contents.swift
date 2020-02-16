import Cocoa

// 面试题 8：二叉树的下一个结点
// 题目：给定一棵二叉树和其中的一个结点，如何找出中序遍历顺序的下一个结点？
// 树中的结点除了有两个分别指向左右子结点的指针以外，还有一个指向父结点的指针。

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    var parent: TreeNode?
    public init(_ val: Int) {
        self.val = val
    }
}

func nextNode(of node:TreeNode) -> TreeNode? {
    // 1. 有右子树
    if var temp = node.right {
        while temp.left != nil {
            temp = temp.left!
        }
        return temp
    }
    
    // 2. 找到第一个有左子树的父节点
    var temp:TreeNode? = node
    var parent:TreeNode? = node.parent
    while parent != nil && temp === parent?.right {
        temp = parent
        parent = parent?.parent
    }
    
    return parent
}
