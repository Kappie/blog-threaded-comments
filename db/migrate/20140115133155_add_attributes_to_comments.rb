class AddAttributesToComments < ActiveRecord::Migration
  def change
    add_column :comments, :author, :string
    add_column :comments, :body, :text
  end
end
