class CreateArticleAuthors < ActiveRecord::Migration
  def change
    create_table :article_authors do |t|
      t.integer :article_id
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
