import Cocoa

// 面试题21：调整数组顺序使奇数位于偶数前面
// 题目：输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有
// 奇数位于数组的前半部分，所有偶数位于数组的后半部分。

class Solution {
    func exchange(_ nums: [Int]) -> [Int] {
        var start = 0
        var end = nums.count - 1
        
        var answers = nums
        
        while start < end {
            while start < end && answers[start] % 2 == 1 {
                start += 1
            }
            
            while end > start && answers[end] % 2 == 0 {
                end -= 1
            }
            
            if start < end {
                answers.swapAt(start, end)
            }
        }
        
        return answers
    }
}

Solution().exchange([1,2,3,4])
