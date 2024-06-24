import collections 


day_1 = ['home','school','restaurant','home']
day_2 = ['home','school','job','home']

days = day_1 + day_2

print(collections.Counter(days))