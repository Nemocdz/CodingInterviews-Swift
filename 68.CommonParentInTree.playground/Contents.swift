import Cocoa

// 面试题68：树中两个结点的最低公共祖先
// 题目：输入两个树结点，求它们的最低公共祖先。

class TreeNode {
   var val: Int
   var left: TreeNode?
   var right: TreeNode?
   init(_ val: Int) {
       self.val = val
   }
}

// 二叉搜索树
func lowestCommonAncestor1(_ root:TreeNode?, _ p: TreeNode, q: TreeNode) -> TreeNode? {
    var node = root
    
    while node != nil {
        if node!.val > p.val && node!.val > q.val {
            node = node?.left
        } else if node!.val < p.val && node!.val < q.val {
            node = node?.right
        } else {
            return node!
        }
    }
    
    return nil
}

// 普通树
func lowestCommonAncestor2(_ root:TreeNode?, _ p: TreeNode, q: TreeNode) -> TreeNode? {
    // dfs
    func nodePath(_ root:TreeNode?, _ target:TreeNode, _ path: inout [TreeNode]) -> Bool {
        if root == nil {
            return false
        }
        
        path.append(root!)
        
        if root?.val == target.val {
            return true
        }
        
        if nodePath(root?.left, target, &path) || nodePath(root?.right, target, &path) {
            return true
        }
        
        path.removeLast()
        return false
    }
    
    
    var pPath = [TreeNode]()
    nodePath(root, p, &pPath)
    
    var qPath = [TreeNode]()
    nodePath(root, q, &qPath)
    
    var answer:TreeNode? = nil
    
    while !pPath.isEmpty && !qPath.isEmpty {
        let pNode = pPath.removeFirst()
        let qNode = qPath.removeFirst()
        if pNode.val == qNode.val {
            answer = pNode
        }
    }
    
    return answer
}
