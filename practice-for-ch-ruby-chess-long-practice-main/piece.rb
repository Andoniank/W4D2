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
    include Singleton
    def initialize
        @color = :grey
        @symbol = nil # not sure
    end
end

class Bishop < Piece
    include Slideable

    def move_dirs(pos)
        diagonal_dirs
    end
end

class Rook < Piece
    include Slideable

    def move_dirs
        straight_dirs
    end
end

class Queen < Piece
    include Slideable

    def move_dirs
        diagonal_dirs + straight_dirs
    end
end

