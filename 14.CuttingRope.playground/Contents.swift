import Cocoa

// 面试题 14：剪绳子
// 题目：给你一根长度为 n 绳子，请把绳子剪成 m 段（m、n 都是整数，n>1 并且 m≥1）。
// 每段的绳子的长度记为 k [0]、k [1]、……、k [m]。k [0]*k [1]*…*k [m] 可能的最大乘
// 积是多少？例如当绳子的长度是 8 时，我们把它剪成长度分别为 2、3、3 的三段，此
// 时得到最大的乘积 18。

class Solution {
    func cuttingRope(_ n: Int) -> Int {
        if n < 2 {
            return 0
        } else if n == 2 {
            return 1
        } else if n == 3 {
            return 2
        }
        
        var dp = (0...n).map{ $0 }
        
        for i in 4...n {
            for j in 1...(i / 2) {
                dp[i] = max(dp[i], dp[j] * dp[i - j])
            }
        }
        
        return dp[n]
    }
}



