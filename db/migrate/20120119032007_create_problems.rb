class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :title
      t.text   :content
      t.integer :question_id
      t.integer :user_id
      t.timestamps
    end
  end
end
