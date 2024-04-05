require 'minitest/autorun'
require_relative 'advent_coin.rb'

class AdventCoinTest < Minitest::Test

    def test_1
        assert_equal 609043, AdventCoin.mining("abcdef")
    end

    def test_2
        assert_equal 1048970, AdventCoin.mining("pqrstuv")
    end

end
