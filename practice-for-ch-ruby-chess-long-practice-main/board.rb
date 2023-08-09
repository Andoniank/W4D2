require_relative 'piece'
require "byebug"
class Board 
    attr_reader :board
    def initialize
        @board = Array.new(8) {Array.new(8)}
        
        
        (0..7).each do |col|
            (0..3).each do |row|
                @board[row][col] = Pawn.new(:white, self, [row, col])
            end

            # (2..5).each do |row|
            #     @board[row][col] = NullPiece.instance
            # end

            (4..7).each do |row|
                @board[row][col] = Piece.new(:black, self, [row, col])
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
        if self[start_pos] == NullPiece.instance # out of bounds or blocked
            raise "cannot move piece"
        else 
            self[end_pos] = self[start_pos] # a => b
            self[end_pos].pos = end_pos
            self[start_pos] = NullPiece.instance
        end
    end

   
end


# p b[[0,1]].move_dirs