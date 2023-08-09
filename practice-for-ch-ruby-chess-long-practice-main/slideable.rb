# require "byebug"
module Slideable
    STRAIGHT_DIRS = [[0,1], [1,0], [0,-1], [-1,0]]
    DIAGONAL_DIRS = [[1,1], [-1,1], [-1,-1], [1,-1]]
    
    def straight_dirs
        STRAIGHT_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        possible_moves = []
        move_dirs.each do |x, y|
            # while inbounds keep iterating through straight_dirs, otherwise move on to the next position
            # debugger
            new_x = self.pos[0]
            new_y = self.pos[1]
            while inbounds(new_x, new_y)
                new_x += x
                new_y += y
                if inbounds(new_x, new_y)
                    case self.board[[new_x, new_y]].color
                    when :none     # checks to see if the new position is a NullPiece 
                        possible_moves << [new_x, new_y]                   
                    when self.color  # if same color, dont want to add the position to possible_moves
                        break
                    else                                          # if opponents color, include position and break
                        possible_moves << [new_x, new_y]
                        break
                    end
                end
            end
        end
        possible_moves
    end

    def inbounds(new_x, new_y)
        new_x.between?(0, 7) && new_y.between?(0, 7)

    end

end