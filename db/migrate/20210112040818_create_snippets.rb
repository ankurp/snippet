class CreateSnippets < ActiveRecord::Migration[6.1]
  def change
    create_table :snippets, id: false do |t|
      t.string :name
      t.integer :expires_in
      t.text :snippet
      t.datetime :expires_at

      t.timestamps

      t.index :name, unique: true
    end
  end
end
