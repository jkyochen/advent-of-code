
class BoxWrap

    def self.feets(instr)
        each(instr) do |sizes|
            feet(*sizes)
        end
    end

    def self.feets_with_ribbon(instr)
        each(instr) do |sizes|
            feet_with_ribbon(*sizes)
        end
    end

    private

    def self.each(instr)
        instr.split("\n").map do |i|
            yield(i.split("x").map(&:to_i))
        end.sum
    end

    def self.feet_with_ribbon(l, w, h)
        m1, m2 = [l, w, h].min(2)
        l*w*h + 2*(m1+m2)
    end

    def self.feet(l, w, h)
        m1, m2 = [l, w, h].min(2)
        2*(l*w + l*h + w*h) + m1*m2
    end

end
