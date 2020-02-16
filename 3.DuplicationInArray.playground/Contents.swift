import Cocoa

// 面试题 3（一）：找出数组中重复的数字
// 题目：在一个长度为 n 的数组里的所有数字都在 0 到 n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，
// 也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。例如，如果输入长度为 7 的数组 {2, 3, 1, 0, 2, 5, 3}，
// 那么对应的输出是重复的数字 2 或者 3。

// 面试题 3（二）：不修改数组找出重复的数字
// 题目：在一个长度为 n+1 的数组里的所有数字都在 1 到 n 的范围内，所以数组中至
// 少有一个数字是重复的。请找出数组中任意一个重复的数字，但不能修改输入的
// 数组。例如，如果输入长度为 8 的数组 {2, 3, 5, 4, 3, 2, 6, 7}，那么对应的
// 输出是重复的数字 2 或者 3。

class Solution {
    func findRepeatNumber(_ nums:inout [Int]) -> Int {
        if nums.contains(where: { $0 >= nums.count || $0 < 0}) {
            return -1
        }
        for i in 0..<nums.count {
            while nums[i] != i {
                // 和即将交换的相等
                if nums[i] == nums[nums[i]] {
                    return nums[i]
                }
                // 将 nums[i] 放到正确位置上
                nums.swapAt(i, nums[i])
            }
        }
        return -1
    }
    
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var array = (0...nums.count).map{ $0 }
        for num in nums {
            if array[num] == 0 {
                array[num] = 1
            } else {
                return num
            }
        }
        return -1
    }
}

