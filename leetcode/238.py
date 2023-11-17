class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:

        len_nums = len(nums)
        nums_left = [1]
        current = 1
        for i in range(1, len_nums):
            current *= nums[i-1]
            nums_left.append(current)

        
        nums.reverse()
        nums_right = [1]
        current = 1
        for i in range(1, len_nums):
            current *= nums[i-1]
            nums_right.append(current)

        nums_right.reverse()

        return [nums_right[i]*nums_left[i] for i in range(len_nums)]
