class AddLikesToSnippet < ActiveRecord::Migration[6.1]
  def change
    add_column :snippets, :likes, :integer, default: 0
  end
end
