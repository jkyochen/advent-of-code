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
end
