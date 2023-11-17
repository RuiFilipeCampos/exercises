

alphabet = set(list(
    'abcdefghijklmnopqrstuvxyzw0123456789'
))

class Solution:
    def isPalindrome(self, s: str) -> bool:
        s = s.lower()

        string = ""

        for char in s:
            print(char)
            if char in alphabet:
                string = string + char

        len_string = len(string)

        j = len_string - 1
        for i in range(len_string):
            if string[i] != string[j]:
                return False
            j -= 1
            
        return True

        


