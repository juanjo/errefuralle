class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title, :null => false
      t.string :url
      t.text :content, :null => false
      t.text :content_html
      t.references :user
      t.timestamps
    end

    add_index :posts, :title

  end

  def self.down
    drop_table :posts
  end
end
