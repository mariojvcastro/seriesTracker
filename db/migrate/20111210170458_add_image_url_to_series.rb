class AddImageUrlToSeries < ActiveRecord::Migration
  def change
    add_column :series, :image_url, :string
  end
end
