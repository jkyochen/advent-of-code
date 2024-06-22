class Olympics

    REINDEER_RE = /(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./

    def initialize(reindeers_info, limt_time)
        @reindeers_info = reindeers_info
        @limt_time = limt_time
    end

    def win_km_in_time()
        max_traveled = 0
        @reindeers_info.split("\n").each do |info|
            distance = cal_distance(get_player(info))
            max_traveled = [distance, max_traveled].max
        end
        max_traveled
    end

    private

    def get_player(info)
        md = REINDEER_RE.match(info)
        {
            name: md[1].to_i,
            speed: md[2].to_i,
            run_time: md[3].to_i,
            sleep_time: md[4].to_i,
        }
    end

    def cal_distance(p)
        q, r = @limt_time.divmod(p[:run_time] + p[:sleep_time])
        if r > p[:run_time]
            (q+1)*p[:run_time] * p[:speed]
        else
            (q*p[:run_time]+r) * p[:speed]
        end
    end
end
