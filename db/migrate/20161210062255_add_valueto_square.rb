class AddValuetoSquare < ActiveRecord::Migration[5.0]
  def change
  	change_table :squares do |t|
  		t.integer :value 
  	end
  end
end
