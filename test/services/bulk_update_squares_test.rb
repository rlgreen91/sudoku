require 'test_helper'

class BulkUpdateSquaresTest < ActiveSupport::TestCase
	include TestSetupHelpers

	# create puzzle with empty squares, then create hash of squares to update 
	# with position of row 1, column 1-9 as keys; the value of each updated 
	# square should be its column number
	test "it updates multiple instances of squares" do
		puzzle = create_puzzle_with_squares
		squares_to_update = {}
		1.upto(9) do |value|
			position = [1, value]
			squares_to_update[position] = value
		end
		BulkUpdateSquares.call(puzzle, squares_to_update)
		squares_to_update.each_key do |position|
			square = puzzle.get_square_by_position(puzzle.id, position)
			assert_equal position[1], square.value
		end
	end
end