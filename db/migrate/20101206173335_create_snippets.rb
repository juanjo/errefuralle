class CreateSnippets < ActiveRecord::Migration
  def self.up
    create_table :snippets do |t|
      t.string :title, :null => false
      t.text :code, :null => false
      t.references :user
      t.text :description
      t.integer :lines
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :snippets
  end
end
