class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user
      t.references :series

      t.timestamps
    end
    add_index :favorites, :user_id
    add_index :favorites, :series_id
  end
end
