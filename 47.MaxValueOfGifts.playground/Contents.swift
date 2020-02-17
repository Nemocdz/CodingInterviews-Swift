import Cocoa

// 面试题 47：礼物的最大价值
// 题目：在一个 m×n 的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值
// （价值大于 0）。你可以从棋盘的左上角开始拿格子里的礼物，并每次向左或
// 者向下移动一格直到到达棋盘的右下角。给定一个棋盘及其上面的礼物，请计
// 算你最多能拿到多少价值的礼物？

class Solution {
    func maxValue(_ grid: [[Int]]) -> Int {
        var maxGrid = grid.map{ $0.map{ $0 } }
        
        let height = grid.count
        let width = grid.first?.count ?? 0
        
        for row in 0..<height {
            for column in 0..<width {
                let left = column > 0 ? maxGrid[row][column - 1] : 0
                let up = row > 0 ? maxGrid[row - 1][column] : 0
                maxGrid[row][column] = maxGrid[row][column] + max(left, up)
            }
        }
        
        return maxGrid.last?.last ?? 0
    }
}
