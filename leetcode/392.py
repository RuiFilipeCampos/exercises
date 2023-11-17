class Solution:
    def isSubsequence(self, sub_sequence: str, sequence: str) -> bool:
        """ return true if s is a subsequence of t, or false otherwise """

        for char_0 in sub_sequence:
            for i, char_1 in enumerate(sequence): 
                if char_1 == char_0:
                    sequence = sequence[i + 1:]
                    break
            else:
                return False
        return True



        