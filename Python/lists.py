class Solution(object):
    def addTwoNumbers(self, l1, l2):
        str1 = "".join(str(item) for item in l1)
        str2 = "".join(str(item) for item in l2)
        return list(map(int, str(int(str1) + int(str2))[::-1]))
         

print(Solution().addTwoNumbers([2,4,3], [5,6,4]))



