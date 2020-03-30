class ChangeImageToItems < ActiveRecord::Migration[5.2]
  def up
    change_column :Items, :image, :string
  end

  def down
    change_column :Items, :image, :text
  end
end
