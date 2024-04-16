require 'minitest/autorun'
require_relative 'matchstick.rb'

class MatchstickTest < Minitest::Test

    def test_1
        example = <<~'END'
        ""
        "abc"
        "aaa\"aaa"
        "\x27"
        END
        assert_equal 23 - 11, Matchstick.diff_counts(example)
        assert_equal 42 - 23, Matchstick.diff_counts_part2(example)
    end

    def test_puzzle_input
        puzzle_input = File.binread("puzzle_input.txt")
        assert_equal 1350, Matchstick.diff_counts(puzzle_input)
        assert_equal 2085, Matchstick.diff_counts_part2(puzzle_input)
    end
end
