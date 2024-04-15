
class Text

    def self.count_nice(inputs)
        inputs.split("\n").count do |i|
            nice?(i)
        end
    end

    def self.count_nice_part2(inputs)
        inputs.split("\n").count do |i|
            nice_part2?(i)
        end
    end

    private

    def self.nice_part2?(strings)
        return false if strings.length < 4

        # It contains a pair of any two letters that appears at least twice in the string without overlapping.
        isRepeatLetter = false
        for i in 0...strings.length-2
            if strings.slice(i+2..).include?(strings[i]+strings[i+1])
                isRepeatLetter = true
                break
            end
        end
        return false if !isRepeatLetter

        # It contains at least one letter which repeats with exactly one letter between them
        for i in 0...strings.length-2
            return true if strings[i] == strings[i+2]
        end
        false
    end

    def self.nice?(strings)
        # 1. at least three vowels (aeiou only)
        return false if strings.count("aeiou") < 3

        # 2. at least one letter that appears twice in a row
        isRepeatLetter = false
        for i in 0...strings.length-1
            if (strings[i] == strings[i+1])
                isRepeatLetter = true
                break
            end
        end
        return false if !isRepeatLetter

        # 3. does not contain the strings ab, cd, pq, or xy
        return false if strings.include?("ab") || strings.include?("cd")
        return false if strings.include?("pq") || strings.include?("xy")

        true
    end
end
