# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        list1_is_none = list1 is None
        list2_is_none = list2 is None

        if list1_is_none and list2_is_none:
            return None

        if list1_is_none:
            return list2
        
        if list2_is_none:
            return list1

        if list1.val > list2.val:
            list1, list2 = list2, list1

        list3 = ListNode(val = list1.val)
        list3_head = list3
        list1 = list1.next
    
        while list1:

            if list1.val > list2.val:
                list1, list2 = list2, list1

            list3.next = ListNode(val = list1.val)
            list3 = list3.next
            list1 = list1.next
        
        list3.next = list2

        return list3_head
