import Cocoa

// 面试题 47：礼物的最大价值
// 题目：在一个 m×n 的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值
// （价值大于 0）。你可以从棋盘的左上角开始拿格子里的礼物，并每次向左或
// 者向下移动一格直到到达棋盘的右下角。给定一个棋盘及其上面的礼物，请计
// 算你最多能拿到多少价值的礼物？

class Solution {
    func maxValue(_ grid: [[Int]]) -> Int {
        var dp = grid
        let height = grid.count
        let width = grid.first?.count ?? 0
        
        for i in 0..<height {
            for j in 0..<width {
                let top = i > 0 ? dp[i - 1][j] : 0
                let left = j > 0 ? dp[i][j - 1] : 0
                dp[i][j] = dp[i][j] + max(top, left)
            }
        }
        
        return dp.last?.last ?? 0
    }
}
