module Service
	extend ActiveSupport::Concern

	included do
		def self.call(*args)
			new.call(*args)
		end
	end
end

class AddSquares
	include Service

	def call(puzzle)
		1.upto(puzzle.square_value_max) do |row|
			1.upto(puzzle.square_value_max) do |column|
				Square.create(puzzle_id: puzzle.id, position: [row, column])
			end
		end
	end
end