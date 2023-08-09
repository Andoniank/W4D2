require 'singleton'
require_relative 'slideable.rb'
require_relative 'board.rb'
require_relative 'stepable.rb'

class Piece
    attr_reader :color, :board
    attr_accessor :pos
    def initialize(color, board, pos)
        @color = color
        @board = board 
        @pos = pos
    end

    def inspect 
        return "PieceID:#{self.object_id}-Color:#{self.color}-Position:#{self.pos}"
    end

end

class NullPiece < Piece
    include Singleton
    def initialize
        @color = :none
        # @symbol = nil # not sure
    end
end

class Bishop < Piece
    include Slideable
    def initialize(color, board, pos)
        super
        
        # @symbol = color == :black ? ♗ : ♝
        # if color == :black
        #     @symbol = :♗
        # else
        #     @symbol = :♝
        # end
    end  

    def move_dirs
        diagonal_dirs
    end
end

class Rook < Piece
    include Slideable
    
    def initialize(color, board, pos)
        super

        # @symbol = color == :black ? ♖ : ♜
    end  
    
    def move_dirs
        straight_dirs
    end
end

class Queen < Piece
    include Slideable
    
    def initialize(color, board, pos)
        super

        # @symbol = color == :black ? ♕ : ♛
    end  

    def move_dirs
        diagonal_dirs + straight_dirs
    end
end

class King
    

end

class Knight


end

# def inspect 
#     return "PieceID:#{self.object_id}-Color:#{self.color}-Position:#{self.pos}"
# end
# def inspect
#     return "<PieceID:#{self.object_id} Color:#{self.color} Pos:#{self.pos} Symbol:#{symbol}>"
# end