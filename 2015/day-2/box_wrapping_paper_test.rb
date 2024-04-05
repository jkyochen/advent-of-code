require 'minitest/autorun'
require_relative 'box_wrapping_paper.rb'

class BoxWrappingPaperTest < Minitest::Test

    def test_1
        assert_equal 58, BoxWrappingPaper.cal(2, 3, 4)
    end

    def test_2
        assert_equal 43, BoxWrappingPaper.cal(1, 1, 10)
    end

end
