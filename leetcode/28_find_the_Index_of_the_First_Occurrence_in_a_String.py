""" https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/description/ """

class Solution:
    def strStr(self, haystack: str, needle: str) -> int:

        if needle not in haystack:
            return -1

        haystack = haystack.replace(needle, "*")

        for i in range(len(haystack)):
            if haystack[i] == "*":
                return i
        
