require 'minitest/autorun'
require_relative 'house.rb'

class HouseTest < Minitest::Test

    def test_basic
        assert_equal 2, House.count_receive_present_house(">")
    end

    def test_2
        assert_equal 4, House.count_receive_present_house("^>v<")
    end

    def test_3
        assert_equal 2, House.count_receive_present_house("^v^v^v^v^v")
    end

    def test_basic_with_robot
        assert_equal 3, House.count_receive_present_house_with_robot("^v")
    end

    def test_basic_with_robot2
        assert_equal 3, House.count_receive_present_house_with_robot("^>v<")
    end

    def test_basic_with_robot3
        assert_equal 11, House.count_receive_present_house_with_robot("^v^v^v^v^v")
    end

    def test_puzzle_input
        puzzle_input = File.read("puzzle_input.txt")
        assert_equal 2565, House.count_receive_present_house(puzzle_input)
        assert_equal 2639, House.count_receive_present_house_with_robot(puzzle_input)
    end
end
