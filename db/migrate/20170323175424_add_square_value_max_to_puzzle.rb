class AddSquareValueMaxToPuzzle < ActiveRecord::Migration[5.0]
  def change
  	change_table :puzzles do |t|
  		t.integer :square_value_max
  	end
  end
end
