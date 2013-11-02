class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :u_name
      t.string :uuid
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
