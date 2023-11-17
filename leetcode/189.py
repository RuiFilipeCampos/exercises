class Solution:
    def rotate(self, nums: List[int], k: int) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """

        displacement = k % len(nums)

        if displacement == 0:
            return

        tmp = [None] * len(nums)

        for i, val in enumerate(nums):            
            j = (i + displacement) % len(nums)
            tmp[j] = nums[i]

        for i in range(len(nums)):
            nums[i] = tmp[i]