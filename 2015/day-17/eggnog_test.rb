require 'minitest/autorun'
require_relative 'eggnog.rb'

class EggnogTest < Minitest::Test

    PUZZLE_INPUT = File.read("puzzle_input.txt")

    def test_basic
        containers_size = <<~'END'
            20
            15
            10
            5
            5
        END
        assert_equal 4, Eggnog.new(containers_size, 25).combine
    end

    def test_puzzle_input
        assert_equal 4372, Eggnog.new(PUZZLE_INPUT, 150).combine
    end

end
