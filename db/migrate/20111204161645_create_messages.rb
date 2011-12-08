class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :to
      t.references :from
      t.datetime :date
      t.string :subject
      t.text :content
      t.boolean :bdeleted_from, :default => false
      t.boolean :bdeleted_to, :default => false
      t.boolean :bread_from, :default => false
      t.boolean :bread_to, :default => false

      t.timestamps
    end
    add_index :messages, :to_id
    add_index :messages, :from_id
  end
  
  
  def self.down
    drop_table :messages
  end
end
