class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :slot
      t.integer :attack, default: 0
      t.integer :lp, default: 0
      t.integer :defense, default: 0

      t.timestamps
    end
  end
end
