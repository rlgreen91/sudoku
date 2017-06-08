require 'test_helper'

class SolvePuzzleTest < ActiveSupport::TestCase
	include TestSetupHelpers

	test "solve an easy puzzle" do
		puzzle = puzzle_setup(:easy)
		SolvePuzzle.call(puzzle)

		#check for completeness and answewrs
		assert puzzle.is_complete?
		assert TestSetupHelpers::EASY_START_VALUES == puzzle.final_values
	end
end