from functools import cache

Infinity = float('+inf')

class Solution:
    def jump(self, nums: List[int]) -> int:

        if len(nums) == 1:
            return 0

        if len(nums) == 2:
            return 1

        @cache
        def do_jump(current: int) -> int | Literal[Infinity]:

            max_jump_size_possible = len(nums) - 1 - current
            max_jump_size = min(nums[current],  max_jump_size_possible)

            if max_jump_size == max_jump_size_possible:
                return 1

            if max_jump_size == 0:
                return float('+inf')

            min_number_jumps = float('+inf')
            for jump_size in range(1, max_jump_size + 1):
                n_jumps = do_jump(current + jump_size)
                if n_jumps < min_number_jumps:
                    min_number_jumps = n_jumps
            return min_number_jumps + 1

        return do_jump(0)