import random
from jishee import *

class EightPuzzle(Problem):
    def __init__(self, initial=None):
        if initial is None:
            initial = self.generate_random_state()
        super().__init__(initial)
        self.goal = (0, 1, 2, 3, 4, 5, 6, 7, 8) # Define the goal state
        self.rows = 3
        self.cols = 3
    
    def generate_random_state(self):
        """Generate a random initial state."""
        tiles = list(range(9))  # Tiles are numbered from 0 to 8
        random.shuffle(tiles)
        return tuple(tiles)
    
    def actions(self, state):
        """Return a list of possible actions."""
        possible_actions = []
        empty_index = state.index(0)
        row, col = empty_index // self.cols, empty_index % self.cols

        # Check possible moves: left, right, up, down
        if col > 0:
            possible_actions.append('left')
        if col < self.cols - 1:
            possible_actions.append('right')
        if row > 0:
            possible_actions.append('up')
        if row < self.rows - 1:
            possible_actions.append('down')

        return possible_actions
    
    def result(self, state, action):
        """Return the new state after applying the action."""
        empty_index = state.index(0)
        row, col = empty_index // self.cols, empty_index % self.cols

        if action == 'left':
            new_col = col - 1
            new_index = row * self.cols + new_col
        elif action == 'right':
            new_col = col + 1
            new_index = row * self.cols + new_col
        elif action == 'up':
            new_row = row - 1
            new_index = new_row * self.cols + col
        elif action == 'down':
            new_row = row + 1
            new_index = new_row * self.cols + col

        new_state = list(state)
        new_state[empty_index], new_state[new_index] = new_state[new_index], new_state[empty_index]

        return tuple(new_state)
    
    def goal_test(self, state):
        """Check if the current state is the goal state."""
        return state == self.goal
    
    def depth_first_search(problem):
        """Depth-first search."""
        frontier = [Node(problem.initial)]  # Stack
        explored = set()

        while frontier:
            node = frontier.pop()
            if problem.goal_test(node.state):
                return node
            explored.add(node.state)

            for action in problem.actions(node.state):
                child_state = problem.result(node.state, action)
                if child_state not in explored:
                    child_node = node.child_node(problem, action)
                    frontier.append(child_node)
        return None
    
    def breadth_first_search(problem):
        """Breadth-first search."""
        frontier = deque([Node(problem.initial)])  # FIFO queue
        explored = set()

        while frontier:
            node = frontier.popleft()
            if problem.goal_test(node.state):
                return node
            explored.add(node.state)

            for action in problem.actions(node.state):
                child_state = problem.result(node.state, action)
                if child_state not in explored:
                    child_node = node.child_node(problem, action)
                    frontier.append(child_node)
                    explored.add(child_state)  # Add to explored set here to avoid duplicates
        return None
    
# Test the 3x3 puzzle solver with random initial state
# eight_puzzle = EightPuzzle()
eight_puzzle = EightPuzzle((1, 2, 0, 3, 4, 5, 6, 7, 8))
print("Initial state:", eight_puzzle.initial)
solution_node = EightPuzzle.depth_first_search(eight_puzzle)
if solution_node:
    solution_path = solution_node.solution()
    print("Solution found with {} moves:".format(len(solution_path)))
    for action in solution_path:
        print(action)
else:
    print("No solution found.")

solution_node = EightPuzzle.breadth_first_search(eight_puzzle)
if solution_node:
    solution_path = solution_node.solution()
    print("Solution found with {} moves:".format(len(solution_path)))
    for action in solution_path:
        print(action)
else:
    print("No solution found.")
