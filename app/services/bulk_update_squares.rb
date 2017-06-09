class BulkUpdateSquares
	include Service

	def call(puzzle, values)
		values.each_pair do |position, value|
			square = puzzle.get_square_by_position(puzzle.id, position)
			square.update(value: value)
		end
		puzzle.check_completion
	end
end