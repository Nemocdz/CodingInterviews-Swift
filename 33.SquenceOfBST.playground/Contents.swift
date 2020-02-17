import Cocoa

// 面试题 33：二叉搜索树的后序遍历序列
// 题目：输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历的结果。
// 如果是则返回 true，否则返回 false。假设输入的数组的任意两个数字都互不相同。

class Solution {
    func verifyPostorder(_ postorder: [Int]) -> Bool {
        if postorder.isEmpty {
            return true
        }
        
        var postorder = postorder
        let root = postorder.removeLast()
        
        let leftLength = postorder.firstIndex { $0 > root } ?? postorder.count
        
        let left = leftLength == 0 ? [] : Array(postorder[0..<leftLength])
        let right = leftLength == postorder.count ? [] : Array(postorder[leftLength...])
        
        if right.contains(where: { $0 < root }) {
            return false
        }
        
        return verifyPostorder(left) && verifyPostorder(right)
    }
}
