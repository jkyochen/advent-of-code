require 'minitest/autorun'
require_relative 'would_be_no_math.rb'

class WouldBeNoMathTest < Minitest::Test

    def test_1
        assert_equal 58, WouldBeNoMath.calExactlyDimensions(2, 3, 4)
    end

    def test_2
        assert_equal 43, WouldBeNoMath.calExactlyDimensions(1, 1, 10)
    end

end
