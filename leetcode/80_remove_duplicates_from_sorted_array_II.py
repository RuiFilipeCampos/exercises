class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        return remove_duplicates(nums)


from collections import defaultdict

NonDecresingList = List

def remove_duplicates(nums: NonDecresingList[int]) -> int:
    """
    
    remove some duplicates in-place such that 
    each unique element appears at most twice.
    
    The relative order of the elements should be kept the same.
    
    """
   
    table_of_ocurrences = defaultdict(lambda : 0)
    for value in nums:
        if table_of_ocurrences[value] < 2:
            table_of_ocurrences[value] += 1

    reader = 0
    writer = 0
    while reader < len(nums):
        value = nums[reader]
        reader += 1
        if table_of_ocurrences[value] == 0:
            continue

        nums[writer] = value
        writer += 1
        table_of_ocurrences[value] -= 1
        
    return writer

        
