require 'minitest/autorun'
require_relative 'box_wrapping_paper.rb'

class BoxWrappingPaperTest < Minitest::Test

    def test_1
        assert_equal 58, BoxWrappingPaper.cals("2x3x4")
    end

    def test_2
        assert_equal 43, BoxWrappingPaper.cals("1x1x10")
    end

    def test_3
        assert_equal 58+43, BoxWrappingPaper.cals("
            2x3x4
            1x1x10")
    end

    @@puzzle_input = File.read("./puzzle_input.txt")

    def test_puzzle_input
        assert_equal 1586300, BoxWrappingPaper.cals(@@puzzle_input)
    end

end
