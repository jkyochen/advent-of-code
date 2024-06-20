require 'minitest/autorun'
require_relative 'olympics.rb'

class OlympicsTest < Minitest::Test
    def test_basic
        reindeers_info = <<~'END'
        Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
        Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
        END
        assert_equal 1120, Olympics.new(reindeers_info).win_km_when_time(1000, [[14, 10, 127], [16, 11, 162]])
    end
end
