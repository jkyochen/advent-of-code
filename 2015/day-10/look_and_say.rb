
class LookAndSay

    def self.say(value, times = 1)
        value = value.to_s
        times.times do
            value = loop_to_say(value)
        end
        value.to_i
    end

    private

    def self.loop_to_say(value)
        temp = ""
        i = 0
        for j in 0...value.length
            if value[j] != value[i]
                temp += (j-i).to_s + value[i]
                i = j
            end
            if j == value.length-1
                temp += (j-i+1).to_s + value[i]
            end
        end
        temp
    end

end
