class CreateSquares < ActiveRecord::Migration[5.0]
  def change
    create_table :squares, id: :uuid, default: 'gen_random_uuid()' do |t|

      t.timestamps
    end
  end
end
