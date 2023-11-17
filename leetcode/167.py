class Solution:
    def twoSum(self, numbers: List[int], target: int) -> List[int]:

        len_numbers = len(numbers)
        i, j = 0, len_numbers - 1

        while i < j:

            current_total = numbers[j] + numbers[i]

            if current_total == target:
                return [i + 1, j + 1]
            elif current_total < target:
                i += 1
            elif current_total > target:
                j -= 1
            else:
                raise RuntimeError('This is impossible.')

        return []
            

            


            
        
