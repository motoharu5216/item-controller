class Drop < ActiveRecord::Migration[5.2]
  def change
    drop_table :groups
    drop_table :group_items
  end
end
