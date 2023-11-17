class Solution:
    def maxProfit(self, prices: List[int]) -> int:

        tmp_stock = prices[0]
        profit = 0
        for price in prices[1:]:

            if price < tmp_stock:
                tmp_stock = price

            elif price - tmp_stock > 0:
                profit += price - tmp_stock
                tmp_stock = price


        
        return profit 