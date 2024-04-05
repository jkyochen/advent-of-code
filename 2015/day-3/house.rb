
class House

    def self.count_receive_present_house(moves)
        init_location = [0, 0]
        receive_present_house = [init_location]
        current_location = init_location.dup
        moves.chars.each do |move|
            current_location = current_location.dup
            if move == "^"
                # north
                current_location[1] += 1
            elsif move == "v"
                # south
                current_location[1] -= 1
            elsif move == ">"
                # east
                current_location[0] += 1
            elsif move == "<"
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
