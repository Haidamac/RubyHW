class RemoveAuthorIdFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :author_id, :bigint
  end
end
