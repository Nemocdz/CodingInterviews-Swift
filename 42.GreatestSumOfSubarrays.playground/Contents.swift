import Cocoa

// 面试题 42：连续子数组的最大和
// 题目：输入一个整型数组，数组里有正数也有负数。数组中一个或连续的多个整
// 数组成一个子数组。求所有子数组的和的最大值。要求时间复杂度为 O (n)。

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var dp = nums
        var answer = dp[0]
        
        for i in 1..<nums.count {
            dp[i] = max(dp[i], dp[i - 1] + dp[i])
            answer = max(answer, dp[i])
        }

        return answer
    }
}
