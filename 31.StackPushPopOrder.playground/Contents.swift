import Cocoa

// 面试题 31：栈的压入、弹出序列
// 题目：输入两个整数序列，第一个序列表示栈的压入顺序，请判断第二个序列是
// 否为该栈的弹出顺序。假设压入栈的所有数字均不相等。例如序列 1、2、3、4、
// 5 是某栈的压栈序列，序列 4、5、3、2、1 是该压栈序列对应的一个弹出序列，但
// 4、3、5、1、2 就不可能是该压栈序列的弹出序列。


class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var pushed = pushed
        var stack = [Int]()
        
        for num in popped {
            if let top = stack.last, top == num {
                stack.removeLast()
                continue
            }
            
            if pushed.isEmpty {
                return false
            }
            
            while !pushed.isEmpty {
                let first = pushed.removeFirst()
                if first == num {
                    break
                } else {
                    stack.append(first)
                }
            }
        }
        return true
    }
}
