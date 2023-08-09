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
        s_row, s_col = start_pos
        e_row, e_col = end_pos
        if @board[s_row][s_col] == nil # out of bounds or blocked
            raise "cannot move piece"
        else 
            @board[e_row][e_col] = @board[s_row][s_col] # a => b
            @board[e_row][e_col].pos = [e_row, e_col]
            @board[s_row][s_col] = nil
            
        end
    end
end

class Piece
    attr_reader :color, :board
    attr_accessor :pos
    def initialize(color, board, pos)
        @color = color
        @board = board 
        @pos = pos
    end
end

class NullPiece < Piece
    def initialize
        nil
    end
end