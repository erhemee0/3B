import pygame
import random
import copy

class TicTacToeState:
    def __init__(self, size):
        self.size = size
        # Init empty board
        self.emptyBoard()
        self.choice = ()
        self.turn = 0

    def emptyBoard(self):
        self.board = [[-1 for _ in range(self.size)] for _ in range(self.size)]

    # Str repr of positions
    pos2strMap = {
        -1: '   ',  # Empty
        0: ' O ',  # Player 0 (human)
        1: ' X '}  # Player 1 (computer)

    def pos2str(self, n):
        return TicTacToeState.pos2strMap[n]
    
    def hasEnded(self):
        return any([self.playerWinner(), self.computerWinner(), self.noMoreMoves()])

    def isDraw(self):
        return not self.playerWinner() and not self.computerWinner() and self.noMoreMoves()

    def noMoreMoves(self):
        return not any(-1 in row for row in self.board)

    def isWinner(self, who):
        # Check horizontals
        for row in self.board:
            if all(cell == who for cell in row):
                return True
        # Check verticals
        for col in range(self.size):
            if all(row[col] == who for row in self.board):
                return True
        # Check diagonals
        if all(self.board[i][i] == who for i in range(self.size)) or all(self.board[i][self.size - 1 - i] == who for i in range(self.size)):
            return True
        return False

    def playerWinner(self):
        return self.isWinner(0)

    def computerWinner(self):
        return self.isWinner(1)

    def placeMove(self, who, row, col):
        self.verifyValidMove(row, col)
        if self.board[row][col] == -1:
            self.board[row][col] = who
            self.turn = 1 - self.turn
        else:
            raise RuntimeError('Place {0},{1} occupied by {2}'.format(row, col, self.board[row][col]))

    def verifyValidMove(self, row, col):
        if not 0 <= row < self.size or not 0 <= col < self.size:
            raise RuntimeError('Invalid position')

    def placeMovePlayer(self, row, col):
        assert self.turn == 0
        self.placeMove(0, row, col)
        self.turn = 1

    def placeMoveComputer(self, row, col):
        assert self.turn == 1
        self.placeMove(1, row, col)
        self.turn = 0

    def gameScore(self):
        if self.playerWinner():
            return -1
        elif self.computerWinner():
            return 1
        else:
            return 0

    def availableMoves(self):
        return [(row, col) for row in range(self.size) for col in range(self.size) if self.board[row][col] == -1]

    def computerMove(self):
        self.computeNextMoveAt(-999999, 999999)
        self.placeMoveComputer(self.choice[0], self.choice[1])

    def computeNextMoveAt(self, alpha, beta, depth=0):
        # Terminal node or depth limit reached
        if self.hasEnded() or depth == 5:
            return self.gameScore()

        moves = []
        scores = []

        if self.turn == 1:  # Computer's turn (Maximizer)
            move_score = -999999
            for move in self.availableMoves():
                next_state = copy.deepcopy(self)
                next_state.placeMove(next_state.turn, *move)
                move_score = max(move_score, next_state.computeNextMoveAt(alpha, beta, depth + 1))
                alpha = max(alpha, move_score)
                if beta <= alpha:
                    break
                moves.append(move)
                scores.append(move_score)
            if depth == 0:
                self.choice = moves[scores.index(max(scores))]
            return move_score

        if self.turn == 0:  # Player's turn (Minimizer)
            move_score = 999999
            for move in self.availableMoves():
                next_state = copy.deepcopy(self)
                next_state.placeMove(next_state.turn, *move)
                move_score = min(move_score, next_state.computeNextMoveAt(alpha, beta, depth + 1))
                beta = min(beta, move_score)
                if beta <= alpha:
                    break
                moves.append(move)
                scores.append(move_score)
            if depth == 0:
                self.choice = moves[scores.index(min(scores))]
            return move_score


class TicTacToeGUI:
    def __init__(self, size=3):
        self.state = TicTacToeState(size)
        self.size = size
        self.cell_size = 600 // size
        self.width = self.cell_size * size
        self.height = self.cell_size * size
        self.screen = pygame.display.set_mode((self.width, self.height))
        pygame.display.set_caption("Tic Tac Toe")

    def draw_board(self):
        self.screen.fill((255, 255, 255))
        # Draw vertical lines
        for x in range(1, self.size):
            pygame.draw.line(self.screen, (190, 190, 190), (x * self.cell_size, 0), (x * self.cell_size, self.height), 5)

        # Draw horizontal lines
        for y in range(1, self.size):
            pygame.draw.line(self.screen, (190, 190, 190), (0, y * self.cell_size), (self.width, y * self.cell_size), 5)

    def draw_symbols(self):
        for row in range(self.size):
            for col in range(self.size):
                cell_center_x = col * self.cell_size + self.cell_size // 2
                cell_center_y = row * self.cell_size + self.cell_size // 2
                if self.state.board[row][col] == 0:
                    pygame.draw.circle(self.screen, (0, 0, 255), (cell_center_x, cell_center_y), self.cell_size // 3, 10)
                elif self.state.board[row][col] == 1:
                    pygame.draw.line(self.screen, (255, 0, 0), (cell_center_x - self.cell_size // 3.5, cell_center_y + self.cell_size // 3.5),
                                     (cell_center_x + self.cell_size // 3.5, cell_center_y - self.cell_size // 3.5), 12)
                    pygame.draw.line(self.screen, (255, 0, 0), (cell_center_x - self.cell_size // 3.5, cell_center_y - self.cell_size // 3.5),
                                     (cell_center_x + self.cell_size // 3.5, cell_center_y + self.cell_size // 3.5), 12)

    def game_loop(self):
        running = True
        while running:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    running = False
                elif event.type == pygame.MOUSEBUTTONDOWN:
                    x, y = pygame.mouse.get_pos()
                    col = x // self.cell_size
                    row = y // self.cell_size
                    if self.state.board[row][col] == -1:
                        self.state.placeMovePlayer(row, col)
                        if not self.state.hasEnded():
                            self.state.computerMove()

            self.draw_board()
            self.draw_symbols()

            if self.state.playerWinner():
                font = pygame.font.SysFont(None, 120)
                text = font.render("Player Wins!", True, (0, 0, 0))
                text_width, text_height = font.size("Player Wins!")
                text_x = (self.width - text_width) // 2
                text_y = (self.height - text_height) // 2
                self.screen.blit(text, (text_x, text_y))
                running = False
            elif self.state.computerWinner():
                font = pygame.font.SysFont(None, 110)
                text = font.render("Computer Wins!", True, (0, 0, 0))
                text_width, text_height = font.size("Computer Wins!")
                text_x = (self.width - text_width) // 2
                text_y = (self.height - text_height) // 2
                self.screen.blit(text, (text_x, text_y))
                running = False
            elif self.state.isDraw():
                font = pygame.font.SysFont(None, 120)
                text = font.render("Draw!", True, (0, 0, 0))
                text_width, text_height = font.size("Draw!")
                text_x = (self.width - text_width) // 2
                text_y = (self.height - text_height) // 2
                self.screen.blit(text, (text_x, text_y))
                running = False


            pygame.display.flip()

        pygame.time.wait(2000)  # Wait for 2 seconds before quitting
        pygame.quit()


def main():
    pygame.init()
    size_input = input("Enter the size of the board (e.g., 3 for 3x3, 4 for 4x4, etc.): ")
    try:
        size = int(size_input)
        game = TicTacToeGUI(size)
    except ValueError:
        game = TicTacToeGUI()
    game.game_loop()


if __name__ == "__main__":
    main()
