require 'minitest/autorun'
require_relative 'box_wrap.rb'

class BoxWrapTest < Minitest::Test

    def test_1
        assert_equal 58, BoxWrap.feets("2x3x4")
    end

    def test_2
        assert_equal 43, BoxWrap.feets("1x1x10")
    end

    def test_3
        assert_equal 58+43, BoxWrap.feets("
            2x3x4
            1x1x10")
    end

    def test_with_ribbon1
        assert_equal 34, BoxWrap.feets_with_ribbon("2x3x4")
    end

    def test_with_ribbon2
        assert_equal 14, BoxWrap.feets_with_ribbon("1x1x10")
    end

    def test_with_ribbon3
        assert_equal 34+14, BoxWrap.feets_with_ribbon("
            2x3x4
            1x1x10")
    end

    def test_puzzle_input
        puzzle_input = File.read("./puzzle_input.txt")
        assert_equal 1586300, BoxWrap.feets(puzzle_input)
        assert_equal 3737498, BoxWrap.feets_with_ribbon(puzzle_input)
    end

end
