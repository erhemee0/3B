import pygame
import random
import copy

class TicTacToeState:
    def __init__(self):
        # Init empty board
        self.emptyBoard()
        self.choice = ()
        self.turn = 0

    def emptyBoard(self):
        self.board = [[-1 for _ in range(3)] for _ in range(3)]

    # Str repr of positions
    pos2strMap = {
        -1: '   ',  # Empty
        0: ' O ',  # Player 0 (human)
        1: ' X '}  # Player 1 (computer)

    def pos2str(self, n):
        return TicTacToeState.pos2strMap[n]

    def printBoard(self):
        print("-----------")
        for row in self.board:
            print("{0}|{1}|{2}".format(self.pos2str(row[0]),
                                       self.pos2str(row[1]),
                                       self.pos2str(row[2])))
            print("-----------")

    def hasEnded(self):
        return any([self.playerWinner(), self.computerWinner(), self.noMoreMoves()])

    def isEmpty(self):
        return all(-1 in l for l in self.board)

    def isDraw(self):
        return not self.playerWinner() and not self.computerWinner() and self.noMoreMoves()

    def noMoreMoves(self):
        return not any(-1 in l for l in self.board)

    def isWinner(self, who):
        # Check horizontals
        for row in range(3):
            if all([x == who for x in self.board[row]]):
                return True
        # Check verticals
        for col in range(3):
            if all([x == who for x in [self.board[0][col], self.board[1][col], self.board[2][col]]]):
                return True
        # Check diagonals
        if all(self.board[i][i] == who for i in range(3)) or all(
                self.board[i][2 - i] == who for i in range(3)):
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

    def eraseMove(self, row, col):
        self.verifyValidMove(row, col)
        self.board[row][col] = -1

    def verifyValidMove(self, row, col):
        if not row in range(3) or not col in range(3):
            raise RuntimeError('Invalid position')

    def placeMovePlayer(self, row, col):
        assert (self.turn == 0)
        self.placeMove(0, row, col)
        self.turn = 1

    def placeMoveComputer(self, row, col):
        assert (self.turn == 1)
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
        # Returns a list of tuples
        ret = []
        for row in range(3):
            for col in range(3):
                if self.board[row][col] == -1:
                    ret.append((row, col))
        return ret

    def computerMove(self):
        self.computeNextMoveAt(-999999, 999999)
        self.placeMoveComputer(self.choice[0], self.choice[1])

    def computeNextMoveAt(self, alpha, beta):
        # Terminal node
        if self.hasEnded():
            return self.gameScore()

        moves = []
        scores = []

        # Fill scores and moves, recurseively using minmax
        if self.turn == 1:
            move_score = -999999
            for move in self.availableMoves():
                next_state = copy.deepcopy(self)
                next_state.placeMove(next_state.turn, move[0], move[1])
                move_score = max(move_score, next_state.computeNextMoveAt(alpha, beta))
                moves.append(move)
                scores.append(move_score)
                alpha = max(alpha, move_score)
                if beta <= alpha:
                    break
            self.choice = moves[scores.index(max(scores))]
            return move_score

        if self.turn == 0:
            move_score = 999999
            for move in self.availableMoves():
                next_state = copy.deepcopy(self)
                next_state.placeMove(next_state.turn, move[0], move[1])
                move_score = min(move_score, next_state.computeNextMoveAt(alpha, beta))
                moves.append(move)
                scores.append(move_score)
                beta = min(beta, move_score)
                if beta <= alpha:
                    break
            self.choice = moves[scores.index(max(scores))]
            return move_score


class TicTacToeGUI:
    def __init__(self):
        self.state = TicTacToeState()
        self.width = 360
        self.height = 360
        self.screen = pygame.display.set_mode((self.width, self.height))
        pygame.display.set_caption("Tic Tac Toe")

    def draw_board(self):
        self.screen.fill((255, 255, 255))
        # Draw vertical lines
        for x in range(1, 5):
            pygame.draw.line(self.screen, (0, 0, 0), (x * 72, 0), (x * 72, 360), 5)

        # Draw horizontal lines
        for y in range(1, 5):
            pygame.draw.line(self.screen, (0, 0, 0), (0, y * 72), (360, y * 72), 5)


    def draw_symbols(self):
        for row in range(3):
            for col in range(3):
                cell_center_x = col * 120 + 60
                cell_center_y = row * 120 + 60
                if self.state.board[row][col] == 0:
                    pygame.draw.circle(self.screen, (0, 0, 255), (cell_center_x, cell_center_y), 30, 10)
                elif self.state.board[row][col] == 1:
                    pygame.draw.line(self.screen, (255, 0, 0), (cell_center_x - 35, cell_center_y + 35),
                                    (cell_center_x + 35, cell_center_y - 35), 10)
                    pygame.draw.line(self.screen, (255, 0, 0), (cell_center_x - 35, cell_center_y - 35),
                                    (cell_center_x + 35, cell_center_y + 35), 10)

        
    def game_loop(self):
        running = True
        while running:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    running = False
                elif event.type == pygame.MOUSEBUTTONDOWN:
                    x, y = pygame.mouse.get_pos()
                    col = x // 120
                    row = y // 120
                    if self.state.board[row][col] == -1:
                        self.state.placeMovePlayer(row, col)
                        if not self.state.hasEnded():
                            self.state.computerMove()

            self.draw_board()
            self.draw_symbols()

            if self.state.playerWinner():
                font = pygame.font.SysFont(None, 80)
                text = font.render("Player Wins!", True, (0, 0, 0))
                self.screen.blit(text, (100, 250))
                running = False
            elif self.state.computerWinner():
                font = pygame.font.SysFont(None, 80)
                text = font.render("Computer Wins!", True, (0, 0, 0))
                self.screen.blit(text, (60, 250))
                running = False
            elif self.state.isDraw():
                font = pygame.font.SysFont(None, 80)
                text = font.render("Draw!", True, (0, 0, 0))
                self.screen.blit(text, (250, 250))
                running = False

            pygame.display.flip()

        pygame.time.wait(2000)  # Wait for 2 seconds before quitting
        pygame.quit()




def main():
    pygame.init()
    game = TicTacToeGUI()
    game.game_loop()


if __name__ == "__main__":
    main()
