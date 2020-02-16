import Cocoa

// 面试题 4：二维数组中的查找
// 题目：在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按
// 照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个
// 整数，判断数组中是否含有该整数。

class Solution {
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.first?.first == nil {
            return false
        }
        
        let height = matrix.count
        let width = matrix.first?.count ?? 0
        
        var row = 0
        var column = width - 1
        
        while row < height && column >= 0 {
            let num = matrix[row][column]
            if num > target {
                column -= 1
            } else if num < target {
                row += 1
            } else {
                return true
            }
        }
        return false
    }
}

