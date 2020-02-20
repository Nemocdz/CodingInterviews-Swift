import Cocoa

// 面试题 60：n 个骰子的点数
// 题目：把 n 个骰子扔在地上，所有骰子朝上一面的点数之和为 s。输入 n，打印出 s
// 的所有可能的值出现的概率。

class Solution {
    func twoSum(_ n: Int) -> [Double] {
        var results = [[Int]](repeating: [Int](repeating: 0, count: 6 * n + 1), count: n + 1)
        
        for i in 1...6 {
            results[1][i] = 1
        }
        
        if n >= 2{
            for i in 2...n {
                for j in i...(6 * i) {
                    for k in 1...6 {
                        // j > i
                        if i - 1 > j - k {
                            break
                        }
                        results[i][j] = results[i][j] + results[i - 1][j - k]
                    }
                }
            }
        }
        
        let total = pow(6, Double(n))
        
        return (n...6 * n).map{ Double(results[n][$0]) / total }
    }
}

