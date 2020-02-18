import Cocoa

// 面试题 48：最长不含重复字符的子字符串
// 题目：请从字符串中找出一个最长的不包含重复字符的子字符串，计算该最长子
// 字符串的长度。假设字符串中只包含从 'a' 到 'z' 的字符。

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var answer = 0
        var start = 0
        for end in 0..<s.count {
            for temp in start..<end {
                if s[.init(utf16Offset: temp, in: s)] == s[.init(utf16Offset: end, in: s)] {
                    start = temp + 1
                    break
                }
            }
            answer = max(answer, end - start + 1)
        }
        return answer
    }
    
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        var answer = 0
        var map = [Character:Int]()
        var currentLength  = 0
        for (index, c) in s.enumerated() {
            if let preIndex = map[c] {
                if currentLength >= index - preIndex {
                    currentLength = index - preIndex
                } else {
                    currentLength += 1
                }
            } else {
                currentLength += 1
            }
            map[c] = index
            answer = max(currentLength, answer)
        }
        return answer
    }
}
