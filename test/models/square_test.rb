require 'test_helper'

class SquareTest < ActiveSupport::TestCase
  test "creating new squares" do
  	# create a new square with position
  	puzzle = Puzzle.new()
  	square_with_position = Square.create(puzzle: puzzle, position: 1)
  	#assert square_with_position.save

  	# do not create a new square without position
  	square_without_position = Square.create(puzzle: puzzle)
  	#assert_not square_without_position.save
  end

  test "get square by position" do
  	puzzle = Puzzle.create()
  	#assert Square.get_by_position(puzzle, 2)
  end

  # test "update squares" do
  # 	#update a square with a valid integer value based on puzzle size
  # 	puzzle = Puzzle.new(size: 9)


end
