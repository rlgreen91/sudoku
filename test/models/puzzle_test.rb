require 'test_helper'

class PuzzleTest < ActiveSupport::TestCase
  test "create a new puzzle with squares" do
    puzzle_with_size = Puzzle.create(size: 9)
    assert puzzle_with_size.save

    puzzle_no_size = Puzzle.create()
    assert puzzle_no_size.save
  end
end
