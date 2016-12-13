class AddReferencestoSquare < ActiveRecord::Migration[5.0]
  def change
  	change_table :squares do |t|
  		t.references :puzzle, index: true, foreign_key: true, type: :uuid
  	end
  end
end
