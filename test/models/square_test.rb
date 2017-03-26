require 'test_helper'

class SquareTest < ActiveSupport::TestCase
  test "creating new squares" do
  	# create a new square with position
  	puzzle = FactoryGirl.create(:puzzle)
  	puzzle_id = puzzle.id
  	square_with_position = Square.create(puzzle_id: puzzle_id, position: [1,1])
  	assert square_with_position.save

  	# do not create a new square without position
  	square_without_position = Square.create(puzzle_id: puzzle_id)
  	assert_not square_without_position.save
  end

  test "update squares" do
  	# update a square with a valid integer value based on puzzle size
  	puzzle = FactoryGirl.create(:puzzle)
  	puzzle_id = puzzle.id
  	square = puzzle.get_square_by_position(puzzle_id, [1,1])
  	square.update(value: 1)
    assert_equal 1, square.value

  	# do not update a square with invalid integer value, non-numerical value, or non-integer
  	assert_raises(ActiveRecord::RecordInvalid) { square.update(value: 10) }
    assert_raises(ActiveRecord::RecordInvalid) { square.update(value: "a") }
    assert_raises(ActiveRecord::RecordInvalid) { square.update!(value: 1.5) }
  end

  test "basic methods" do
  	# tell me if the square has been assigned a value
  	puzzle = FactoryGirl.create(:puzzle)
  	puzzle_id = puzzle.id
  	square = puzzle.get_square_by_position(puzzle_id, [1,1])
  	assert_not square.has_value?
  	square.update(value: 2)
  	assert square.has_value?
  end

end
