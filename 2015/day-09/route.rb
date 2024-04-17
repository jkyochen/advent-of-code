require 'set'

class Route

    @@route_regex =/(\w+) to (\w+) = (\d+)/
    @@citys = Set[]
    @@list_distance = []

    def self.pick_shortest(data)

        city_obj = {}
        data.split("\n").each do |str|
            match_data = str.match(@@route_regex)
            next if !match_data

            from_city = match_data[1]
            to_city = match_data[2]
            distance = match_data[3].to_i
            @@citys << from_city
            @@citys << to_city

            city_obj[from_city] = {} if !city_obj[from_city]
            city_obj[to_city] = {} if !city_obj[to_city]

            city_obj[from_city][to_city] = distance
            city_obj[to_city][from_city] = distance
        end

        pick_route(city_obj)

        @@list_distance.min
    end

    private

    def self.pick_route(city_obj)
        city_obj.each_pair do |from_city, routes|
            pick_to_city(city_obj, city_obj[from_city], [from_city], 0)
        end
    end

    def self.pick_to_city(city_obj, routes, pick_citys, pick_distance)
        return if !routes

        if pick_citys.length == @@citys.length
            @@list_distance << pick_distance
            return
        end

        routes.each_pair do |city, distance|
            next if pick_citys.include?(city)

            pick_citys << city
            pick_distance += distance

            pick_to_city(city_obj, city_obj[city], pick_citys, pick_distance)

            pick_distance -= distance
            pick_citys.pop
        end
    end

end
