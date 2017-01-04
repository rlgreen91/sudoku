class Square < ApplicationRecord
	belongs_to :puzzle

	before_save :validate_value

	validates :position, presence: true

	

	# Returns true if the value has been set, false if not
	def has_value?
		!self.value.blank?
	end

	private 

		# Validates that the value is nil or an integer between 1 and puzzle size
		def validate_value
			case self.value
			when nil
				true
			when Fixnum && 1..9
				true
			else
				throw :abort
			end
		end
end
