class AddColumnsToRelation < ActiveRecord::Migration
  def change
  	add_column :articles, :user_id, :integer
  	add_column :comments, :user_id, :integer
  	add_column :comments, :article_id, :integer
  end
end
