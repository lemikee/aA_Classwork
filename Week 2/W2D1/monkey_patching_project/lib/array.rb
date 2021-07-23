# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self.length == 0
            return nil
        else
            sorted = self.sort
            sorted.last - sorted.first
        end
    end

    def average
        if self.length == 0
            return nil
        elsif self.span
            return self.sum / (self.length * 1.0)
        end
    end

    def median
        sorted = self.sort

        if sorted.length == 0
            return nil

        elsif sorted.length.odd?
            middle_idx = (sorted.length / 2.0).floor
            return sorted[middle_idx]
        else
            middle_idx = (sorted.length / 2.0).floor
            return (sorted[middle_idx - 1] + sorted[middle_idx]) / 2.0
        end
    end

    def counts
            counter = Hash.new(0)
            self.each { |ele| counter[ele] += 1 }
            counter
    end

    def my_count(val)
        count = 0

        self.each { |ele| count += 1 if ele == val }

        count
    end

    def my_index(val)
        return nil if !self.include?(val)

        self.each_with_index { |ele, i| return i if ele == val }
    end

    def my_uniq
        new_arr = []

        self.each { |ele| new_arr << ele if !new_arr.include?(ele)}

        new_arr
    end

    def my_transpose
        height = self.length
        width = self.first.length
        new_arr = Array.new(height)  { Array.new(width, []) }

        self.each_with_index do |subArray, idx1|
            subArray.each_with_index do |ele, idx2|
                new_arr[idx2][idx1] = ele
            end
        end

        new_arr
    end


end
