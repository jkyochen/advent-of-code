require 'minitest/autorun'
require_relative 'floor.rb'

class FloorTest < Minitest::Test

    def test_0
        assert_equal 0, Floor.take("")
        assert_equal 0, Floor.take("(())")
        assert_equal 0, Floor.take("()()")
    end

    def test_up_floor_3
        assert_equal 3, Floor.take("(((")
        assert_equal 3, Floor.take("(()(()(")
        assert_equal 3, Floor.take("))(((((")
    end

    def test_down_floor_1
        assert_equal -1, Floor.take("())")
        assert_equal -1, Floor.take("))(")
    end

    def test_down_floor_3
        assert_equal -3, Floor.take(")))")
        assert_equal -3, Floor.take(")())())")
    end

    def test_pos_to_enter_basement
        assert_equal 1, Floor.first_pos_enter_basement(")")
        assert_equal 5, Floor.first_pos_enter_basement("()())")
    end

    def test_puzzle_input
        puzzle_input = File.read("./puzzle_input.txt")
        assert_equal 280, Floor.take(puzzle_input)
        assert_equal 1797, Floor.first_pos_enter_basement(puzzle_input)
    end

end
