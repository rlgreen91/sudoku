class Puzzle < ApplicationRecord
	has_many :squares, dependent: :destroy

	attr_accessor :size

	after_create do
		puzzle_size = size || 9
		1.upto(puzzle_size ** 2) do |position|
			self.squares.build(position: position)
		end
	end

	# Returns the square object when given the puzzle and position
	def get_square_by_position(puzzle_id, position)
		Square.find_by puzzle_id: puzzle_id, position: position
	end

end
