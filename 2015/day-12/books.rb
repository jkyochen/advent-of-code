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
        if data.is_a?(Array)
            data.sum { |i| each_sum(i) }
        elsif data.is_a?(String)
            0
        elsif data.is_a?(Integer)
            data
        else
            values = data.values
            return 0 if @filters.any? { |i| values.include?(i) }
            each_sum(values)
        end
    end

end
