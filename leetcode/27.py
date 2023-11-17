class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        """
        nums: List[int]
            0 <= nums[i] <= 50

        val: int
            0 <= val <= 100
        
        returns
            the number of elements in nums which are not equal to val


        NOTE Change the array nums such that the first k elements of nums contain
        the elements which are not equal to val. The remaining elements of nums are
        not important as well as the size of nums.
        """

    
        # 0 <= nums.length <= 100
        len_nums = len(nums)

        if val > 50:
            return len_nums

        if len_nums == 0:
            return 0

        
        second = len_nums - 1
        
        while nums[second] == val:
            second -= 1
            if second == -1:
                return 0

        assert second >= 0, "Second pointer has invalid index."

        # [2,2,3,3]

    
        first = 0

        while first <= second:
            if nums[first] != val:
                first += 1
                continue

            nums[first], nums[second] = nums[second], nums[first]

            while second >= 0 and nums[second] == val:
                second -= 1

            first += 1
        
        return first 
        
