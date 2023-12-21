class Commentscount < ActiveRecord::Migration[7.0]
  def change
    add_column :articles,:comment_count, :integer, :default =>0
  end
end
