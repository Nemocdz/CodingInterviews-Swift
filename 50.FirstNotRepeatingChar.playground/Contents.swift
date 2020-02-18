import Cocoa

// 面试题 50（一）：字符串中第一个只出现一次的字符
// 题目：在字符串中找出第一个只出现一次的字符。如输入 "abaccdeff"，则输出
// 'b'。

class Solution {
    func firstUniqChar(_ s: String) -> Character {
        var mapCount = [Character: Int]()
        for c in s {
            if let count = mapCount[c] {
                mapCount[c] = count + 1
            } else {
                mapCount[c] = 1
            }
        }
        
        for c in s {
            if mapCount[c] == 1 {
                return c
            }
        }
        
        return " "
    }
}
