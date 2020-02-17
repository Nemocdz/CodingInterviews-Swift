import Cocoa

// 面试题 34：二叉树中和为某一值的路径
// 题目：输入一棵二叉树和一个整数，打印出二叉树中结点值的和为输入整数的所
// 有路径。从树的根结点开始往下一直到叶结点所经过的结点形成一条路径。

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var answers = [[Int]]()
        var temp = [Int]()
        
        func findPath(_ root: TreeNode, _ sum: Int) {
            let remain = sum - root.val
            temp.append(root.val)
            
            if remain == 0 && root.left == nil && root.right == nil {
                answers.append(temp)
            }
            
            if let left = root.left {
                findPath(left, remain)
            }
            
            if let right = root.right {
                findPath(right, remain)
            }
            
            temp.removeLast()
        }
        
        if let root = root {
            findPath(root, sum)
        }
        
        return answers
    }
}
