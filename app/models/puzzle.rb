class Puzzle < ApplicationRecord
	has_many :squares, dependent: :destroy

	attr_accessor :size

	after_create do
		puzzle_size = size || 9
		1.upto(puzzle_size) do |position|
			Square.create!(puzzle: self, position: position)
		end
	end

end
