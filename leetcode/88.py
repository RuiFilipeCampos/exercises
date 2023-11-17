class Solution:
    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:
        """
        Do not return anything, modify nums1 in-place instead.

        nums1: List[int]
            sorted in non-decreasing order
            len(nums1) = m+n
            1 <= m + n <= 200
            if i >= m: nums[i] = 0
            -10e9 <= nums1[i] <= 10e9
        
        m: int (0 <= m <= 200)
            number of elements in nums1
        
        nums2: List[int]
            sorted in non-decreasing order
            -10e9 <= nums2[j] <= 10e9
        
        n: int (0 <= n <= 200)
            number of elements in nums2

            
        Follow up: Can you come up with an algorithm that runs in O(m + n) time?
        """

        if m == 0:
            for i in range(n):
                nums1[i] = nums2[i]
            return

        if n == 0:
            return

        answer = nums1
        nums1 = answer[:m] 

        i = 0
    
        while nums1 and nums2:
            if nums1[0] < nums2[0]:
                answer[i] = nums1.pop(0)
            else:
                answer[i] = nums2.pop(0)
            
            i += 1
        
        if not nums1 and not nums2:
            return

        if not nums1:
            nums1 = nums2

        while nums1:
            answer[i] = nums1.pop(0)
            i += 1
        

        

        




        
