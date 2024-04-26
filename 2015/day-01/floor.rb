
class Floor

    def self.take(instr)
        instr.chars.map do |e|
            if e == "("
                1
            elsif e == ")"
                -1
            else
                0
            end
        end.sum
    end

    def self.first_pos_enter_basement(instr)
        floor_level = 0
        instr.chars.each_with_index do |e, i|
            if e == "("
                floor_level += 1
            elsif e == ")"
                floor_level -= 1
            end

            if floor_level == -1
                return i + 1
            end
        end
        nil
    end

end
