import Cocoa

// 面试题 53（一）：数字在排序数组中出现的次数
// 题目：统计一个数字在排序数组中出现的次数。例如输入排序数组 {1, 2, 3, 3,
// 3, 3, 4, 5} 和数字 3，由于 3 在这个数组中出现了 4 次，因此输出 4。

// 面试题 53（二）：0 到 n-1 中缺失的数字
// 题目：一个长度为 n-1 的递增排序数组中的所有数字都是唯一的，并且每个数字
// 都在范围 0 到 n-1 之内。在范围 0 到 n-1 的 n 个数字中有且只有一个数字不在该数组
// 中，请找出这个数字。

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        let leftIndex: Int = {
            var start = 0
            var end = nums.count - 1
            while start <= end {
                let mid = (start + end) / 2
                if nums[mid] > target {
                    end = mid - 1
                } else if nums[mid] < target {
                    start = mid + 1
                } else {
                    end = mid - 1
                }
            }
            
            if start > nums.count - 1 || nums[start] != target {
                return -1
            }
            return start
        }()
        
        let rightIndex: Int = {
            var start = 0
            var end = nums.count - 1
            while start <= end {
                let mid = (start + end) / 2
                if nums[mid] > target {
                    end = mid - 1
                } else if nums[mid] < target {
                    start = mid + 1
                } else {
                    start = mid + 1
                }
            }
            
            if end < 0 || nums[end] != target {
                return -1
            }
            return end
        }()
        
        if leftIndex >= 0 && rightIndex >= 0 {
            return rightIndex - leftIndex + 1
        }
        
        return 0
    }
    
    func missingNumber(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return -1
        }
        
        var start = 0
        var end = nums.count - 1
        
        while start <= end {
            let mid = (start + end) / 2
            if nums[mid] == mid {
                start = mid + 1
            } else {
                if mid == 0 || nums[mid - 1] == mid - 1 {
                    return mid
                } else {
                    end = mid - 1
                }
            }
        }
        
        return start == nums.count ? start : -1
    }
}



