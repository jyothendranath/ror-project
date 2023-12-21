class Fixcolum < ActiveRecord::Migration[7.0]
  def change
    rename_column :categories, :name,:category_name
    rename_column :users, :name,:user_name
  end
end
