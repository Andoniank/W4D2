
module Slideable
    STRAIGHT_DIRS = [[0,1], [1,0], [0,-1], [-1,0]]
    DIAGONAL_DIRS = [[1,1], [-1,1] [-1,-1], [1,-1]]
    
    def straight_dirs
        STRAIGHT_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves(pos)
        
    end

    def move_dirs(pos)
        moves = []
        straight_dirs.each do |x, y|
            # while inbounds keep iterating through straight_dirs, otherwise move on to the next position
            while new_x.between?(0, 7) && new_y.between?(0, 7)
                new_x = pos[0] + x
                new_y = pos[1] + y
                if @board[new_x][new_y].is_a?(NullPiece)      # checks to see if the new position is a NullPiece 
                    moves << [new_x, new_y]                   
                end 
                if @board[new_x][new_y].color == self.color   # if same color, dont want to add the position to moves
                    break
                else                                          # if opponents color, include position and break
                    moves << [new_x, new_y]
                    break
                end
            end
        end
        moves
    end
end