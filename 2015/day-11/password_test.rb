require 'minitest/autorun'
require_relative 'password.rb'

class PasswordTest < Minitest::Test
    def test_basic
        assert_equal "abcdffaa", Password.next("abcdefgh")
        assert_equal "ghjaabcc", Password.next("ghijklmn")
    end

    def test_puzzle_input
        next_pass = Password.next("cqjxjnds")
        assert_equal "cqjxxyzz", next_pass
        assert_equal "cqkaabcc", Password.next(next_pass)
    end
end
