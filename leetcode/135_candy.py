class Solution:
    def candy(self, ratings: List[int]) -> int:

        candies_1 = [1]*len(ratings)
        for i in range(1, len(ratings)):
            if ratings[i] > ratings[i - 1]:
                candies_1[i] = 1 + candies_1[i-1]

        ratings.reverse()
        candies_2 = [1]*len(ratings)
        for i in range(1, len(ratings)):
            if ratings[i] > ratings[i - 1]:
                candies_2[i] = 1 + candies_2[i-1]
            
        candies_2.reverse()
        candies = []
        for c1, c2 in zip(candies_1, candies_2):
            candies.append(max(c1, c2))

        return sum(candies)
        


