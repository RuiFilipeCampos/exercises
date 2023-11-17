class RandomizedSet:
    values: set[int]


    def __init__(self):
        self.values = set()
        

    def insert(self, val: int) -> bool:
        if not val in self.values:
            self.values.add(val)
            return True
        return False
        
    def remove(self, val: int) -> bool:
        if not val in self.values:
            return False

        self.values.remove(val)
        return True

    def getRandom(self) -> int:
        elements = list(self.values)
        index = int(random.random()*len(elements))
        return elements[index]
        


# Your RandomizedSet object will be instantiated and called as such:
# obj = RandomizedSet()
# param_1 = obj.insert(val)
# param_2 = obj.remove(val)
# param_3 = obj.getRandom()