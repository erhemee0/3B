import pandas as pd
from pandas.api.types import is_numeric_dtype 
import matplotlib.pyplot as plt


data = pd.read_csv('https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data',header=None)
data.columns = ['sepal length','sepal width','petal length','petal width','class']
print(data.head())

for col in data.columns:
    if is_numeric_dtype(data[col]):
        print('%s:' % (col))
        print('\t dundaj utga = %.2f' % data[col].mean())
        print('\t standart hazailt = %.2f' % data[col].std())
        print('\t min = %.2f' % data[col].min())
        print('\t max = %.2f' % data[col].max())

print(data['class'].value_counts())

print(data.describe(include='all'))

# print('Covariance')
# print(data.cov())

# print('Correlation')
# print(data.corr())

# data['sepal length'].hist(bins=8)
# data.boxplot()

# fig, axes = plt.subplots(3,2,figsize =(12,12))
# index = 0
# for i in range(3):
#     for j in range(i+1,4):
#         ax1 = int(index/2)
#         ax2 = index %2
#         axes[ax1,ax2].scatter(data[data.columns[i]],data[data.columns[j]],color='red')
#         axes[ax1,ax2].set_xlabel(data.columns[i])
#         axes[ax1,ax2].set_ylabel(data.columns[j])
#         index = index + 1


from pandas.plotting import parallel_coordinates
parallel_coordinates(data,'class')

plt.show()
