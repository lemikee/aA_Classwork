class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
   end

    def parent=(node)
        unless parent.nil?
            parent.children.delete(self)
        end

        @parent = node
        node.children << self unless node.nil?
    end
end
