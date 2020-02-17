import Cocoa

// 面试题 29：顺时针打印矩阵
// 题目：输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字。


class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.first?.first == nil {
            return []
        }
        
        let height = matrix.count
        let width = matrix.first?.count ?? 0
        
        var start = 0
        var answers = [Int]()
        while height > start * 2 && width > start * 2 {
            let endX = width - 1 - start
            let endY = height - 1 - start
            
            // 左上 -> 右上
            for i in start...endX {
                answers.append(matrix[start][i])
            }
            
            // 左上下1 -> 右下
            if start < endY {
                for i in (start + 1)...endY {
                    answers.append(matrix[i][endX])
                }
            }
            
            // 右下左1 -> 左下
            if start < endX && start < endY {
                for i in (start...(endX - 1)).reversed() {
                    answers.append(matrix[endY][i])
                }
            }
            
            // 左下上1 -> 右上下1
            if start < endX && start < endY - 1 {
                for i in ((start + 1)...(endY - 1)).reversed() {
                    answers.append(matrix[i][start])
                }
            }
            
            start += 1
        }
        
        return answers
    }
}
