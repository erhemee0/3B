import random
from collections import deque
from jishee import *


class ThreeByThreeMatrixProblem(Problem):
    def __init__(self, initial=None):
        if initial is None:
            initial = self.generate_random_state()
        super().__init__(initial)
        self.goal = ((1, 2, 3), (4, 5, 6), (7, 8, 0))  # Define the goal state
    
    def generate_random_state(self):
        """Generate a random initial state."""
        numbers = list(range(1, 9)) + [0]  # Numbers 0 to 8
        random.shuffle(numbers)
        state = [numbers[i:i+3] for i in range(0, 9, 3)]
        return tuple(map(tuple, state))
    
    def actions(self, state):
        """Return a list of possible actions."""
        possible_actions = []
        row, col = self.find_zero(state)

        if col > 0:
            possible_actions.append('left')
        if col < 2:
            possible_actions.append('right')
        if row > 0:
            possible_actions.append('up')
        if row < 2:
            possible_actions.append('down')

        return possible_actions
    
    def result(self, state, action):
        """Return the new state after applying the action."""
        row, col = self.find_zero(state)

        if action == 'left':
            new_state = self.swap(state, row, col, row, col - 1)
        elif action == 'right':
            new_state = self.swap(state, row, col, row, col + 1)
        elif action == 'up':
            new_state = self.swap(state, row, col, row - 1, col)
        elif action == 'down':
            new_state = self.swap(state, row, col, row + 1, col)

        return new_state
    
    def goal_test(self, state):
        """Check if the current state is the goal state."""
        return state == self.goal
    
    def find_zero(self, state):
        """Find the position of the zero in the state."""
        for i in range(3):
            for j in range(3):
                if state[i][j] == 0:
                    return i, j
    
    def swap(self, state, i1, j1, i2, j2):
        """Swap two elements in the state."""
        state = list(map(list, state))
        state[i1][j1], state[i2][j2] = state[i2][j2], state[i1][j1]
        return tuple(map(tuple, state))
    
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
    
# Test the 3x3 matrix solver with random initial state
three_by_three_matrix_problem = ThreeByThreeMatrixProblem()
# three_by_three_matrix_problem = ThreeByThreeMatrixProblem(((1, 2, 0), (4, 5, 3), (7, 8, 6)))
print("Initial state:")
for row in three_by_three_matrix_problem.initial:
    print(row)
solution_node = ThreeByThreeMatrixProblem.breadth_first_search(three_by_three_matrix_problem)
if solution_node:
    solution_path = solution_node.solution()
    print("\nSolution found with {} moves:".format(len(solution_path)))
    # for action in solution_path:
        # print(action)
else:
    print("No solution found.")
solution_node = ThreeByThreeMatrixProblem.depth_first_search(three_by_three_matrix_problem)
if solution_node:
    solution_path = solution_node.solution()
    print("\nSolution found with {} moves:".format(len(solution_path)))
    # for action in solution_path:
    #     print(action)
else:
    print("No solution found.")