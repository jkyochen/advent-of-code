require 'json'

class Books

    def initialize(filters = [])
        @filters = filters
    end

    def sum(data)
        data = JSON.parse(data)
        each_sum(data)
    end

    private

    def each_sum(data)
        return 0 if data.is_a?(String)
        return data if data.is_a?(Integer)
        return data.sum { |i| each_sum(i) } if data.is_a?(Array)
        return 0 if !data.is_a?(Hash)
        return 0 if @filters.any? { |i| data.values.include?(i) }
        each_sum(data.values)
    end

end
