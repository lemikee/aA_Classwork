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

    attr_reader :start, :move_tree

    def initialize(start)
        @start = start
        @move_tree = []
        build_move_tree
    end

    def build_move_tree
        root_node = PolyTreeNode.new(start)

        queue = [root_node]
        until queue.empty?
            current_node = queue.shift

        end

    end




    




end