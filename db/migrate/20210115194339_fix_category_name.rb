class FixCategoryName < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :username
    add_column :categories, :name, :string
  end
end
