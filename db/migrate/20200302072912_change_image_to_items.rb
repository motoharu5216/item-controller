class ChangeImageToItems < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :image, :string
  end

  def down
    change_column :items, :image, :text
  end
end
