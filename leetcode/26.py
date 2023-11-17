class Solution:



    def removeDuplicates(self, nums: List[int]) -> int:

        i, j = 0, 1 # O(1)
        len_nums = len(nums)  # O(1)

        while j != len_nums:  # O(N)
            
            if nums[i] == nums[j]:
                j += 1
                continue

            i += 1
            nums[i] = nums[j]
            j += 1

        return i + 1
