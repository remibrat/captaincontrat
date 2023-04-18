class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :lp, default: 60
      t.integer :attack, default: 6

      t.timestamps
    end
  end
end
