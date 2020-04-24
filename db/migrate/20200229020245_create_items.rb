class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :count, null: false
      t.string :unit, null: false
      t.string :image
      t.timestamps
    end
  end
end