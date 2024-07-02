require 'minitest/autorun'
require_relative 'mfcsam.rb'

class CookieTest < Minitest::Test
    def test_basic
        ticker_tape = <<~'END'
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
        puzzle_input = File.read("puzzle_input.txt")
        assert_equal 103, MFCSAM.new(puzzle_input, ticker_tape).find()
    end

    def xtest_part2
    end
end
