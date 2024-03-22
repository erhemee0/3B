import networkx as nx
import matplotlib.pyplot as plt
from heapq import heappush, heappop

def load_dictionary(file_path):
    """
    files ugnuudig ni unshina
    """
    with open(file_path, "r") as file:
        dictionary_words = file.readlines()
    return set(word.strip().lower() for word in dictionary_words)

def hamming_distance(word1, word2):
    return sum(c1 != c2 for c1, c2 in zip(word1, word2))

def astar_graph_search(initial, goal, dictionary, heuristic=hamming_distance, num_paths=5):

    if initial == goal:
        return [[initial]]

    visited = set()
    paths = []
    queue = [(heuristic(initial, goal), [initial], initial)]

    while queue and len(paths) < num_paths:
        _, path, current_word = heappop(queue)
        visited.add(current_word)

        for i in range(len(current_word)):
            for c in 'abcdefghijklmnopqrstuvwxyz':
                new_word = current_word[:i] + c + current_word[i + 1:]
                if new_word in dictionary and new_word not in visited:
                    new_path = path + [new_word]
                    if new_word == goal:
                        paths.append(new_path)
                        if len(paths) == num_paths:
                            return paths
                    else:
                        priority = len(new_path) + heuristic(new_word, goal)
                        heappush(queue, (priority, new_path, new_word))

    return paths

dictionary = load_dictionary("words_alpha.txt")


initial = "love"
goal = "hate"

# Find word paths using A* search
word_paths_astar = astar_graph_search(initial, goal, dictionary)

print("\nPaths found by A* Search:")
for i, path in enumerate(word_paths_astar, start=1):
    print(f"Path {i}: {' -> '.join(path)}")

G_astar = nx.Graph()

for path in word_paths_astar:
    for i in range(len(path) - 1):
        G_astar.add_edge(path[i], path[i + 1])

# Draw the graph for A* search
plt.figure(figsize=(8, 6))
pos_astar = nx.spring_layout(G_astar)
nx.draw(G_astar, pos_astar, with_labels=True, node_color='skyblue', node_size=1500, edge_color='black', linewidths=1, font_size=10)

main_path = word_paths_astar[0]  
shortest_edges_astar = [(main_path[i], main_path[i + 1]) for i in range(len(main_path) - 1)]
nx.draw_networkx_edges(G_astar, pos_astar, edgelist=shortest_edges_astar, edge_color='red', width=3)

plt.title("Word Paths from {} to {} (A* Search)".format(initial, goal))
plt.tight_layout()
plt.show()
