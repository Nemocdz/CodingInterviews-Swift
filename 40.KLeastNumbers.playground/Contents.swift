import Cocoa

// 面试题40：最小的k个数
// 题目：输入n个整数，找出其中最小的k个数。例如输入4、5、1、6、2、7、3、8
// 这8个数字，则最小的4个数字是1、2、3、4。


class Solution {
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        if k == 0 {
            return []
        }
        
        func partition(_ arr: inout [Int], _ start: Int, _ end: Int) -> Int {
            var start = start
            var end = end
            let flag = arr[start]
            
            while start < end {
                while start < end && arr[end] >= flag {
                    end -= 1
                }
                
                if start < end {
                    arr.swapAt(start, end)
                    start += 1
                }
                
                while start < end && arr[start] <= flag {
                    start += 1
                }
                
                if start < end {
                    arr.swapAt(start, end)
                    end -= 1
                }
            }
            return start
        }
        
        var arr = arr
        var start = 0
        var end = arr.count - 1
        
        while true {
            let index = partition(&arr, start, end)
            if index > k - 1 {
                end = index - 1
            } else if index < k - 1 {
                start = index + 1
            } else {
                break
            }
        }
        return Array(arr[0..<k])
    }
}
