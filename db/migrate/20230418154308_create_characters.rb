class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :lp, default: 100
      t.integer :attack, default: 20
      t.integer :defense, default: 10

      t.timestamps
    end
  end
end
