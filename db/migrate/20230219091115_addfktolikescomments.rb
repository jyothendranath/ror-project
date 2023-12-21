class Addfktolikescomments < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :article, foreign_key: true
    add_reference :likes, :user, foreign_key: true
    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :article, foreign_key: true
  end
end
