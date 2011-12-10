class AddNumberToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :number, :integer
    add_column :episodes, :screen_cap, :string
  end
end
