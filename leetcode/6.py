class Solution:
    def convert(self, s: str, numRows: int) -> str:

        if numRows == 1:
            return s
    
        rows = [[] for _ in range(numRows)]
        i = 0
        up = True
        for char in s:
            rows[i].append(char)
            if up:
                if i == numRows - 1:
                    i -= 1
                    up = False
                else:
                    i += 1
            
            elif up is False:
                if i == 0:
                    i += 1
                    up = True
                else:
                    i -= 1
        result = ""

        for row in rows:
            result += "".join(row)
        return result
        