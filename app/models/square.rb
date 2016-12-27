class Square < ApplicationRecord
	belongs_to :puzzle

	#before_save :validate_value

	validates :position, presence: true

	

	# Returns true if the value has been set, false if not
	def has_value?
		self.value.blank?
	end

	private 

		# Validates that the value is nil or an integer between 1 and puzzle size
		def validate_value
			if self.value.nil? || (1 <= self.value <= puzzle.size && self.value.integer?)
				true
			else
				throws :abort
			end
		end
end
