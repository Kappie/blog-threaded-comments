class AddIdsToTaggings < ActiveRecord::Migration
  def change
    add_column :taggings, :post_id, :integer
    add_column :taggings, :tag_id, :integer
  end
end
