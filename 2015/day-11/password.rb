
class Password

    def self.next(old)
        pass = old
        loop do
            break if pass.length > old.length
            pass = pass.succ
            pass = skip_mis_letter(pass)
            return pass if check_pass(pass)
        end
    end

    private

    def self.skip_mis_letter(pass)
        return pass if pass.count('iol').zero?

        letter_index = mis_letter_index(pass)
        pass[0..letter_index].succ + 'a'*(pass.length-(letter_index+1))
    end

    def self.mis_letter_index(pass)
        pass.index("i") || pass.index("o") || pass.index("l")
    end

    def self.check_pass(pass)
        return false if !check_inc_three_letter(pass)
        return false if !check_two_repeat_pair_letter(pass)
        true
    end

    def self.check_two_repeat_pair_letter(pass)
        count = 0
        i = 0
        while i < pass.length-1
            next i += 1 if pass[i] != pass[i+1]

            count += 1
            i += 2
        end
        return true if count >= 2
        false
    end

    def self.check_inc_three_letter(pass)
        for i in 0...pass.length-2
            return true if pass[i].succ == pass[i+1] && pass[i].succ.succ == pass[i+2]
        end
        false
    end

end
