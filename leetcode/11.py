class Solution:
    def maxArea(self, height: List[int]) -> int:

        i, j = 0, len(height) - 1

        def calculate_area(a, b):
            return min(height[a], height[b]) * (b  - a)


        max_area = 0

        while j > i:
            area = calculate_area(i, j)
            if area > max_area:
                max_area = area

            if height[i] <= height[j]:
                i += 1
            else:
                j -= 1

        return max_area



        