class AddPositiontoSquare < ActiveRecord::Migration[5.0]
  def change
  	change_table :squares do |t|
  		t.string :position
  	end
  end
end
