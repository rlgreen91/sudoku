require 'test_helper'

class PuzzleTest < ActiveSupport::TestCase
  include TestSetupHelpers

  test "create a new puzzle" do
  	# puzzle with explicit size
    puzzle_with_size = Puzzle.create(square_value_max: 9)
    assert puzzle_with_size.save

    # puzzle without explicit size
    puzzle_no_size = Puzzle.create()
    assert puzzle_no_size.save
  end

  test "get squares by position" do
  	puzzle = create_puzzle_with_squares
  	assert puzzle.get_square_by_position(puzzle.id, [2, 1])
  	assert_not puzzle.get_square_by_position(puzzle.id, [10, 1])
  end
end
