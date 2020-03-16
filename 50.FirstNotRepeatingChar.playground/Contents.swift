import Cocoa

// 面试题 50（一）：字符串中第一个只出现一次的字符
// 题目：在字符串中找出第一个只出现一次的字符。如输入 "abaccdeff"，则输出
// 'b'。

class Solution {
    func firstUniqChar(_ s: String) -> Character {
        // value = 1:true, >1:false
        var map = [Character: Bool]()
        
        for c in s {
            if map.keys.contains(c) {
                map[c] = false
            } else {
                map[c] = true
            }
        }
        
        for c in s {
            if map[c] ?? false {
                return c
            }
        }
        
        return " "
    }
}
