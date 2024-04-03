
class WouldBeNoMath

    def self.calExactlyDimensions(l, w, h)
        m1, m2 = [l, w, h].min(2)
        2*(l*w + l*h + w*h) + m1*m2
    end

end
