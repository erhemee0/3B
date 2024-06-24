import numpy as np
from matplotlib import pyplot as plt

def manhattan_distance(x1, x2):
    return sum(np.abs(x1 - x2))

def kmeans_manhattan(X, n_clusters, max_iter=100):
    centroids = X[np.random.choice(X.shape[0], n_clusters, replace=False)]
    prev_centroids = np.zeros(centroids.shape)
    clusters = np.zeros(len(X))
    iter_count = 0
    
    while not np.array_equal(centroids, prev_centroids) and iter_count < max_iter:
        for i in range(len(X)):
            distances = [manhattan_distance(X[i], centroid) for centroid in centroids]
            clusters[i] = np.argmin(distances)
        
        prev_centroids = np.copy(centroids)
        for i in range(n_clusters):
            cluster_points = [X[j] for j in range(len(X)) if clusters[j] == i]
            centroids[i] = np.mean(cluster_points, axis=0)
        
        iter_count += 1
    
    return clusters, centroids


np.random.seed()
X, _ = np.random.randn(1000, 2), None
n_clusters = 6
cluster_labels, centroids = kmeans_manhattan(X, n_clusters)

colors = ['r', 'g', 'b','y','c','g']
for i in range(n_clusters):
    cluster_points = np.array([X[j] for j in range(len(X)) if cluster_labels[j] == i])
    plt.scatter(cluster_points[:,0], cluster_points[:,1], c=colors[i], label=f'Cluster {i+1}')

plt.scatter(centroids[:,0], centroids[:,1], marker='x', s=150, c='black', label='Centroids')
plt.title('KMeans Clustering with Manhattan Distance')
plt.legend()
plt.show()