class CreatePlaces < ActiveRecord::Migration
  def up
    create_table :places do |t|
      t.string :p_name
      t.string :upid
      t.string :code_name
      t.float :lat
      t.float :lng
      t.text :info_desc
      t.string :info_source
      t.string :info_link
      t.timestamps
    end
  end

  def down
    drop_table :places
  end
end
