class CreatePuzzles < ActiveRecord::Migration[5.0]
  def change
    create_table :puzzles, id: :uuid, default: 'gen_random_uuid()' do |t|

      t.timestamps
    end
  end
end
