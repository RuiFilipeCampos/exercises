import math

def construct_frequency_table(nums: List[int]) -> Dict[int, int]:
    frequency_table = dict()

    for num in nums:
        if not frequency_table.get(num, False):
            frequency_table[num] = 1
            continue

        frequency_table[num] += 1

    return frequency_table


def iterate_complement_of_positive(value, frequency_table):
    max_complement = math.floor(value/2) + 1
    triplets_found = []

    frequency_table[value] -= 1

    for first_complement in range(1, max_complement):

        first_complement *= -1

        if first_complement not in frequency_table:
            continue
        
        if frequency_table[first_complement] == 0:
            continue
        
        frequency_table[first_complement] -= 1

        second_complement = value + first_complement
        second_complement *= -1

        if second_complement not in frequency_table:
            frequency_table[first_complement] += 1
            continue
        
        if frequency_table[second_complement] == 0:
            frequency_table[first_complement] += 1
            continue

        frequency_table[first_complement] += 1
        triplets_found += [[value, first_complement, second_complement]]


    frequency_table[value] += 1
    return triplets_found


def iterate_complement_of_negative(value, frequency_table):
    max_complement = math.floor(-value/2) + 1
    triplets_found = []

    frequency_table[value] -= 1

    for first_complement in range(1, max_complement):

        if first_complement not in frequency_table:
            continue
        
        if frequency_table[first_complement] == 0:
            continue
        
        frequency_table[first_complement] -= 1

        second_complement = value + first_complement
        second_complement *= -1

        if second_complement not in frequency_table:
            frequency_table[first_complement] += 1
            continue
        
        if frequency_table[second_complement] == 0:
            frequency_table[first_complement] += 1
            continue

        frequency_table[first_complement] += 1
        triplets_found += [[value, first_complement, second_complement]]


    frequency_table[value] += 1
    return triplets_found


def iterate_complement_of_zero(value, frequency_table):
    triplets_found = []
    for value in frequency_table:
        if value == 0:
            continue

        if -value in frequency_table:
            triplets_found += [[value, 0, -value]]

    return triplets_found


class Solution:

    def threeSum(self, nums: List[int]) -> List[List[int]]:


        if len(nums) == 3:
            if nums[0] + nums[1] + nums[2] == 0:
                return [nums]
            return []

        frequency_table = construct_frequency_table(nums)


        if 0 in frequency_table and frequency_table[0] >= 3:
            triplets = [[0, 0, 0]]
        else:
            triplets = []

        for value in frequency_table:
            if value > 0:
                triplets += iterate_complement_of_positive(value, frequency_table)

            elif value < 0:
                triplets += iterate_complement_of_negative(value, frequency_table)

            elif value == 0:
                triplets += iterate_complement_of_zero(value, frequency_table)
            else:
                raise RuntimeError("Value makes no sense.")

        triplets = set(tuple(sorted(triplet)) for triplet in triplets)
        return [list(triplet) for triplet in triplets]



        