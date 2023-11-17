class Solution:
    def canJump(self, nums: List[int]) -> bool:

        if len(nums) == 1:
            return True

        cache = {}

        def perform_jump(current: int) -> bool:

            if current in cache:
                return cache[current]

            if current == len(nums) - 1:
                cache[current] = True
                return cache[current]

            distance_to_end = len(nums) - current
            max_jumps = nums[current]
            max_jumps = min(max_jumps, distance_to_end)

            if max_jumps == distance_to_end:
                return True

            for jump in range(1, max_jumps + 1):
                if perform_jump(current + jump):
                    cache[current] = True
                    return cache[current]
            else:
                cache[current] = False
                return cache[current]

        return perform_jump(0) 

