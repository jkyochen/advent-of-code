require 'minitest/autorun'
require_relative 'look_and_say.rb'

class LookAndSayTest < Minitest::Test
    def test_basic
        assert_equal 11, LookAndSay.say(1)
        assert_equal 21, LookAndSay.say(1, 2)
        assert_equal 1211, LookAndSay.say(1, 3)
        assert_equal 111221, LookAndSay.say(1, 4)
        assert_equal 312211, LookAndSay.say(1, 5)
    end

    def test_puzzle_input
        assert_equal 252594, LookAndSay.say(1113222113, 40).to_s.length
        assert_equal 3579328, LookAndSay.say(1113222113, 50).to_s.length
    end
end
