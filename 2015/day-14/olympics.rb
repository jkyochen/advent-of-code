class Olympics

    REINDEER_RE = /(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./

    def initialize(reindeers_info, limit)
        @players = reindeers_info.split("\n").map { |info| parse_player(info) }
        @limit = limit
    end

    def win_km_in_time
        return 0 if @players.empty?
        max = 0
        @players.each do |player|
            distance = cal_distance(@limit, player)
            max = [distance, max].max
        end
        max
    end

    def win_point_in_time
        return 0 if @players.empty? || @limit.zero?
        return @limit if @players == 1

        h = Hash.new(0)
        @limit.times do |i|
            time = i+1
            all_points = points_in_time(time)
            max = max_distance(all_points)

            all_points.each do |p|
                next if p[:distance] != max
                h[p[:name]]+=1
            end
        end
        h.values.max
    end

    private

    def max_distance(all_points)
        max = 0
        all_points.each do |p|
            next if p[:distance] <= max
            max = p[:distance]
        end
        max
    end

    def points_in_time(time)
        @players.map do |player|
            {
                name: player[:name],
                distance: cal_distance(time, player),
            }
        end
    end

    def parse_player(info)
        md = REINDEER_RE.match(info)
        {
            name: md[1],
            speed: md[2].to_i,
            run_time: md[3].to_i,
            sleep_time: md[4].to_i,
        }
    end

    def cal_distance(time, p)
        q, r = time.divmod(p[:run_time] + p[:sleep_time])
        if r > p[:run_time]
            (q+1)*p[:run_time] * p[:speed]
        else
            (q*p[:run_time]+r) * p[:speed]
        end
    end
end
