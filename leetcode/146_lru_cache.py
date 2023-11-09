
from collections import OrderedDict

class LRUCache:

    # At most 2e5 calls will be made to get and put.

    # 1 <= capacity <= 3000
    _capacity: int
    _table: OrderedDict[int, int]

    def __init__(self, capacity: int):
        """ Initialize the LRU cache with positive size capacity. """
        assert 1 <= capacity <= 3000, "Capacity is not within range."
        self._capacity = capacity
        self._table = OrderedDict[int, int]()

    def get(self, key: int) -> int:
        """ Return the value of the key if the key exists, otherwise return -1. """
        assert 0 <= key <= 1e4, "'key' has invalid value"
    
        value: int | None = self._table.get(key, None)

        if value is None:
            return -1

        self._table.move_to_end(key)
        return value
    

    def put(self, key: int, value: int) -> None:
        """
        Update the value of the key if the key exists.
        Otherwise, add the key-value pair to the cache.
        If the number of keys exceeds the capacity from this
        operation, evict the least recently used key.
        """

        assert 0 <= key <= 1e4, "'key' has invalid value"
        assert 0 <= value <= 1e5, "'value' has invalid value"

        if len(self._table) == self._capacity and key not in self._table:
            self._table.popitem(last=False)

        self._table[key] = value
        self._table.move_to_end(key)



# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache(capacity)
# param_1 = obj.get(key)
# obj.put(key,value)
