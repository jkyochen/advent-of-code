
class Floor

    def self.take(instr)
        result = 0
        instr.chars.each do |i|
            if i == "("
                result += 1
            elsif i == ")"
                result -= 1
            end
        end
        result
    end

end
