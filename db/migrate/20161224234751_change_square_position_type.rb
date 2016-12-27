class ChangeSquarePositionType < ActiveRecord::Migration[5.0]
  def up
  	remove_column :squares, :position, :string
  	add_column :squares, :position, :integer, array: true
  	# change_table :squares do |t|
  	# 	t.change :position, "integer USING 'position'::integer[]", array: true
  	# end
  end

  def down
  	remove_column :squares, :position, :integer, array: true
  	add_column :squares, :position, :string
  end
end
