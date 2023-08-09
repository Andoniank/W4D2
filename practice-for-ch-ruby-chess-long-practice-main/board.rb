class Board 

    def initialize
        @board = Array.new(8) {Array.new(8)}
        @null_piece = NullPiece
        
        @board.each_with_index do |row, i|
            if i < 2
                row.each {|ele| ele = Piece.new}
            elsif i > 5
                row.each {|ele| ele = Piece.new}
            else
                row.each {|ele| ele = NullPiece}
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
        if @board[start_pos] == @null_piece || @board[end_pos] != @null_piece
            raise "cannot move piece"
        else 
            @board[start_pos] = @board[end_pos]
        end
    end
end

class Piece
    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @color = color
        @board = board 
        @pos = pos
    end
end

class NullPiece < Piece
    def initialize
        
    end
end