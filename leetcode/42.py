




class Solution:
    def trap(self, height: List[int]) -> int:
        i, j = 0, 1
        len_height = len(height)

        water = 0
        potential_water = 0

        while j < len_height:

            if height[i] > height[j]:
                height_of_water = height[i] - height[j]
                potential_water += height_of_water
                j += 1

            elif height[i] <= height[j]:
                water += potential_water
                potential_water = 0
                i = j
                j += 1

            else:
                raise RuntimeError("Data integrity error: Height values are not consistent")

        if height[i] <= height[j - 1]:
            return water

        height = height[i:]
        height.reverse()

        i, j = 0, 1
        len_height = len(height)

        # water = 0
        potential_water = 0

        while j < len_height:

            if height[i] > height[j]:
                height_of_water = height[i] - height[j]
                potential_water += height_of_water
                j += 1

            elif height[i] <= height[j]:
                water += potential_water
                potential_water = 0
                i = j
                j += 1

            else:
                raise RuntimeError("Data integrity error: Height values are not consistent")


        return water


