class CreateEpisodes < ActiveRecord::Migration
  def self.up
    create_table :episodes do |t|
      t.string :title
      t.date :inair
      t.references :season

      t.timestamps
    end
  end

  def self.down
    drop_table :episodes
  end
end
