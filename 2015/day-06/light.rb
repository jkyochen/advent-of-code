
class Light

    def self.deploy(instructions)

        light_status = Array.new(1000) { Array.new(1000, false) }

        instructions.split("\n").each do |inst|
            if inst.start_with?("turn on")
                change_status(inst, "turn on") do |x, y|
                    light_status[x][y] = true
                end
            elsif inst.start_with?("turn off")
                change_status(inst, "turn off") do |x, y|
                    light_status[x][y] = false
                end
            elsif inst.start_with?("toggle")
                change_status(inst, "toggle") do |x, y|
                    light_status[x][y] = !light_status[x][y]
                end
            end
        end

        light_status.sum { |i| i.count(true) }
    end

    def self.deploy_with_brightness(instructions)

        light_status = Array.new(1000) { Array.new(1000, 0) }

        instructions.split("\n").each do |inst|
            inst = inst.strip
            if inst.start_with?("turn on")
                change_status(inst, "turn on") do |x, y|
                    light_status[x][y] += 1
                end
            elsif inst.start_with?("turn off")
                change_status(inst, "turn off") do |x, y|
                    light_status[x][y] -= 1 if light_status[x][y] > 0
                end
            elsif inst.start_with?("toggle")
                change_status(inst, "toggle") do |x, y|
                    light_status[x][y] += 2
                end
            end
        end

        light_status.sum { |i| i.sum }
    end

    def self.change_status(inst, action, &block)

        start_point, end_point = inst.delete_prefix(action).strip.split(" through ")

        start_x, start_y = start_point.split(",")
        end_x, end_y = end_point.split(",")

        (start_x.to_i..end_x.to_i).each do |x|
            (start_y.to_i..end_y.to_i).each do |y|
                yield(x, y)
            end
        end
    end

end
