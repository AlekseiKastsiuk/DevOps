class Solution(object):
    def rasd(self, nums):
        new_nums = []
        for i in nums:
            if i not in new_nums:
                new_nums.append(i)

        sorted_list = sorted(new_nums)
        k = len(sorted_list)
        while len(sorted_list) < len(nums):
            sorted_list.append("")
        
   
        return k, sorted_list

         

print(Solution().rasd([1,2,10,3,3,3,1,4,5,6]))