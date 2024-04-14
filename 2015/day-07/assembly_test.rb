require 'minitest/autorun'
require_relative 'assembly.rb'

class AssemblyTest < Minitest::Test

    def test_default
        assert_nil Assembly.provided_to(nil, "a")
        assert_nil Assembly.provided_to("", "a")
    end

    def xtest_simple_circuit

        circuit = <<~END
            123 -> x
            456 -> y
            x AND y -> d
            x OR y -> e
            x LSHIFT 2 -> f
            y RSHIFT 2 -> g
            NOT x -> h
            NOT y -> i
        END

        assert_equal 72, Assembly.provided_to(circuit, "d")
        assert_equal 507, Assembly.provided_to(circuit, "e")
        assert_equal 492, Assembly.provided_to(circuit, "f")
        assert_equal 114, Assembly.provided_to(circuit, "g")
        assert_equal 65412, Assembly.provided_to(circuit, "h")
        assert_equal 65079, Assembly.provided_to(circuit, "i")
        assert_equal 123, Assembly.provided_to(circuit, "x")
        assert_equal 456, Assembly.provided_to(circuit, "y")
    end

    def test_puzzle_input
        puzzle_input = File.read("puzzle_input.txt")
        assert_equal 46065, Assembly.provided_to(puzzle_input, "a")
        assert_equal 14134, Assembly.provided_to_part2(puzzle_input, "a")
    end

end
