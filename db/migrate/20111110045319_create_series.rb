class CreateSeries < ActiveRecord::Migration
  def self.up
    create_table :series do |t|
      t.string :name
      t.string :country

      t.timestamps
    end
  end

  def self.down
    drop_table :series
  end
end
