class CreateSnippets < ActiveRecord::Migration
  def self.up
    create_table :snippets do |t|
      t.string :title, :null => false
      t.string :cached_slug
      t.text :code, :null => false
      t.references :user
      t.text :description
      t.integer :lines
      t.string :state

      t.timestamps
    end

    add_index :snippets, :title
    add_index :snippets, :cached_slug, :unique => true
  end

  def self.down
    drop_table :snippets
  end
end
