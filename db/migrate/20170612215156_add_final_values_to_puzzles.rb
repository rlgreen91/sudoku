class AddFinalValuesToPuzzles < ActiveRecord::Migration[5.0]
  def change
  	add_column :puzzles, :final_values, :json, null: false, default: {}
  end
end
