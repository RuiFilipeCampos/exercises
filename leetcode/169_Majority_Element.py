""" https://leetcode.com/problems/majority-element"""

class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        return majority_element(nums)


def majority_element(nums: List[int]) -> int:
    len_nums = len(nums)

    table_of_occurences = defaultdict(lambda : 0)

    for num in nums:
        table_of_occurences[num] += 1

    for num, freq in table_of_occurences.items():
        if freq > len_nums / 2:
            return num
