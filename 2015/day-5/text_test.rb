require 'minitest/autorun'
require_relative 'text.rb'

class TextTest < Minitest::Test

    def test_1
        assert_equal true, Text.nice?("ugknbfddgicrmopn")
    end

    def test_2
        assert_equal true, Text.nice?("aaa")
    end

    def test_3
        assert_equal false, Text.nice?("jchzalrnumimnmhp")
    end

    def test_4
        assert_equal false, Text.nice?("haegwjzuvuyypxyu")
    end

    def test_5
        assert_equal false, Text.nice?("dvszwmarrgswjxmb")
    end
end
