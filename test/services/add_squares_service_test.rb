require 'test_helper'

class AddSquareServiceTest < ActiveSupport::TestCase

	test "it adds squares to a new puzzle" do
		puzzle = FactoryGirl.create(:puzzle)
		AddSquares.call(puzzle)

		#ensure each square was created
		puzzle_id = puzzle.id
		puzzle_size = puzzle.square_value_max
		1.upto(puzzle_size) do |row|
			1.upto(puzzle_size) do |column|
				assert Square.where("puzzle_id = ? AND position = ARRAY[?]::integer[]", puzzle_id, [row, column]).exists?
			end
		end

		#ensure no extra squares were created
		bad_position = [puzzle_size, puzzle_size + 1]
		assert_not Square.where("puzzle_id = ? AND position = ARRAY[?]::integer[]", puzzle_id, bad_position).exists?
	end
end