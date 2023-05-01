class Solution(object):
    def isPalindrome(self, x):
        polindrom = str(x)[::-1]
        if str(x) == polindrom:
            return True
        else:
            return False


checker = Solution()
print(checker.isPalindrome(12321))
