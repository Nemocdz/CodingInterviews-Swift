import Cocoa

// 面试题 38：字符串的排列
// 题目：输入一个字符串，打印出该字符串中字符的所有排列。例如输入字符串 abc，
// 则打印出由字符 a、b、c 所能排列出来的所有字符串 abc、acb、bac、bca、cab 和 cba。

class Solution {
    func permutation(_ s: String) -> [String] {
        var answers = [String]()
        var temp = [Character]()
        
        func _permutation(_ s:[Character]) {
            if s.isEmpty {
                answers.append(String(temp))
            } else {
                for i in 0..<s.count {
                    if i > 0 && s[i] == s[i - 1] {
                        continue
                    }
                    temp.append(s[i])
                    _permutation(Array(s[0..<i]) + Array(s[(i + 1)...]))
                    temp.removeLast()
                }
            }
            
        }
        
        _permutation(Array(s).sorted())
        
        return answers
    }
}
