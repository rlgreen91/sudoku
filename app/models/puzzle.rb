class Puzzle < ApplicationRecord
	has_many :squares, dependent: :destroy

	after_initialize :init
	after_create :create_squares

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

		def create_squares
			1.upto(square_value_max) do |row|
				1.upto(square_value_max) do |column|
					self.squares.create(position: [row, column])
				end
			end
		end

end
