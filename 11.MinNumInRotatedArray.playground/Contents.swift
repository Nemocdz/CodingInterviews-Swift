import Cocoa

// 面试题 11：旋转数组的最小数字
// 题目：把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。
// 输入一个递增排序的数组的一个旋转，输出旋转数组的最小元素。例如数组
// {3, 4, 5, 1, 2} 为 {1, 2, 3, 4, 5} 的一个旋转，该数组的最小值为 1。

class Solution {
    func minArray(_ numbers: [Int]) -> Int {
        var start = 0
        var end = numbers.count - 1
        
        while start < end {
            let mid = (start + end) / 2
            
            if numbers[mid] < numbers[end] {
                end = mid
            } else if numbers[mid] > numbers[end] {
                start = mid + 1
            } else {
                if numbers[start] == numbers[mid] {
                    start += 1
                } else {
                    end = mid
                }
            }
        }
        
        return numbers[start]
    }
}


