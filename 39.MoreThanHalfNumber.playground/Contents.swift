import Cocoa

// 面试题 39：数组中出现次数超过一半的数字
// 题目：数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。例
// 如输入一个长度为 9 的数组 {1, 2, 3, 2, 2, 2, 5, 4, 2}。由于数字 2 在数组中
// 出现了 5 次，超过数组长度的一半，因此输出 2。

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return -1
        }
        
        var answer = nums.first!
        var times = 1
        
        for num in nums.dropFirst() {
            if answer == num {
                times += 1
            } else if times == 0 {
                answer = num
                times = 1
            } else {
                times -= 1
            }
        }
        
        return answer
    }
}
