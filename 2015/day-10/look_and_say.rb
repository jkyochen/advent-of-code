
class LookAndSay

    def self.say(value, times = 1)
        value = value.to_s
        times.times do
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
            value = temp
        end
        value.to_i
    end

end
