import Cocoa

// 面试题 13：机器人的运动范围
// 题目：地上有一个 m 行 n 列的方格。一个机器人从坐标 (0, 0) 的格子开始移动，它
// 每一次可以向左、右、上、下移动一格，但不能进入行坐标和列坐标的数位之和
// 大于 k 的格子。例如，当 k 为 18 时，机器人能够进入方格 (35, 37)，因为 3+5+3+7=18。
// 但它不能进入方格 (35, 38)，因为 3+5+3+8=19。请问该机器人能够到达多少个格子

class Solution {
    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        var visited = (0..<m).map{ _ in (0..<n).map{ _ in false } }
        
        func count(row:Int, column:Int) -> Int {
            func sum(of num:Int) -> Int {
                var sum = 0
                var num = num
                while num > 0{
                    sum += num % 10
                    num /= 10
                }
                return sum
            }
            
            if row >= 0 && row < m
                && column >= 0 && column < n
                && sum(of: row) + sum(of: column) <= k
                && !visited[row][column] {
                
                visited[row][column] = true
                return 1 + count(row: row - 1, column: column)
                    + count(row: row + 1, column: column)
                    + count(row: row, column: column - 1)
                    + count(row: row, column: column + 1)
            }
            
            return 0
        }
        
        return count(row: 0, column: 0)
    }
}

