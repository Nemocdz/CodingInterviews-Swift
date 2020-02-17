import Cocoa

// 面试题 38：字符串的排列
// 题目：输入一个字符串，打印出该字符串中字符的所有排列。例如输入字符串 abc，
// 则打印出由字符 a、b、c 所能排列出来的所有字符串 abc、acb、bac、bca、cab 和 cba。

class Solution {
    func permutation(_ s: String) -> [String] {
        var answers = [String]()
        
        func _permutation(_ s: [Character], _ start:Int) {
            if start == s.count - 1 {
                answers.append(String(s))
            } else {
                var s = s
                for i in start..<s.count {
                    // s[start,i) 中没有重复的 s[i]
                    if start == i || !s[start..<i].contains(s[i]) {
                        s.swapAt(start, i)
                        _permutation(s, start + 1)
                        s.swapAt(start, i)
                    }
                }
            }
        }
        
        _permutation(Array(s), 0)
        
        return answers
    }
}
