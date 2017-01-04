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
    puzzle_id = puzzle_square_check.id
    1.upto(puzzle_size) do |row|
    	1.upto(puzzle_size) do |column|
    		assert Square.where("puzzle_id = ? AND position = ARRAY[?]::integer[]", puzzle_id, [row, column]).exists?
    	end
    end

    # ensure that no extra squares were created
    bad_position = [puzzle_size + 1, 1]
    assert_not Square.where("puzzle_id = ? AND position = ARRAY[?]::integer[]", puzzle_id, bad_position).exists?
  end

  test "get squares by position" do
  	puzzle = FactoryGirl.create(:puzzle)
  	puzzle_id = puzzle.id
  	assert puzzle.get_square_by_position(puzzle_id, [2, 1])
  	assert_not puzzle.get_square_by_position(puzzle_id, [10, 1])
  end
end
