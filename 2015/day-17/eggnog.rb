class Eggnog

    def initialize(containers_size, target)
        @containers = containers_size.split("\n").map { |i| i.to_i }
        @target = target
        @ways = 0
    end

    def combine
        pick_container([], 0)
        @ways
    end

    private

    def pick_container(picks, index)

        if picks.sum == @target
            return @ways+=1
        end
        return if picks.sum > @target
        return if index >= @containers.length

        @containers[index..].each_with_index do |e, i|
            picks.push(e)
            pick_container(picks, index+i+1)
            picks.pop
        end
    end
end
