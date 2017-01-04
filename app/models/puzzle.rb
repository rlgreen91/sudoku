class Puzzle < ApplicationRecord
	has_many :squares, dependent: :destroy

	attr_accessor :size

	after_create do
		puzzle_size = size || 9
		1.upto(puzzle_size) do |row|
			1.upto(puzzle_size) do |column|
				self.squares.create(position: [row, column])
			end
		end
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

end
