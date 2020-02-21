import Cocoa

// 面试题 63：股票的最大利润
// 题目：假设把某股票的价格按照时间先后顺序存储在数组中，请问买卖交易该股
// 票可能获得的利润是多少？例如一只股票在某些时间节点的价格为 {9, 11, 8, 5,
// 7, 12, 16, 14}。如果我们能在价格为 5 的时候买入并在价格为 16 时卖出，则能
// 收获最大的利润 11。

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // 第一位用于存储当前最小值
        var mins = [Int.max]
        for price in prices.dropLast() {
            let curMin = min(mins[0], price)
            mins[0] = curMin
            mins.append(curMin)
        }
        
        var answer = 0
        //从第二位起算
        for (price, min) in zip(prices, mins).dropFirst() {
            answer = max(answer, price - min)
        }
        return answer
    }
}
