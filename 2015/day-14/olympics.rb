class Olympics

    def initialize(reindeers_info)
        @reindeers_info = reindeers_info
    end

    def win_km_when_time(time, players)
        max = 0
        players.each do |player|
            distance = cal_distance(time, player)
            if distance > max
                max = distance
            end
        end
        max
    end

    private

    def cal_distance(time, player)
        speed, run_time, sleep_time = player
        q, r = time.divmod(run_time + sleep_time)
        if r > run_time
            (q + 1) * run_time * speed
        else
            q * run_time * speed + r * speed
        end
    end
end
