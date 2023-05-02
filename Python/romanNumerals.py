class Solution(object):
    def romanToInt(self, s):
        roman_map = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
        result = 0
        prev = 0
        
        for c in s:
            curr = roman_map[c]
            result += curr
            if curr > prev:
                result -= 2 * prev
            prev = curr
            
        return result
    
checker = Solution()
print(checker.romanToInt("IV"))