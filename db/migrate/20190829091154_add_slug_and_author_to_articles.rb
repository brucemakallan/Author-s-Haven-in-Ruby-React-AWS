class AddSlugAndAuthorToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :slug, :string
    add_index :articles, :slug, unique: true
    add_reference :articles, :author, index: true, foreign_key: { to_table: :users }
  end
end
