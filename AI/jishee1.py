import collections 


day_1 = ['home','school','restaurant','home']
day_2 = ['home','school','job','home']

days = day_1 + day_2

unique_locations = set(days)
for location in unique_locations:
    a = days.count(location)
    # print(location,a)

print(collections.Counter(days))