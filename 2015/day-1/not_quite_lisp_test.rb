require 'minitest/autorun'
require_relative 'not_quite_lisp'

class NotQuiteLispTest < Minitest::Test

    def test_empty
        assert_equal 0, NotQuiteLisp.take_santa_to_what_floor("")
    end

    def test_basic
        assert_equal 0, NotQuiteLisp.take_santa_to_what_floor("()")
    end

    def test_up_floor
        assert_equal 3, NotQuiteLisp.take_santa_to_what_floor("(((")
    end

    def test_down_floor
        assert_equal -3, NotQuiteLisp.take_santa_to_what_floor(")))")
    end

end
