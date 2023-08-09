require 'singleton'
require_relative 'slideable.rb'

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
    # include Singleton
    # def initialize
        
    # end
end

class Bishop < Piece
    include Slideable

    def move_dirs
        Slideable.diagonal_dirs
    end
end

class Rook < Piece
    include Slideable

    def move_dirs
        Slideable.straight_dirs
    end
end

class Queen < Piece
    include Slideable

    def move_dirs
        Slideable.straight_dirs + Slideable.diagonal_dirs
    end
end

