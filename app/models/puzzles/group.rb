class Group 
	attr_reader :squares, :empty_squares, :missing_values

	def initialize(squares)
		@squares = squares
		@empty_squares = squares
		@missing_values = Array (1..squares.length)
	end

	def is_completed?
		@empty_squares.empty?
	end

	def update_empty_squares
		completed_squares = []
		@empty_squares.each do |square|
			if square.has_value?
				completed_squares << square
			end
		end
		@empty_squares -= completed_squares
	end

	def update_missing_values(value)
		@missing_values.delete(value)
	end

end