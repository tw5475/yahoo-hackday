class CreateQaSets < ActiveRecord::Migration
  def up
    create_table :qa_sets do |t|
      t.references :place
      t.text :question
      t.string :answer_correct
      t.string :answer_wrong_1
      t.string :answer_wrong_2
    end
  end

  def down
    drop_table :qa_sets
  end
end
