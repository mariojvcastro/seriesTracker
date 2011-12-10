class AddTvrageIdToSeries < ActiveRecord::Migration
  def change
    add_column :series, :tvrage_id, :integer
    add_column :series, :start_date, :string
    add_column :series, :end_date, :string
    add_column :series, :status, :string
    add_column :series, :runtime, :integer
  end
end
