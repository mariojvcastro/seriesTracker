class CreateEpisodes < ActiveRecord::Migration
  def self.up
    create_table :episodes do |t|
      t.string :name
      t.integer :number
      t.references :season
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :episodes
  end
end
