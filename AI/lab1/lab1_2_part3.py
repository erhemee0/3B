listOne = [3, 6, 9, 12, 15, 18, 21]
listTwo = [4, 8, 12, 16, 20, 24, 28]

result =[]
for i in range(len(listOne)):
    if i%2==1:
        result.append(listOne[i])


for i in listTwo:
    if i%2==0:
        result.append(i)

print(result)