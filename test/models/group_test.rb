require 'test_helper'

class GroupTest < ActiveSupport::TestCase
	test "create a group" do
		puzzle = FactoryGirl.create(:puzzle)
		squares = []
		1.upto(puzzle.square_value_max) do |column|
			squares << puzzle.get_square_by_position(puzzle.id, [1, column])
		end
		row = Group.new(squares)
		assert row
		assert_equal row.squares, squares
	end

	test "group state" do
		# test that the group state is updated properly
		puzzle = FactoryGirl.create(:puzzle)
		max_value = puzzle.square_value_max
		factory_squares = []
		1.upto(max_value) do |column|
			factory_squares << puzzle.get_square_by_position(puzzle.id, [1, column])
		end
		row = Group.new(factory_squares)
		assert_not row.is_completed?
		assert_equal Array(1..max_value), row.missing_values

		row.squares.each_index do |number|
			square = row.squares[number]
			square.update(value: number + 1)
			row.update_missing_values(number + 1)
		end
		row.update_empty_squares
		assert row.is_completed?
		assert row.missing_values.empty?
	end
end