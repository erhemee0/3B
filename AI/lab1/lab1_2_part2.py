from collections import deque

listOne = deque([12,6, 15, 18,3 , 9,  21])
sortedList = sorted(listOne)

print(sortedList)

sortedList.append(1)
print(sortedList)
sortedList = sorted(sortedList)
print(sortedList)