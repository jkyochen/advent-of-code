require 'minitest/autorun'
require_relative 'text.rb'

class TextTest < Minitest::Test

    def test_1
        assert_equal 1, Text.count_nice("ugknbfddgicrmopn")
    end

    def test_2
        assert_equal 1, Text.count_nice("aaa")
    end

    def test_3
        assert_equal 0, Text.count_nice("jchzalrnumimnmhp")
    end

    def test_4
        assert_equal 0, Text.count_nice("haegwjzuvuyypxyu")
    end

    def test_5
        assert_equal 0, Text.count_nice("dvszwmarrgswjxmb")
    end

    def test_puzzle_input
        puzzle_input = File.read("puzzle_input.txt")
        assert_equal 238, Text.count_nice(puzzle_input)
    end
end
