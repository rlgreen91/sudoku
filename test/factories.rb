FactoryGirl.define do
	factory :puzzle do
		square_value_max 9
	end

	factory :square do
		puzzle_id 1
		position [1, 1]
	end
end