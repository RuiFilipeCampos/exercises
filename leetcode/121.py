class Solution:
    def maxProfit(self, prices: List[int]) -> int:


        current_profit = 0
        buying_price = prices[0]
        len_prices = len(prices)

        for k in range(1, len_prices):
            price = prices[k]
            new_profit = price - buying_price

            if new_profit > current_profit:
                current_profit = new_profit
            
            if price < buying_price:
                buying_price = price
        
        return current_profit
