import Cocoa

// 面试题 49：丑数
// 题目：我们把只包含因子 2、3 和 5 的数称作丑数（Ugly Number）。求按从小到
// 大的顺序的第 1500 个丑数。例如 6、8 都是丑数，但 14 不是，因为它包含因子 7。
// 习惯上我们把 1 当做第一个丑数。

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        var uglyNums = [1]
        
        var index2 = 0
        var index3 = 0
        var index5 = 0
        
        for _ in 1...n {
            let next = min(uglyNums[index2] * 2, uglyNums[index3] * 3, uglyNums[index5] * 5)
            uglyNums.append(next)
            while uglyNums[index2] * 2 <= next {
                index2 += 1
            }
            
            while uglyNums[index3] * 3 <= next {
                index3 += 1
            }
            
            while uglyNums[index5] * 5 <= next {
                index5 += 1
            }
        }
        return uglyNums[n - 1]
    }
}
