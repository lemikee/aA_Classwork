require_relative "tree_node.rb"

class KnightPathFinder

    POSSIBLE_MOVES = [
        [1, 2],
        [-1, 2],
        [1, -2],
        [-1, -2],
        [2, 1],
        [2, -1],
        [-2, 1],
        [-2, -2]
    ]

    attr_reader :root_node, :considered_positions

    def initialize(start)
        @root_node = PolyTreeNode.new(start)
        @considered_positions = [start]
        build_move_tree
    end

    def self.valid_moves(move)
        valid_moves_arr = []
        POSSIBLE_MOVES.each do |move|
            new_x = root_node[0] + move[0]
            new_y = root_node[1] + move[1]

            next unless new_x.between?(0, 7) && new_y.between?(0, 7) # checks to see if coordinate are in valid range of the 8 x 8 grid

            unless root_node.parent.nil?
                next if parent.value = [new_x, new_y] # to check if new potential node is NOT the same as the parent
            end

            new_node = PolyTreeNode.new([new_x, new_y])
            valid_moves_arr << new_node
        end

        valid_moves_arr
    end

    def build_move_tree

    end

    def new_move_positions(pos)
         #takes in a current pos, and then gives new possible moves
         KnightPathFinder.valid_moves(pos).reject { |move| considered_positions.include?(move) }
    end

end