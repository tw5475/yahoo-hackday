class CreateUserPlaces < ActiveRecord::Migration
  def up
    create_table :user_places do |t|
      t.references :user
      t.references :place
      t.integer :vs_status
      t.timestamps
    end
  end

  def down
    drop_table :user_places
  end
end
