require 'minitest/autorun'
require_relative 'route.rb'

class RouteTest < Minitest::Test

    def test_basic
        data = <<~END
            London to Dublin = 464
            London to Belfast = 518
            Dublin to Belfast = 141
        END
        assert_equal 605, Route.new.pick_shortest(data)
    end

    def test_puzzle_input
        puzzle_input = File.read("puzzle_input.txt")
        assert_equal 251, Route.new.pick_shortest(puzzle_input)
    end
end
