class Square < ApplicationRecord
	belongs_to :puzzle

	attr_accessor :puzzle
end
