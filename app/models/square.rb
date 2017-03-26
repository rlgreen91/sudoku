class Square < ApplicationRecord
	belongs_to :puzzle

	before_create :init
	after_validation :validate_value

	validates :position, presence: true
	validates :value, numericality: { only_integer: true}, 
					  allow_nil: true

	

	# Returns true if the value has been set, false if not
	def has_value?
		!self.value.blank?
	end

	private 

		# Sets value to nil if not specified
		def init
			self.value = nil
		end

		# Validates that the value is nil or a number between 1 and puzzle size
		def validate_value
			max_value = self.puzzle.square_value_max
			if self.value.nil? || self.value.between?(1, max_value)
				return true
			else
				raise ActiveRecord::RecordInvalid
			end
		end
end
