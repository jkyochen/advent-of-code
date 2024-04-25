require 'minitest/autorun'
require_relative 'books.rb'

class BooksTest < Minitest::Test
    def test_basic
        assert_equal 6, Books.new.sum('[1,2,3]')
        assert_equal 6, Books.new.sum('{"a":2,"b":4}')
        assert_equal 3, Books.new.sum('[[[3]]]')
        assert_equal 3, Books.new.sum('{"a":{"b":4},"c":-1}')
        assert_equal 0, Books.new.sum('{"a":[-1,1]}')
        assert_equal 0, Books.new.sum('[-1,{"a":1}]')
        assert_equal 0, Books.new.sum('[]')
        assert_equal 0, Books.new.sum('{}')
    end

    def test_puzzle_input
        puzzle_input = File.read("puzzle_input.txt")
        assert_equal 191164, Books.new.sum(puzzle_input)
        assert_equal 87842, Books.new(["red"]).sum(puzzle_input)
    end
end
