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
    protected
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
    protected
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
    protected
    def move_dirs
        diagonal_dirs + straight_dirs
    end
end

class King < Piece
    include Stepable

    def initialize(color, board, pos)
        super
    end
    protected
    def move_diffs
        king_dirs
    end
end

class Knight < Piece
    include Stepable
    def initialize(color, board, pos)
        super
    end
    protected
    def move_diffs
        knight_dirs
    end
end

class Pawn < Piece
    WHITE_P_ATK = [[1,-1], [1,1]]
    BLACK_P_ATK = [[-1,-1], [-1,1]]
    def initialize(color, board, pos)
        super
    end

    def moves
        possible_moves = []
        if at_start_row?
            dirs = [forward_dir, forward_steps] # [], []
        else
            dirs = [forward_dir] # []
        end
        dirs.each do |x|
            new_x = self.pos[0] + x
            # new_y = self.pos[1] + y
            if new_x.between?(0, 7)
                case self.board[[new_x, self.pos[1]]].color
                when :none     # checks to see if the new position is a NullPiece 
                    possible_moves << [new_x, self.pos[1]]                   
                else       # if opponents color, include position and break
                    next
                end
            end
        end
        possible_moves
    end

    # def inbounds(new_x, new_y)
    #     new_x.between?(0, 7) && new_y.between?(0, 7)
    # end

    protected
    def at_start_row?
        if color == :white 
            self.pos[0] == 1
        else
            self.pos[0] == 6
        end
    end

    def forward_dir
        color == :white ? 1 : -1 # [1,0] : [-1,0]
    end

    def forward_steps
        color == :white ? 2 : -2 # [2,0] : [-2,0]
    end

    def side_attacks

    end

end