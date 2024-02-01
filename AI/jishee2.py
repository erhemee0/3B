import collections 


day_1 = ['home','school','restaurant','home']
day_2 = ['home','school','job','home']
day_3 = ['home','school','home']
day_4 = ['home','school','job','home']
day_5 = ['home','school','home']

days = day_1 + day_2 + day_3 + day_4 +day_5


pairs = [(days[i], days[i + 1]) for i in range(len(days) - 1)]

print(collections.Counter(pairs))
