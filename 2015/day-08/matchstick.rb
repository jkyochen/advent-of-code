
class Matchstick

    def self.diff_counts(strs)
        strs.split("\n").sum do |str|
            str.length - str.undump.length
        end
    end

    def self.diff_counts_part2(strs)
        strs.split("\n").sum do |str|
            str.dump.length - str.length
        end
    end
end
