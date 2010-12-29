class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title, :null => false
      t.string :url
      t.text :content
      t.text :content_html      
      t.text :metadata
      t.string :name
      t.text :tags, :limit => 255
      t.references :user
      t.string :byline
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
