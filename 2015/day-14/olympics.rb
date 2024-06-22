class Olympics

    REINDEER_RE = /(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./

    def initialize(reindeers_info, limt_time)
        @players = reindeers_info.split("\n").map { |info| get_player(info) }
        @limt_time = limt_time
    end

    def win_km_in_time
        return 0 if @players.empty?
        max_traveled = 0
        @players.each do |player|
            distance = cal_distance(@limt_time, player)
            max_traveled = [distance, max_traveled].max
        end
        max_traveled
    end

    def win_point_in_time
        return 0 if @players.empty? || @limt_time.zero?
        return @limt_time if @players == 1

        h = Hash.new(0)
        @limt_time.times do |i|
            time = i+1
            all_player_status = get_player_status_in_time(time)
            max_distance = get_max_distance(all_player_status)

            all_player_status.each do |p|
                next if p[:distance] != max_distance
                h[p[:name]]+=1
            end
        end
        h.values.max
    end

    private

    def get_max_distance(all_player_status)
        max_distance = 0
        all_player_status.each do |p|
            if p[:distance] > max_distance
                max_distance = p[:distance]
            end
        end
        max_distance
    end

    def get_player_status_in_time(time)
        @players.map do |player|
            distance = cal_distance(time, player)
            {
                name: player[:name],
                distance: distance,
            }
        end
    end

    def get_player(info)
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
