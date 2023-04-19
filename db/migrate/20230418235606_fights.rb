class Fights < ActiveRecord::Migration[6.1]
  def change
    create_table :fights do |t|
      t.integer :character_id
      t.integer :opponent_id
      t.integer :winner_id

      t.timestamps
    end
  end
end
