require 'minitest/autorun'
require_relative 'mfcsam.rb'

class CookieTest < Minitest::Test

    TICKER_TAPE = <<~'END'
        children: 3
        cats: 7
        samoyeds: 2
        pomeranians: 3
        akitas: 0
        vizslas: 0
        goldfish: 5
        trees: 3
        cars: 2
        perfumes: 1
    END

    PUZZLE_INPUT = File.read("puzzle_input.txt")

    def test_basic
        assert_equal 103, MFCSAM.new(PUZZLE_INPUT, TICKER_TAPE).find
    end

    def test_basic1
        assert_equal 103, MFCSAM.new(PUZZLE_INPUT, TICKER_TAPE).find1
    end
end
