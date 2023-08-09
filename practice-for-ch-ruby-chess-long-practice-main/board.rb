require_relative 'piece'

class Board 
    attr_reader :board
    def initialize
        @board = Array.new(8) {Array.new(8)}
        @null_piece = NullPiece
        
        (0..7).each do |col|
            (0..1).each do |row|
                @board[row][col] = Piece.new('white', self.board, [row, col])
            end

            # (2..5).each do |row|

            # end

            (6..7).each do |row|
                @board[row][col] = Piece.new('black', self.board, [row, col])
            end
        end


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
        if self[start_pos] == nil # out of bounds or blocked
            raise "cannot move piece"
        else 
            self[end_pos] = self[start_pos] # a => b
            self[end_pos].pos = end_pos
            self[start_pos] = nil
        end
    end
end

