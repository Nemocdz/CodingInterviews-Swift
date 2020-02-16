import Cocoa

// 面试题 12：矩阵中的路径
// 题目：请设计一个函数，用来判断在一个矩阵中是否存在一条包含某字符串所有
// 字符的路径。路径可以从矩阵中任意一格开始，每一步可以在矩阵中向左、右、
// 上、下移动一格。如果一条路径经过了矩阵的某一格，那么该路径不能再次进入
// 该格子。例如在下面的 3×4 的矩阵中包含一条字符串 “bfce” 的路径（路径中的字
// 母用下划线标出）。但矩阵中不包含字符串 “abfb” 的路径，因为字符串的第一个
// 字符 b 占据了矩阵中的第一行第二个格子之后，路径不能再次进入这个格子。
// A B T G
// C F C S
// J D E H

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var visited = board.map{ $0.map{ _ in false } }
        let height = board.count
        let width = board.first?.count ?? 0

        func find(_ row:Int, _ column:Int, word:String) -> Bool {
            if word.isEmpty {
                return true
            }
            
            if row < 0 || row >= height || column < 0 || column >= width {
                return false
            }
            
            if visited[row][column] {
                return false
            }
            
            var word = word
            let first = word.removeFirst()
            
            if first != board[row][column] {
                return false
            }
            
            visited[row][column] = true
            
            if find(row - 1, column, word: word)
                || find(row + 1, column, word: word)
                || find(row, column - 1, word: word)
                || find(row, column + 1, word: word) {
                return true
            }
            
            visited[row][column] = false
            return false
        }
        
        for row in 0..<height {
            for column in 0..<width {
                if find(row, column, word: word) {
                    return true
                }
            }
        }
        
        return false
    }
}
