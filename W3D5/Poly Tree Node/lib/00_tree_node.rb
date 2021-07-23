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

    def add_child(node)
        node.parent = self
    end

    def remove_child(node)
        self.children.include?(node) ? (node.parent = nil) : (raise "Child does not exist")
    end
end
