class Olympics

    REINDEER_RE = /(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./

    def initialize(reindeers_info)
        @reindeers_info = reindeers_info
    end

    def win_km_in_time(time)
        max = 0
        @reindeers_info.split("\n").each do |info|
            distance = cal_distance(time, get_player(info))
            max = [distance, max].max
        end
        max
    end

    private

    def get_player(info)
        md = REINDEER_RE.match(info)
        {
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
