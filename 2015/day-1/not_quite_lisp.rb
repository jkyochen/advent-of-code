
class NotQuiteLisp

    def self.take_santa_to_what_floor(instr)
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
