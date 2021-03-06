import Cocoa

// 面试题 56（一）：数组中只出现一次的两个数字
// 题目：一个整型数组里除了两个数字之外，其他的数字都出现了两次。请写程序
// 找出这两个只出现一次的数字。要求时间复杂度是 O (n)，空间复杂度是 O (1)。

class Solution {
    func singleNumbers(_ nums: [Int]) -> [Int] {
        var set = Set<Int>()
        for num in nums {
            if set.remove(num) == nil {
                set.insert(num)
            }
        }
        return Array(set)
    }
}
