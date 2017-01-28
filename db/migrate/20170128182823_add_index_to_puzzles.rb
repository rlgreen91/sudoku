class AddIndexToPuzzles < ActiveRecord::Migration[5.0]
  def change
  	change_table :puzzles do |t|
  		t.index :id
  	end
  end
end
