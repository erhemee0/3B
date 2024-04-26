from scipy.spatial import distance
from sklearn.metrics.pairwise import cosine_similarity
import numpy as np

x = np.array([1, 2])
y = np.array([4, 6])

def euclidean_distance(point1, point2):
    return ((point1[0] - point2[0])**2 + (point1[1] - point2[1])**2)**0.5

def manhattan_distance(point1, point2):
    return abs(point1[0] - point2[0]) + abs(point1[1] - point2[1])

def cosine_similarity(point1, point2):
    dot_product = sum(x * y for x, y in zip(point1, point2))
    norm_point1 = sum(x ** 2 for x in point1) ** 0.5
    norm_point2 = sum(x ** 2 for x in point2) ** 0.5
    return dot_product / (norm_point1 * norm_point2)

euclidean_dst = distance.euclidean(x, y)
manhattan_dst = distance.cityblock(x, y)
cos_sim = cosine_similarity(x, y)

euclidean = euclidean_distance(x, y)
manhattan = manhattan_distance(x, y)
cos = cosine_similarity(x, y)

print('euclidean (library): %.3f' % euclidean_dst)
print('euclidean: %.3f' % euclidean)
print('manhattan (library): %.3f' % manhattan_dst)
print('manhattan: %.3f' % manhattan)
print('cosine (library): %.3f' % cos_sim)
print('cosine: %.3f' % cos)