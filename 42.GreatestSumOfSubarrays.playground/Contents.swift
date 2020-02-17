import Cocoa

// 面试题 42：连续子数组的最大和
// 题目：输入一个整型数组，数组里有正数也有负数。数组中一个或连续的多个整
// 数组成一个子数组。求所有子数组的和的最大值。要求时间复杂度为 O (n)。

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var curSum = 0
        var answer = Int.min
        
        for num in nums {
            curSum = max(num, curSum + num)
            answer = max(answer, curSum)
        }
        
        return answer
    }
}
