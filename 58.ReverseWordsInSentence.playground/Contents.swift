import Cocoa

// 面试题 58（一）：翻转单词顺序
// 题目：输入一个英文句子，翻转句子中单词的顺序，但单词内字符的顺序不变。
// 为简单起见，标点符号和普通字母一样处理。例如输入字符串 "I am a student."，
// 则输出 "student. a am I"。

// 面试题 58（二）：左旋转字符串
// 题目：字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。
// 请定义一个函数实现字符串左旋转操作的功能。比如输入字符串 "abcdefg" 和数
// 字 2，该函数将返回左旋转 2 位得到的结果 "cdefgab"。

class Solution {
    func reverseWords(_ s: String) -> String {
        if s.isEmpty {
            return ""
        }
        return String(s
            .split(separator: " ")
            .map{ $0 }
            .reversed()
            .reduce("") { $0 + " " + $1 }
            .dropFirst())
    }
    
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        let left = String(s[String.Index(utf16Offset: 0, in: s)..<String.Index(utf16Offset: n, in: s)].reversed())
        let right = String(s[String.Index(utf16Offset: n, in: s)...].reversed())
        return String((left + right).reversed())
    }
}
