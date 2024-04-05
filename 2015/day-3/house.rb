
class House

    def self.count_receive_present_house(move_directions)
        init_location = [0, 0]
        receive_present_house = [init_location]
        current_location = init_location.dup
        move_directions.chars.each do |direction|
            current_location = current_location.dup
            if direction == "^"
                # north
                current_location[1] += 1
            elsif direction == "v"
                # south
                current_location[1] -= 1
            elsif direction == ">"
                # east
                current_location[0] += 1
            elsif direction == "<"
                # west
                current_location[0] -= 1
            end
            push_diff_location(receive_present_house, current_location)
        end
        receive_present_house.length
    end

    private

    def self.push_diff_location(receive_present_house, current_location)
        return if receive_present_house.any? { |lo| lo == current_location }
        receive_present_house.push(current_location)
    end

end
