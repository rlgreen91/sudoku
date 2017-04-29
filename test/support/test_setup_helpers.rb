module TestSetupHelpers

	def create_puzzle_with_squares
		puzzle = FactoryGirl.create(:puzzle)
		AddSquares.call(puzzle)
		return puzzle
	end
end