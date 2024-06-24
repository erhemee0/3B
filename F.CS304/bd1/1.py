
import pandas as pd
import matplotlib.pyplot as plt
from scipy import stats
df = pd.read_excel('data.xlsx')

x = df['Явсан_км']
y = df['Үнэ'] / 1000000

def assign_color(value):
    if value == 'приус20':
        return 'blue'
    elif value == 'приус30':
        return 'yellow'
    else:
        return 'red'

# Apply color function to create a new column 'color'
df['color'] = df['Машин_нэр'].apply(assign_color)

# Plotting the scatter plot
plt.title('Явсан_км ба Үнийн хамаарал А.Эрхэмбаяр')
plt.xlabel('Явсан_км')
plt.ylabel('Үнэ(сая)')
plt.scatter(x, y, color=df['color'])  # Plotting the scatter plot

# Adding text annotation outside the plot
plt.annotate('приус20 - цэнхэр\nприус30 - шар\nприус41 -улаан', xy=(-0.1, +0.1), xycoords='axes fraction',
             fontsize=10, ha='left', va='top', bbox=dict(boxstyle='round', facecolor='wheat', alpha=0.5))


a, b, r, p, std_err = stats.linregress(x, y) # коэф олох
def myfunc(x):
    return a * x + b

mymodel = list(map(myfunc, x)) # шинэ утга буцаах
print("Regress coefficient: {:.2f}".format(r))

price=myfunc(200000)
print("Үнэ ойролцоогоор: {:.2f}сая".format(price))


plt.plot(x, mymodel)
plt.show()  # Display the plot



