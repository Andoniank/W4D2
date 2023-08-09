require 'byebug'
module Stepable
    KNIGHT_DIRS = [
        [1,2], [-1,2], # up
        [2,1], [2,-1], # right
        [1,-2],[-1,-2], # down
        [-2,1],[-2,-1] # left
    ]
    KING_DIRS = [[0,1], [1,0], [0,-1], [-1,0], [1,1], [-1,1], [-1,-1], [1,-1]]

    def knight_dirs
        KNIGHT_DIRS
    end

    def king_dirs
        KING_DIRS
    end

    def moves
        possible_moves = []
        move_diffs.each do |x, y|
            new_x = self.pos[0] + x
            new_y = self.pos[1] + y
            if inbounds(new_x, new_y)
                case self.board[[new_x, new_y]].color
                when :none     # checks to see if the new position is a NullPiece 
                    possible_moves << [new_x, new_y]                   
                when self.color  # if same color, dont want to add the position to possible_moves
                    next
                else       # if opponents color, include position and break
                    possible_moves << [new_x, new_y]
                    next
                end
            end
        end
        possible_moves
    end

    def inbounds(new_x, new_y)
        new_x.between?(0, 7) && new_y.between?(0, 7)
    end

end