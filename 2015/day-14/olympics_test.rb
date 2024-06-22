require 'minitest/autorun'
require_relative 'olympics.rb'

class OlympicsTest < Minitest::Test
    def test_basic
        reindeers_info = <<~'END'
        Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
        Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
        END
        assert_equal 1120, Olympics.new(reindeers_info).win_km_in_time(1000)
    end

    def test_puzzle_input
        puzzle_input = File.read("puzzle_input.txt")
        assert_equal 2660, Olympics.new(puzzle_input).win_km_in_time(2503)
    end
end
