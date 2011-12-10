class RemoveYearFromSeasons < ActiveRecord::Migration
  def up
    remove_column :seasons, :year
    change_column :series, :start_date, :date
    change_column :series, :end_date, :date

  end

  def down
    add_column :seasons, :year, :date
  end
end
