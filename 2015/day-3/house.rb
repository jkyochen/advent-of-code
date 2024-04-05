
class House

    START_LOCATION = [0, 0]

    def self.count_receive_present_house(move_directions)
        receive_present_house = [START_LOCATION]
        current_location = START_LOCATION.dup
        move_directions.chars.each do |direction|
            current_location = current_location.dup
            move(direction, current_location)
            push_diff_location(receive_present_house, current_location)
        end
        receive_present_house.length
    end

    private

    def self.move(direction, current_location)
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
    end

    def self.push_diff_location(receive_present_house, current_location)
        return if receive_present_house.any? { |lo| lo == current_location }
        receive_present_house.push(current_location)
    end

end
