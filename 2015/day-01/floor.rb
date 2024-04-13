
class Floor

    def self.take(instr)
        result = 0
        instr.chars.each do |e|
            if e == "("
                result += 1
            elsif e == ")"
                result -= 1
            end
        end
        result
    end

    def self.first_pos_enter_basement(instr)
        result = 0
        instr.chars.each_with_index do |e, i|
            if e == "("
                result += 1
            elsif e == ")"
                result -= 1
            end

            if result == -1
                return i + 1
            end
        end
        nil
    end

end
