
class Password

    def self.next(old)
        loop do
            old = old.succ
            return old if check_pass(old)
        end
    end

    private

    def self.check_pass(picks)
        return false if check_mistaken_letter(picks)
        return false if !check_inc_three_letter(picks)
        return false if !check_two_repeat_pair_letter(picks)
        true
    end

    def self.check_mistaken_letter(picks)
        return true if picks.count('iol') > 0
        false
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
