import Cocoa

// 面试题 63：股票的最大利润
// 题目：假设把某股票的价格按照时间先后顺序存储在数组中，请问买卖交易该股
// 票可能获得的利润是多少？例如一只股票在某些时间节点的价格为 {9, 11, 8, 5,
// 7, 12, 16, 14}。如果我们能在价格为 5 的时候买入并在价格为 16 时卖出，则能
// 收获最大的利润 11。

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty {
            return 0
        }
        
        var buyMin = prices.first!
        var answer = 0
        
        for price in prices.dropFirst() {
            answer = max(answer, price - buyMin)
            buyMin = min(buyMin, price)
        }
        
        return answer
    }
}
