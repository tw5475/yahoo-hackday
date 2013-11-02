class AddFlickrPicsIntoPlaces < ActiveRecord::Migration
  def up
    add_column :places, :flickr_pics, :text
  end

  def down
    remove_column :places, :flickr_pics
  end
end
