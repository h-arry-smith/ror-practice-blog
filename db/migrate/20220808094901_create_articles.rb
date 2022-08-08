class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :body
      t.string :slug

      t.timestamps
    end

    add_index :articles, :slug, unique: true
  end
end
