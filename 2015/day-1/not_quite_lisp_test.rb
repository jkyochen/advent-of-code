require 'minitest/autorun'
require_relative 'not_quite_lisp'

class NotQuiteLispTest < Minitest::Test

    def test_0
        assert_equal 0, NotQuiteLisp.take_santa_to_what_floor("")
        assert_equal 0, NotQuiteLisp.take_santa_to_what_floor("(())")
        assert_equal 0, NotQuiteLisp.take_santa_to_what_floor("()()")
    end

    def test_up_floor_3
        assert_equal 3, NotQuiteLisp.take_santa_to_what_floor("(((")
        assert_equal 3, NotQuiteLisp.take_santa_to_what_floor("(()(()(")
        assert_equal 3, NotQuiteLisp.take_santa_to_what_floor("))(((((")
    end

    def test_down_floor_1
        assert_equal -1, NotQuiteLisp.take_santa_to_what_floor("())")
        assert_equal -1, NotQuiteLisp.take_santa_to_what_floor("))(")
    end

    def test_down_floor_3
        assert_equal -3, NotQuiteLisp.take_santa_to_what_floor(")))")
        assert_equal -3, NotQuiteLisp.take_santa_to_what_floor(")())())")
    end

end
