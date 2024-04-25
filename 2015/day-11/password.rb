
class Password

    def self.next(old)
        loop do
            old = old.succ
            old = skip_mis_letter(old)
            return old if check_pass(old)
        end
    end

    private

    def self.skip_mis_letter(old)
        if old.count('iol') > 0
            letter_index = mis_letter_index(old)
            old = old[0..letter_index].succ + 'a'*(old.length-(letter_index+1))
        end
        old
    end

    def self.mis_letter_index(picks)
        picks.index("i") || picks.index("o") || picks.index("l")
    end

    def self.check_pass(picks)
        return false if !check_inc_three_letter(picks)
        return false if !check_two_repeat_pair_letter(picks)
        true
    end

    def self.check_two_repeat_pair_letter(picks)
        count = 0
        i = 0
        while i < picks.length-1
            next i += 1 if picks[i] != picks[i+1]

            count += 1
            i += 2
        end
        return true if count >= 2
        false
    end

    def self.check_inc_three_letter(picks)
        for i in 0...picks.length-2
            return true if picks[i].succ == picks[i+1] && picks[i].succ.succ == picks[i+2]
        end
        false
    end

end
