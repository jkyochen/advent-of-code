require 'minitest/autorun'
require_relative 'cookie.rb'

class CookieTest < Minitest::Test
    def test_basic
        ingredients = <<~'END'
        Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
        Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3
        END
        assert_equal 62842880, Cookie.new(ingredients).make
    end

    def test_puzzle_input
        puzzle_input = File.read("puzzle_input.txt")
        assert_equal 21367368, Cookie.new(puzzle_input).make
    end

    def test_basic_in_calorie
        ingredients = <<~'END'
        Butterscotch: capacity -1, durability -2, flavor 6, texture 3, calories 8
        Cinnamon: capacity 2, durability 3, flavor -2, texture -1, calories 3
        END
        assert_equal 57600000, Cookie.new(ingredients, 500).make
    end

    def test_puzzle_input_in_calorie
        puzzle_input = File.read("puzzle_input.txt")
        assert_equal 1766400, Cookie.new(puzzle_input, 500).make
    end
end
