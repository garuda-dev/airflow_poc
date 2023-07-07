#find 2nd highest number in the list
#this is one pass solution, means we iterate over a list only once, so time complexity is O(n). 
#this is without sorting, sorting would require O(n log n)
#space complexity os this method is O(1) i.e constant. Because irrespectivce of size of the list, we are using fixed amount of extra space(two variables - first & second). 
#input list itself is not counted in space complexity, only extra space used by the algorithm is counted. 

l1 = [10,8,3,6,2]

first = float('-inf')
second = float('-inf')
for num in l1:
    if num > first:
        second = first
        first = num
    elif first > num > second:
        second = num

print(second)
        
