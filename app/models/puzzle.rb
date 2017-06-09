class Puzzle < ApplicationRecord
	has_many :squares, dependent: :destroy

	after_initialize :init

	def check_completion
		if !self.squares.find_by value: nil
			self.update(complete: true)
			@complete = true
		end
	end

	def complete?
		@complete ||= self.complete
	end

	# Returns the square object when given the puzzle and position
	# and false if it doesn't exist
	def get_square_by_position(puzzle_id, position)
		square = Square.where("puzzle_id = ? AND position = ARRAY[?]::integer[]", puzzle_id, position).to_a
		if !square.empty?
			square.first
		else
			false
		end
	end

	private

		def init
			self.square_value_max ||= 9
		end
end
