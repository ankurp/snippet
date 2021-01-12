class AddPasswordToSnippet < ActiveRecord::Migration[6.1]
  def change
    add_column :snippets, :password, :string
  end
end
