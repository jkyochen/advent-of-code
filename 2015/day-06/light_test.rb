require 'minitest/autorun'
require_relative 'light.rb'

class LightTest < Minitest::Test

    def test_all_light_is_turn_off_in_start
        assert_equal 0, Light.deploy("")
    end

    def test_all_light_is_turn_on
        assert_equal 1000000, Light.deploy("turn on 0,0 through 999,999")
    end

    def test_toggle_some_light
        assert_equal 1000, Light.deploy("toggle 0,0 through 999,0")
    end

    def test_toggle_some_light_after_turn_on
        data = <<~END
            turn on 0,0 through 999,999
            toggle 0,0 through 999,0
        END
        assert_equal 1000000-1000, Light.deploy(data)
    end

    def test_turn_off_some_light
        data = <<~END
            turn on 0,0 through 999,999
            turn off 0,0 through 10,10
        END
        assert_equal 1000000-11*11, Light.deploy(data)
    end

    def test_multi_toggle
        data = <<~END
            turn on 0,0 through 999,999
            toggle 0,0 through 20,20
            toggle 0,0 through 15,15
            toggle 0,0 through 10,10
            toggle 0,0 through 5,5
            toggle 0,0 through 0,0
        END
        assert_equal 1000000-21*21+16*16-11*11+6*6-1*1, Light.deploy(data)
    end

    def test_instructions_from_santa
        data = <<~END
            turn on 0,0 through 999,999
            toggle 0,0 through 999,0
            turn off 499,499 through 500,500
        END
        assert_equal 1000000-1000-4, Light.deploy(data)
    end

    def test_turn_on_with_brightness
        assert_equal 1, Light.deploy_with_brightness("turn on 0,0 through 0,0")
    end

    def test_toggel_with_brightness
        assert_equal 2000000, Light.deploy_with_brightness("toggle 0,0 through 999,999")
    end

    def test_puzzle_input
        puzzle_input = File.read("puzzle_input.txt")
        assert_equal 377891, Light.deploy(puzzle_input)
        assert_equal 14110788, Light.deploy_with_brightness(puzzle_input)
    end
end
