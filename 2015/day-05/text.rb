
class Text

    def self.count_nice(inputs)
        inputs.split("\n").count do |i|
            nice?(i)
        end
    end

    private

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
