require_relative 'piece'
require "byebug"
class Board 
    attr_reader :board
    def initialize
        @board = Array.new(8) {Array.new(8)}
        
        
        (0..7).each do |col|
            @board[1][col] = Pawn.new(:white, self, [1, col])
            @board[6][col] = Pawn.new(:black, self, [6, col])

            (2..5).each { |row| @board[row][col] = NullPiece.instance }
        end
        
        @board[0][0] = Rook.new(:white, self, [0,0])
        @board[0][7] = Rook.new(:white, self, [0,7])
        @board[7][0] = Rook.new(:black, self, [7,0])
        @board[7][7] = Rook.new(:black, self, [7,7])

        @board[0][1] = Knight.new(:white, self, [0,1])
        @board[0][6] = Knight.new(:white, self, [0,6])
        @board[7][1] = Knight.new(:black, self, [7,1])
        @board[7][6] = Knight.new(:black, self, [7,6])

        @board[0][2] = Bishop.new(:white, self, [0,2])
        @board[0][5] = Bishop.new(:white, self, [0,5])
        @board[7][2] = Bishop.new(:black, self, [7,2])
        @board[7][5] = Bishop.new(:black, self, [7,5])

        @board[0][4] = King.new(:white, self, [0,4])
        @board[7][4] = King.new(:black, self, [7,4])

        @board[0][3] = Queen.new(:white, self, [0,3])
        @board[7][3] = Queen.new(:black, self, [7,3])
    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @board[row][col] = val
    end


    def move_piece(start_pos, end_pos)
        invalid_moves = !self[start_pos].moves.include?(end_pos)
        if self[start_pos] == NullPiece.instance && invalid_moves # out of bounds or blocked
            raise "cannot move piece"
        else 
            self[end_pos] = self[start_pos] # a => b
            self[end_pos].pos = end_pos
            self[start_pos] = NullPiece.instance
        end
    end

   
end


# p b[[0,1]].move_dirs