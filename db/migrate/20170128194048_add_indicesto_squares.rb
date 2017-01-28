class AddIndicestoSquares < ActiveRecord::Migration[5.0]
  def change
  	change_table :squares do |t|
  		t.index :id 
  		t.index :position
  	end
  end
end
