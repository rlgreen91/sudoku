module TestSetupHelpers

	# Constants
	EASY_START_VALUES = { [1,1] => 4, [1,3] => 6, [1,4] => 1, [1,5] => 2, [1,6] => 5,
						  [2,3] => 3, [2,4] => 4, [2,8] => 9, [3,3] => 7, [3,6] => 3,
						  [3,7] => 6, [3,8] => 1, [3,9] => 4, [4,1] => 2, [4,3] => 4,
						  [4,9] => 7, [5,4] => 5, [5,5] => 8, [5,7] => 3, [5,9] => 6,
						  [6,1] => 3, [6,2] => 6, [6,9] => 9, [7,1] => 7, [7,2] => 3,
						  [7,3] => 9, [7,7] => 4, [8,2] => 5, [8,4] => 3, [8,5] => 4,
						  [8,6] => 1, [8,7] => 9, [9,4] => 9, [9,5] => 6, [9,7] => 5,
						  [9,9] => 3 }.freeze

	CHAL_START_VALUES = {}.freeze

	HARD_START_VALUES = {}.freeze

	# Completes puzzle with dummy values, with no regard for correctness
	def fill_puzzle(puzzle)
		puzzle.squares.each do |square|
			square.update(value: 1)
		end
	end

	def create_puzzle_with_squares
		puzzle = FactoryGirl.create(:puzzle)
		AddSquares.call(puzzle)
		return puzzle
	end

	def puzzle_setup(difficulty = :easy)
		puzzle = create_puzzle_with_squares
		values = 
			if difficulty == :easy
				EASY_START_VALUES
			elsif difficulty == :challenging
				CHAL_START_VALUES
			else
				HARD_START_VALUES
			end
		BulkUpdateSquares.call(puzzle, values)
		return puzzle
	end
end