import Cocoa

// 面试题 61：扑克牌的顺子
// 题目：从扑克牌中随机抽 5 张牌，判断是不是一个顺子，即这 5 张牌是不是连续的。
// 2～10 为数字本身，A 为 1，J 为 11，Q 为 12，K 为 13，而大、小王可以看成任意数字。

class Solution {
    func isStraight(_ nums: [Int]) -> Bool {
        let normalNums = nums.filter{ $0 != 0 }.sorted()
        var zeroCount = nums.count - normalNums.count
        
        for i in 1..<normalNums.count {
            let diff = normalNums[i] - normalNums[i - 1]
            // 对子
            if diff == 0 {
                return false
            // 顺子
            } else if diff == 1 {
                continue
            // 大小王不够补
            } else if diff - 1 > zeroCount {
                return false
            // 用大小王补
            } else {
                zeroCount -= diff - 1
            }
        }
        
        return true
    }
}
