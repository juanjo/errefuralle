class CreateSnippets < ActiveRecord::Migration
  def self.up
    create_table :snippets do |t|
      t.text :code
      t.references :user
      t.text :description
      t.integer :lines

      t.timestamps
    end
  end

  def self.down
    drop_table :snippets
  end
end
