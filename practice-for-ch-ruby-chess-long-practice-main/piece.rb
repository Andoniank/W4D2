require 'singleton'

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