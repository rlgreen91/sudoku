class AddCompleteToPuzzle < ActiveRecord::Migration[5.0]
 	def change
 		add_column :puzzles, :complete, :boolean, null: false, default: false
 	end
end
