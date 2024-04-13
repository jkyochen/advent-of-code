
class BoxWrappingPaper

    def self.cals(instr)
        result = 0
        instr.split("\n").each do |i|
            l, w, h = i.split("x")
            result += cal(l.to_i, w.to_i, h.to_i)
        end
        result
    end

    private

    def self.cal(l, w, h)
        m1, m2 = [l, w, h].min(2)
        2*(l*w + l*h + w*h) + m1*m2
    end

end
