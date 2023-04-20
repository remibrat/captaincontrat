class CharacterItems < ActiveRecord::Migration[6.1]
  def change
    create_table :character_items do |t|
      t.references :character, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end

    add_index :character_items, [:character_id, :item_id], unique: true
  end
end
