require 'test_helper'

class PuzzleTest < ActiveSupport::TestCase
  test "create a new puzzle" do
  	# puzzle with explicit size
    puzzle_with_size = Puzzle.create(size: 9)
    assert puzzle_with_size.save

    # puzzle without explicit size
    puzzle_no_size = Puzzle.create()
    assert puzzle_no_size.save
  end


  test "check squares were created" do
    # ensure that the appropriate squares were created
    puzzle_size = 2
    puzzle_square_check = Puzzle.create(size: puzzle_size)
    puzzle_square_check.save
    puzzle_id = puzzle_square_check.id
    1.upto(puzzle_size ** 2) do |position|
    	assert Square.find_by puzzle_id: puzzle_id, position: position
    end

    # ensure that no extra squares were created
    bad_position = puzzle_size ** 2 + 1
    assert_not Square.find_by puzzle_id: puzzle_size, position: bad_position
  end
end
